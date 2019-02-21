class AttendanceListMailer < ApplicationMailer
    default from: ENV['EMAIL_USER']

    def missing_email
        @data = params[:data]
        @type = params[:type]
        @missing = params[:missing]
        mail(to: params[:admin], subject: "FALTAS - #{@type} - #{@data}")
    end
end
