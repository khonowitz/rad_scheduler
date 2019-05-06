class CreateRotations < ActiveRecord::Migration[5.2]
    def change
        create_table :rotations do |t|
            t.string :name
            t.integer :require_min
            t.integer :require_max
            t.timestamps
        end
        
        add_index :rotations, :name, unique: true
    end
end
