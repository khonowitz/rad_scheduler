class EmployeeRotation < ApplicationRecord

    #Associations
    belongs_to :employee
    belongs_to :rotation 

end
