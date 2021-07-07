class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.references :user
      t.string :feedback
      t.bigint :student_id
      t.datetime :feedback_at, null: false
      t.timestamps
    end
  end
end
