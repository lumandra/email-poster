class IncomingMailsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!

  def create
    email = Email.new(
        subject:     params[:headers]['Subject'],
        body:        params[:plain],
        attachments: attachments,
        email_from:  params[:envelope][:from],
        images:      images_from_html
    )

    report = Report.find_by(email_to: params[:envelope][:to])

    if report.blank?
      msg = "Report with email_to #{params[:envelope][:to]} not found"

      email.status = 1
      email.error_message = msg
      email.save

      raise msg
    else
      email.report = report

      if email.save
        render plain: 'success', :status => 200
      else
        raise email.errors.full_messages.join(', ')
      end
    end

  rescue Exception => e
    p e
    render plain: 'error', :status => 400
  end


  private

  def images_from_html
    params[:html].scan(/img.*?src=\"(.*?)\"/i).map{|v| v[0]}
  end

  def attachments
    params[:attachments].present? ? params[:attachments].values : []
  end

end
