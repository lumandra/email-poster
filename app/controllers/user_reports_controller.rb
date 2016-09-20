class UserReportsController < ApplicationController
  def index
    @reports_list = Report.all
  end

  def subscribe
    report = Report.find(params[:user_report_id])
    message =
      if params[:subscribe] == 'true'
        report.users << current_user

        'Subscribed'
      else
        report.users.delete current_user

        'Unsubscribed'
      end

    render json: { errors: false, message: message }

  rescue Exception => e
    render json: { errors: e }
  end
end