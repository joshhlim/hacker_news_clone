class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :body, null: false
      t.references :question, index: true, foreign_key: true, null: false
      t.references :answerer, references: :users, index: true, null: false
      t.boolean :best_answer, default: false

      t.timestamps null: false
    end
  end
end
