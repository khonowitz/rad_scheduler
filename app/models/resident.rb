class Resident < Employee

    #Validators
    validates :pgy, inclusion: { in: 2..5 }
end
