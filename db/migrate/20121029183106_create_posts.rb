class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :ptitle
      t.text :content
      t.integer :user_id

      t.timestamps
    end
	add_index :posts, :user_id
    add_index :posts, :created_at
  end
end
