class Schedule::Generator

    def initialize
        @residents = Resident.all
        @rotations = Rotation.all.shuffle
    end

    def schedule_residents
        @residents.each { |resident| schedule resident }
    end

    private

    def schedule employee
        year = Date.today.year
        week = 1

        rotation_ctr = 1
        @rotations.cycle do |rotation|
            break if week > 52

            # Case where there are more employees than available rotations
            break if rotation_ctr > @rotations.length

            week_start_date = Date.commercial(year, week)
            if rotation.has_resident?(week_start_date)
                rotation_ctr += 1
                next
            else
                EmployeeRotation.create(employee_id: employee.id,
                                        rotation_id: rotation.id,
                                        start_date: week_start_date,
                                        week_num: week)
                week += 1
                rotation_ctr = 0
            end
        end
    end
end