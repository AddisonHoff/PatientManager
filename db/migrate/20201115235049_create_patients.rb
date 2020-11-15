class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.text :notes
      t.integer :age
      t.integer :oxygenlevel
      t.integer :doctor_id

      t.timestamps
    end
  end
end
