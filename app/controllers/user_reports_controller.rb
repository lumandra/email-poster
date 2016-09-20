class UserReportsController < ApplicationController
  def index
    @reports_list = Report.all
  end

  def subscribe
    report = Report.find(params[:user_report_id])
    if params[:subscribe] == 'true'
      report.users << current_user
    else
      report.users.delete current_user
    end

    render json: { errors: false }

  rescue Exception => e
    render json: { errors: e }
  end
end