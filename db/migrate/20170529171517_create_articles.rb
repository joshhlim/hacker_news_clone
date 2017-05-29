class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :subject, null: false
      t.text :body, null: false
      t.string :email, null: false
      t.float :price, null: false
      t.string :edit_url
      t.integer :category_id

      t.timestamps
    end
  end
end
