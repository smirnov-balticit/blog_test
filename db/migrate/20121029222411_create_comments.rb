class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
    add_index :comments, :post_id
    add_index :comments, :user_id
    add_index :comments, :created_at
   end
end
