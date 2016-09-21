class IncomingMailsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!

  def create
    email = Email.create(
        subject:     params[:headers]['Subject'],
        body:        params[:plain],
        attachments: params[:attachments].values,
    )

    report = Report.find_by(email_to: params[:envelope][:to])

    if report.blank?
      er = "Report with email_to #{params[:envelope][:to]} not found"

      email.status = 'error'
      email.error_messages = er
      email.save

      raise er
    else
      email.report = report

      if email.save
        render plain: 'success', :status => 200
      else
        raise email.errors.full_messages.join(', ')
      end
    end
    



  rescue Exception => e
    render plain: 'error', :status => 400
  end
end
