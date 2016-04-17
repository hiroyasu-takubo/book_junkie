class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :user_id
      t.integer :tag_id
      t.string :asin
      t.string :title
      t.string :author
      t.string :publisher
      t.string :image

      t.timestamps null: false
    end
  end
end
