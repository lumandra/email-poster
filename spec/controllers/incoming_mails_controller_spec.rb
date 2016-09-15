require 'rails_helper'

RSpec.describe IncomingMailsController, type: :controller do

  routes { Rails.application.routes }

  describe 'POST #create' do

    let!(:pdf)  { fixture_file_upload('test_pdf.pdf', 'application/pdf') }
    let!(:user) { FactoryGirl.create :user, email: 'pecha7x@gmail.com' }
    let(:params){
      {
       "plain"=>"Hehehehhe\n",
       "html"=>"<div dir=\"ltr\">Hehehehhe</div>\n",
       "reply_plain"=>"",
       "headers"=>{
         "Received"=>{
           "0"=>"by mail-oi0-f52.google.com with SMTP id w11so60877045oia.2 for <69f605a02e17db7923e8@cloudmailin.net>; Thu, 15 Sep 2016 02:22:05 -0700",
           "1"=>"by 10.157.39.101 with HTTP; Thu, 15 Sep 2016 02:20:17 -0700"
         },
         "Date"=>"Thu, 15 Sep 2016 12:20:17 +0300",
         "From"=>"Artoym P <pecha7x@gmail.com>",
         "To"=>"69f605a02e17db7923e8@cloudmailin.net",
         "Message-ID"=>"<CAD8F-n41vEi2Lc2d5iOKkJrx_VyKF1MVO0VFgwb2JA9BxuNeNg@mail.gmail.com>",
         "Subject"=>"Hellooooo",
       },
       "envelope"=>{
         "to"=>"69f605a02e17db7923e8@cloudmailin.net",
         "recipients"=>{"0"=>"69f605a02e17db7923e8@cloudmailin.net"},
         "from"=>"pecha7x@gmail.com",
         "helo_domain"=>"mail-oi0-f52.google.com",
         "remote_ip"=>"209.85.218.52",
         "spf"=>{"result"=>"neutral", "domain"=>"gmail.com"}
       },
       "attachments" => {
           "0"=> pdf
       }
      }
    }

    it 'redirect to new store path with success' do
      process :create, method: :post, params: params
      expect(response.status).to be 200

      user.reload
      expect(user.emails.size).to be 1
      expect(user.emails.size).to be 1
    end
  end
end
