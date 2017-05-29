class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.float :price
      t.string :body
      t.string :email
      t.string :key
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
