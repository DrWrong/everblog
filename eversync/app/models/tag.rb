class Tag < ActiveRecord::Base

    def self.create_from_evernote(ever_tag)
        tag = self.new
        tag.guid = ever_tag.guid
        tag.name = ever_tag.name
        tag.save
        tag
    end
end
