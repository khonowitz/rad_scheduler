class AddTypeToEmployees < ActiveRecord::Migration[5.2]
    def change
        add_column :employees, :type, :string
    end
end