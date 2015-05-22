class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, default: ''
      t.string :auth_token, default: ''
      t.string :notebook_name, default: 'tech'
      t.string :notebook_id, default: ''
      t.integer :evernote_id
      t.timestamps null: false
    end
    add_index :users, :auth_token, unique: true
    add_index :users, :evernote_id, unique: true
  end
end
