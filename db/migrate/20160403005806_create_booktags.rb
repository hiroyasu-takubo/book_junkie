class CreateBooktags < ActiveRecord::Migration
  def change
    create_table :booktags do |t|
      t.integer :user_id
      t.integer :book_id
      t.string :tag_name

      t.timestamps null: false
    end
  end
end
