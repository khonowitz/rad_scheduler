class Rotation < ApplicationRecord

    #Associations
    has_many :employee_rotations
    has_many :employees, through: :employee_rotations

    def has_resident?(start_date)
        employee_rotations.where(start_date: start_date).present?
    end
end
