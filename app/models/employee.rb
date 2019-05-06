class Employee < ApplicationRecord

    #Associations
    has_many :employee_rotations
    has_many :rotations, through: :employee_rotations

    #Validators
    validates :first_name, :last_name, presence: true
    validates :first_name, uniqueness: { scope: [:last_name, :pgy], message: "already added" }

    def available?(start_date)
         employee_rotations.where(start_date: start_date).empty?
    end

end
