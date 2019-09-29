class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :user
      t.references :subject
      t.text :question, null: false
      t.timestamps
    end
  end
end
