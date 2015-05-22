require "test_helper"

class EvernoteclientTest < ActiveSupport::TestCase

    def setup
        # puts "here am I"
        # auth_token = Settings.evernote.dev_token
        # puts auth_token
        # User.create(auth_token: auth_token)
        @client = Evernoteclient.new
    end

     test "evernote_client_initable" do
        # client = Evernoteclient.new
        # puts client.note_store
        # puts client.note_store.nil?
        assert_not @client.note_store.nil?
        assert_not @client.user_store.nil?
        # puts @client.user_store.getUser.username
     end

     test "user_gettable" do
        # auth_token = Settings.evernote.dev_token
        # puts auth_token
        # client = Evernoteclient.new
        user = @client.get_evernote_user
        assert_not user.nil?
        assert_equal user.name, 'yuhangchaney'
     end

     test "notbook getable" do
        @client.get_sync_notebook

     end

     test "sync blog_db" do
        @client.sync_blog_db
     end
end
