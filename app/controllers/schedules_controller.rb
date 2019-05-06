class SchedulesController < ApplicationController
    
    def generate
        Schedule::Generator.new.schedule_residents
        render json: { message: "Residents scheduled" }
    end

    def export
        Schedule::Exporter.new.export
        render json: { message: "Schedule exported" }
    end
end
