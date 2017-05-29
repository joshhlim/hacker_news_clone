class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.float :price
      t.string :body
      t.string :email
      t.string :key
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
