class CreateBelongs < ActiveRecord::Migration[5.2]
  def change
    create_table :belongs do |t|
      t.references :user
      t.integer :year, null: false
      t.string :class, null: false
      t.timestamps
    end
  end
end
