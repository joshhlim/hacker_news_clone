class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.references :questioner, references: :users, index: true, null: false

      t.timestamps null: false
    end
  end
end
