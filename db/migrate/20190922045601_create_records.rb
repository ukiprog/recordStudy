class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.references :user
      t.timestamp :start, null: false
      t.timestamp :end, null: false
      t.references :subject
      t.string :comment
      t.timestamps
    end
  end
end
