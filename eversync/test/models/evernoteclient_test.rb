require "test_helper"

class EvernoteclientTest < ActiveSupport::TestCase
     test "evernote_client_initable" do
        client = Evernoteclient.new
        # puts client.note_store
        # puts client.note_store.nil?
        assert_not client.note_store.nil?
     end
end
