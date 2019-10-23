class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :post_text
      t.integer :poster_id
      t.integer :postee_id
      t.datetime :posted_at
      t.timestamps
    end

    add_index :posts, :poster_id
    add_index :posts, :postee_id
    add_index :posts, :posted_at
    add_index :posts, [:poster_id, :postee_id]
  end
end
