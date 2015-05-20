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
end

