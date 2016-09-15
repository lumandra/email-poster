class IncomingMailsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!

  def create
    user = User.find_by(email: params[:envelope][:from])

    email = user.emails.build(
        subject:     params[:headers]['Subject'],
        body:        params[:plain],
        attachments: params[:attachments].values
    )

    if email.save
      render plain: 'success', :status => 200
    else
      render plain: 'error', :status => 400
    end
  end
end
