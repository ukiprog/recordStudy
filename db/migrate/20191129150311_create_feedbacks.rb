class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.references :user
      t.string :comment
      t.string :student_jd
      t.datetime :comment_at, null: false
      t.timestamps
    end
  end
end
