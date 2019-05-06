class CreateEmployeeRotations < ActiveRecord::Migration[5.2]
    def change
        create_table :employee_rotations do |t|
            t.integer :employee_id
            t.integer :rotation_id
            t.date :start_date
            t.timestamps
        end
        
        add_index :employee_rotations, [:employee_id, :rotation_id, :start_date], unique: true, name: 'index_employee_rotation_date'
    end
end
