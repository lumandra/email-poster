require 'rails_helper'

RSpec.describe IncomingMailsController, type: :controller do

  routes { Rails.application.routes }

  describe 'POST #create' do
    let!(:from) { 'pecha7x@gmail.com' }
    let!(:to)   { '69f605a02e17db7923e8' }

    let!(:pdf)       { fixture_file_upload('test_pdf.pdf', 'application/pdf') }
    let!(:user)      { FactoryGirl.create :user, email: from, confirmed_at: DateTime.now }
    let!(:report)    { FactoryGirl.create :report, email_to: to , user_id: user.id }

    let(:reports)    { user.reports }
    let(:emails)     { user.emails }
    let(:subject)    { 'Daily report' }
    let(:params)     {
      {
       "plain"=>"Hehehehhe\n",
       "html"=>"<div dir=\"ltr\">Hehehehhe</div>\n",
       "reply_plain"=>"",
       "headers"=>{
         "Date"=>"Thu, 15 Sep 2016 12:20:17 +0300",
         "From"=>"Artoym P <#{from}>",
         "To"=>to+Report::EMAILTO_POSTFIX,
         "Message-ID"=>"<CAD8F-n41vEi2Lc2d5iOKkJrx_VyKF1MVO0VFgwb2JA9BxuNeNg@mail.gmail.com>",
         "Subject"=> subject,
       },
       "envelope"=>{
         "to"=>to+Report::EMAILTO_POSTFIX,
         "recipients"=>{"0"=>to+Report::EMAILTO_POSTFIX},
         "from"=>from,
         "helo_domain"=>"mail-oi0-f52.google.com",
         "remote_ip"=>"209.85.218.52",
         "spf"=>{"result"=>"neutral", "domain"=>"gmail.com"}
       },
       "attachments" => {
           "0"=> pdf
       }
      }
    }

    it 'upload emails and ensure report' do
      process :create, method: :post, params: params
      expect(response.status).to eq 200

      user.reload
      expect(emails.size).to eq 1
      expect(emails[0].subject).to eq subject
    end
  end
end
