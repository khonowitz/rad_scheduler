class Schedule::Exporter

    def initialize(spreadsheet_id = "1P2cYMVV_SP4wvQj2bNlFquLrc6KR-yjtWeymgieVfgY")
        @spreadsheet = fetch_spreadsheet(spreadsheet_id)
    end

    def export
        export_schedule
    end

    private

    def fetch_spreadsheet(spreadsheet_id)
        google_drive = GoogleDrive.saved_session(Rails.root.join('google_config.json').to_s)
        google_drive.spreadsheet_by_key(spreadsheet_id).worksheet_by_gid(0)
    end

    def export_schedule
        # List the start date of each week in the first column
        year = Date.today.year
        (1..52).each do |week_num|
            @spreadsheet[week_num + 1, 1] = Date.commercial(year, week_num)
        end

        # Populate schedule, each column is a different rotation
        Rotation.all.each_with_index do |rotation, column_index|
            @spreadsheet[1, column_index + 2] = rotation.name

            employee_rotations = EmployeeRotation.includes(:employee)
                                                 .where(rotation_id: rotation.id)
                                                 .order(:start_date)

            employee_rotations.each do |employee_rotation|
                @spreadsheet[employee_rotation.week_num + 1, column_index + 2] = employee_rotation.employee.first_name
            end
        end

        @spreadsheet.save
    end
end