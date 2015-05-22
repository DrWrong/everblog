class Evernoteclient
    attr_reader :note_store, :user_store
    def initialize(auth_token='')
        if auth_token.empty?
            auth_token = Settings.evernote.dev_token
        end
        @auth_token = auth_token
        @client =  EvernoteOAuth::Client.new(
            token: auth_token,
            customer_key: Settings.evernote.customer_key,
            consumer_secret: Settings.evernote.customer_secret,
            sandbox: Settings.evernote.sandbox)
        @note_store = @client.note_store
        @user_store = @client.user_store
    end

    def get_evernote_user
        user = User.find_by(auth_token: @auth_token)
        if user.nil?
            raise 'user not found'
        end
        user.evernote_id = @user_store.getUser.id if user.evernote_id.nil?
        user.name = @user_store.getUser.username if user.name.empty?
        user.save
        # puts user.save!
        user
    end

    def get_sync_notebook
        user = get_evernote_user
        if user.notebook_id.empty?
            @note_store.listNotebooks.each do |notebook|
                # Rails.logger.debug notebook.class
                Rails.logger.debug notebook.name
                if notebook.name.eql?(user.notebook_name)
                    user.notebook_id = notebook.guid
                    user.save
                    return user.notebook_id
                    # found = true
                    # break
                end
            end
            raise "notbook notfound"
        end
        user.notebook_id
    end

    def sync_notes
        notebookId = get_sync_notebook
        filter = Evernote::EDAM::NoteStore::NoteFilter.new(notebookGuid: notebookId)
        noteCollectionCounts = @note_store.findNoteCounts(filter, false)
        # puts noteCollectionCounts.notebookCounts
        count = 0
        if noteCollectionCounts.notebookCounts.has_key?(notebookId)
            count = noteCollectionCounts.notebookCounts[notebookId]
        end
        offset = 0
        notes_metadata_result_spec = Evernote::EDAM::NoteStore::NotesMetadataResultSpec.new(
                includeTitle: true,
                includeContentLength: false,
                includeCreated: false,
                includeUpdated: false,
                includeDeleted: false,
                includeUpdateSequenceNum: true,
                includeNotebookGuid: false,
                includeTagGuids: true,
                includeAttributes: false,
                includeLargestResourceMime: false,
                includeLargestResourceSize: false,
            )

        while offset < count
            notes_metadata_list =  @note_store.findNotesMetadata(
                filter, offset, Settings.max_notes, notes_metadata_result_spec)
            notes_metadata_list.notes.each do |note_metadata|
                yield note_metadata
            end
            offset +=  Settings.max_notes
        end
    end

    def sync_blog_db
        sync_notes do |note_metadata|
            guid = note_metadata.guid
            blog = Blog.find_by(guid: guid)
            if blog.nil?
                blog = Blog.new
                blog.title = note_metadata.title
                blog.update_sequence_num = note_metadata.updateSequenceNum
                blog.user = get_evernote_user
                # tag guid may be null
                unless note_metadata.tagGuids.nil?
                    note_metadata.tagGuids.each do |tag_guid|
                        tag = get_or_create_tag(tag_guid)
                        blog.tags << tag
                    end
                end
                blog.content = get_content(guid)
                blog.save
            else
                unless blog.update_sequence_num.eql?(note_metadata.updateSequenceNum)
                    blog.content = get_content(guid)
                    unless note_metadata.tagGuids.nil?

                        note_metadata.tagGuids.each do |tag_guid|
                            unless blog.tags.include?(get_or_create_tag(tag_guid))
                                blog.tags << tag
                            end
                        end
                    end
                    blog.save
                end
            end
            puts blog.content
        end
    end

    def get_content(guid)
        @note_store.getNoteContent(guid)
    end

    def get_or_create_tag(tag_guid)
        tag = Tag.find_by(guid: tag_guid)
        if tag.nil?
            tag = Tag.create_from_evernote(@note_store.getTag(tag_guid))
        end
        tag
    end
end

