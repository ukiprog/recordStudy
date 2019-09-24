class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.references :user
      t.datetime :start, null: false
      t.datetime :end, null: false
      t.references :subject
      t.string :comment
      t.timestamps
    end
  end
end
