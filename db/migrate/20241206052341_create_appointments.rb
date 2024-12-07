class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.integer :user_id
      t.datetime :slot
      t.string :patient_name
      t.string :patient_number
      t.string :address 

      t.timestamps
    end
  end
end
