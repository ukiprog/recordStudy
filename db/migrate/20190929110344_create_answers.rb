class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :user
      t.references :question
      t.text :answer, null: false
      t.timestamps
    end
  end
end
