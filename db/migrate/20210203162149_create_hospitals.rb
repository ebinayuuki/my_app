class CreateHospitals < ActiveRecord::Migration[6.0]
  def change
    create_table :hospitals do |t|
      t.string :name, null: false
      t.string :department, null: false
      t.integer :postal, null: false
      t.integer :ken_id, null: false
      t.text :info, null: false
      t.string :time, null: false
      t.references :doctor, null: false, foreign_key: true
      t.timestamps
    end
  end
end