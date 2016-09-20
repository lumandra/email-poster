class IncomingMailsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!

  def create
    user = User.find_by(email: params[:envelope][:from])
    raise "User with email #{params[:envelope][:from]} not found" if user.blank?

    report = user.reports.find_by(email_to: params[:envelope][:to])
    raise "Report with email_to #{params[:envelope][:to]} not found" if report.blank?

    email = user.emails.build(
      subject:     params[:headers]['Subject'],
      body:        params[:plain],
      attachments: params[:attachments].values,
      report:      report
    )

    if email.save
      render plain: 'success', :status => 200
    else
      raise email.errors.full_messages.join(', ')
    end

  rescue Exception => e
    render plain: 'error', :status => 400
  end
end
