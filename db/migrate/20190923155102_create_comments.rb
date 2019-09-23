class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user
      t.string :comment
      t.timestamp :comment_at, null: false
      t.timestamps
    end
  end
end
