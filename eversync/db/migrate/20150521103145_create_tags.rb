class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name, default: ''
      t.string :guid, default: ''
      t.timestamps null: false
    end
    add_index :tags, :guid,  unique: true
  end
end
