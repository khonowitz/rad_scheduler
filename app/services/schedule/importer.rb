class Schedule::Importer

    def perform(spreadsheet_id = "1Ox-aFv-KTMFACh0WRhEnShlSlLL4rcoinN6GhAs_nDA")
        @spreadsheet = fetch_spreadsheet(spreadsheet_id)

        process_schedule
    end

    private

    def fetch_spreadsheet(spreadsheet_id)
        google_drive = GoogleDrive.saved_session(Rails.root.join('google_config.json').to_s)
        google_drive.spreadsheet_by_key(spreadsheet_id).worksheet_by_gid(0)
    end

    def process_schedule
        @spreadsheet.rows(1).map do |row|
            next unless importable_row?(row)
            Employee.create(first_name: row[0], last_name: row[1], pgy: row[2])
        end.compact
    end
    
    def importable_row?(row)
        row[0].present? && row[1].present? && row[2].present?
    end
end
