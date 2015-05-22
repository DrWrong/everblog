class User < ActiveRecord::Base
    validates :auth_token, uniqueness:true

    def get_notebook_id
        client = Evernoteclient.new
        client.get_sync_notebook
        notebook_id
    end
end
