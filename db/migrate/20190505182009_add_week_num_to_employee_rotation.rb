class AddWeekNumToEmployeeRotation < ActiveRecord::Migration[5.2]
    def change
      add_column :employee_rotations, :week_num, :integer
    end
end
