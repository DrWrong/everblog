class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs  do |t|
      t.string :title, default: ''
      t.text :content
      t.boolean :published, default: false
      t.string :guid, default: ''
      t.integer :update_sequence_num
      t.references :user
      t.timestamps null: false

    end
    add_index :blogs, :guid, unique: true
    # add_foreign_key :blogs, :users
  end
end
