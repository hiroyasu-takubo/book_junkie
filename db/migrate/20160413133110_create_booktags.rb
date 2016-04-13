class CreateBooktags < ActiveRecord::Migration
  def change
    create_table :booktags do |t|
      t.integer :book_id
      t.integer :tag_id

      t.timestamps null: false
    end
  end
end
