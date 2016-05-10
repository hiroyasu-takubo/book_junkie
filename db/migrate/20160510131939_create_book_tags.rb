class CreateBookTags < ActiveRecord::Migration
  def change
    create_table :book_tags do |t|
      t.integer :book_id
      t.integer :tag_id

      t.timestamps null: false
    end
  end
end
