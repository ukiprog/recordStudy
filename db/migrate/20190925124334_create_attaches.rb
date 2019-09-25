class CreateAttaches < ActiveRecord::Migration[5.2]
  def change
    create_table :attaches do |t|
      t.references :user
      t.integer :year, null: false
      t.string :attach, null: false
      t.timestamps
    end
  end
end
