require 'rails_helper'

RSpec.describe IncomingMailsController, type: :controller do

  routes { Rails.application.routes }

  describe 'POST #create' do
    let!(:from) { 'pecha7x@gmail.com' }
    let!(:to)   { '69f605a02e17db7923e8' }

    let!(:pdf)       { fixture_file_upload('test2_pdf.pdf', 'application/pdf') }
    let!(:pdf2)       { fixture_file_upload('test_pdf.pdf', 'application/pdf') }
    let!(:user)      { FactoryGirl.create :user, email: from, confirmed_at: DateTime.now }
    let!(:report)    { FactoryGirl.create :report, email_to: to , user_id: user.id }

    let(:reports)    { user.reports }
    let(:emails)     { user.emails }
    let(:subject)    { 'Daily report' }
    let(:params)     {
      {
       "plain"=>"Hehehehhe\n",
       "html"=>"<div dir=\"ltr\"><br><div class=\"gmail_quote\">---------- Forwarded message ----------<br>From: <b class=\"gmail_sendername\">Mike Smith</b> <span dir=\"ltr\"><<a href=\"mailto:mike.smith@rollbar.com\">mike.smith@rollbar.com</a>></span><br>Date: 2016-10-18 19:48 GMT+03:00<br>Subject: Better Monitoring Workflow: Rollbar + Atlassian<br>To: <a href=\"mailto:pecha7x@gmail.com\">pecha7x@gmail.com</a><br><br><br><u></u>\n\n\n\n\n \n \n \n \n \n\n\n<div style=\"height:100%!important;width:100%!important;margin:0;padding:0\">\n\n \n <img src=\"http://ads.perfectaudience.com/seg?add=2855398&t=2\" width=\"1\" height=\"1\" border=\"0\" style=\"height:auto;line-height:100%;outline:none;text-decoration:none;border:0\">\n \n\n \n <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse:collapse!important\">\n <tbody><tr>\n <td bgcolor=\"#ffffff\" align=\"center\" style=\"padding:15px\" class=\"m_-5868566345488968906section-padding\">\n \n <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:500px;border-collapse:collapse!important\" class=\"m_-5868566345488968906responsive-table\">\n <tbody><tr>\n <td>\n <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse:collapse!important\">\n <tbody><tr>\n <td>\n \n <span class=\"m_-5868566345488968906preheader\" style=\"display:none!important;opacity:0;color:transparent;height:0;width:0\">Developers rejoice! Debugging errors just got a lot easier. Say hello to Rollbar for JIRA, HipChat, Bitbucket.<br></span>\n \n <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border-collapse:collapse!important\">\n <tbody><tr>\n <td align=\"center\" style=\"font-size:16px;line-height:28px;font-family:Helvetica,Arial,sans-serif;color:#666666;padding:25px 0 0\" class=\"m_-5868566345488968906padding-copy\"><img src=\"https://d26gfdfi90p7cf.cloudfront.net/rollbar-large-logo.144769.44768x14476x0.8xfal\" width=\"172\" style=\"height:auto;line-height:100%;outline:none;text-decoration:none;padding:0 0 6px 0px;border:0\" class=\"m_-5868566345488968906logo\"></td>\n </tr>\n <tr>\n<td align=\"left\" style=\"font-size:16px;line-height:28px;font-family:Helvetica,Arial,sans-serif;color:#666666;padding:30px 0 0\" class=\"m_-5868566345488968906padding-copy\">Good news @! Debugging errors just got a lot easier. Say hello to <a href=\"https://rollbar.com/integrations/atlassian/?utm_campaign=atlassian-blog-post&utm_content=atlassian-blog-post&utm_medium=email&utm_source=atlassian-blog-post\" target=\"_blank\">Rollbar for Atlassian</a>. Take your monitoring to the next level and maintain your existing workflow and tools by integrating Rollbar with <a href=\"https://rollbar.com/docs/jira/?utm_campaign=atlassian-blog-post&utm_content=atlassian-blog-post&utm_medium=email&utm_source=atlassian-blog-post\" target=\"_blank\">JIRA</a>, <a href=\"https://rollbar.com/docs/hipchat/?utm_campaign=atlassian-blog-post&utm_content=atlassian-blog-post&utm_medium=email&utm_source=atlassian-blog-post\" target=\"_blank\">HipChat</a> and <a href=\"https://rollbar.com/docs/bitbucket/?utm_campaign=atlassian-blog-post&utm_content=atlassian-blog-post&utm_medium=email&utm_source=atlassian-blog-post\" target=\"_blank\">Bitbucket</a>.\n</td>\n </tr>\n <tr>\n <td colspan=\"5\" align=\"center\" style=\"padding:20px 0\">\n <div>\n <a href=\"https://rollbar.com/integrations/atlassian/?utm_campaign=atlassian-blog-post&utm_content=atlassian-blog-post&utm_medium=email&utm_source=atlassian-blog-post\" target=\"_blank\"><img title=\"A better error monitoring workflow Rollbar + Atlassian\" alt=\"A better error monitoring workflow Rollbar + Atlassian\" src=\"https://d26gfdfi90p7cf.cloudfront.net/rollbar-atlassian-video.154404.54403x15440x0.3xfal\" width=\"500\" align=\"center\" style=\"height:auto;line-height:100%;outline:none;text-decoration:none;border:0\"></a>\n </div>\n </td>\n </tr>\n <tr>\n <td colspan=\"5\" align=\"center\" style=\"padding:20px 0\">\n <div>\n <a class=\"m_-5868566345488968906button\" href=\"https://rollbar.com/blog/better-monitoring-workflow-atlassian-plus-rollbar/?utm_campaign=atlassian-blog-post&utm_content=atlassian-blog-post&utm_medium=email&utm_source=atlassian-blog-post\" style=\"border-radius:4px;color:#ffffff;display:inline-block;font-family:sans-serif;font-weight:normal;font-size:15px;line-height:52px;text-align:center;text-decoration:none;width:440px;background:#1a67b6\" target=\"_blank\">See how Rollbar and Atlassian's products work together →</a>\n</div>\n </td>\n </tr>\n\n <tr>\n
» 25 Oct 2016 15:37:42.656 <td align=\"left\" style=\"font-size:16px;line-height:28px;font-family:Helvetica,Arial,sans-serif;color:#666666;padding:20px 0 0\" class=\"m_-5868566345488968906padding-copy\">What makes this really nifty, is you can now keep tabs on your application directly within the tools you're already using to build it. No more switching between multiple tools and services to debug and deploy code. Creating a seamless user experience and unified workflow around errors.</td>\n </tr>\n <tr>\n <td align=\"left\" style=\"font-size:16px;line-height:28px;font-family:Helvetica,Arial,sans-serif;color:#666666;padding:20px 0 0\" class=\"m_-5868566345488968906padding-copy\">If you have questions or need help configuring our latest integrations, just reply to this email. Happy to help! :-)</td>\n </tr>\n <tr>\n <td align=\"left\" style=\"font-size:16px;line-height:28px;font-family:Helvetica,Arial,sans-serif;color:#666666;padding:20px 0 0\" class=\"m_-5868566345488968906padding-copy\">~ The Rollbar Team</td>\n </tr>\n <tr>\n <td align=\"left\" style=\"font-size:16px;line-height:28px;font-family:Helvetica,Arial,sans-serif;color:#666666;padding:20px 0 0\" class=\"m_-5868566345488968906padding-copy\"><i>P.S. Over 50,000 developers ♥ Rollbar, including companies like Twilio, Kayak, Salesforce, Zendesk, Heroku and more. <a href=\"https://rollbar.com/why-rollbar/?utm_campaign=atlassian-blog-post&utm_content=atlassian-blog-post&utm_medium=email&utm_source=atlassian-blog-post\" style=\"font-weight:normal;color:#1a67b6\" target=\"_blank\"><br>Want to learn more? Let's talk</a>.</i></td>\n
» 25 Oct 2016 15:37:42.727 4467 <190>1 2016-10-25T12:37:42.366504+00:00 app web.1 - - </tr>\n \n\n </tbody></table>\n </td>\n </tr>\n </tbody></table>\n </td>\n </tr>\n </tbody></table>\n \n </td>\n </tr>\n\n <tr>\n <td bgcolor=\"#ffffff\" align=\"center\" style=\"padding:20px 0px\">\n \n \n <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" style=\"max-width:500px;border-collapse:collapse!important\" class=\"m_-5868566345488968906responsive-table\">\n <tbody><tr>\n <td style=\"border-collapse:collapse\">\n <p class=\"m_-5868566345488968906description\" style=\"color:#9d9d9d;font-family:'Helvetica Neue',Helvetica,Arial,sans-serif;font-size:11px;line-height:22px;text-align:center\" align=\"center\">\n 2‌21 Main Street, Ste 780 • San Francisco, CA • 94105  |  Want out of the loop?\n <a href=\"http://cemail.rollbar.com/unsubscribe/MjE5MDc6Fqm2AmQAAnMAFr6uGgFWCj_bDBUcGFgGUiwBbTo0MDE4NTEA\" style=\"font-weight:normal;color:#9d9d9d;text-decoration:underline;word-break:break-word\" target=\"_blank\">Unsubscribe</a><br>Follow us on <a href=\"https://twitter.com/rollbar\" style=\"font-weight:normal;color:#9d9d9d;text-decoration:underline;word-break:break-word\" target=\"_blank\"> Twitter</a> •\n <a href=\"https://rollbar.com/blog/\" style=\"font-weight:normal;color:#9d9d9d;text-decoration:underline;word-break:break-word\" target=\"_blank\">Our Blog</a> •\n <a href=\"https://github.com/rollbar\" style=\"font-weight:normal;color:#9d9d9d;text-decoration:underline;word-break:break-word\" target=\"_blank\">GitHub</a>\n </p>\n <br><br>\n </td>\n </tr>\n </tbody></table>\n \n </td>\n </tr>\n </tbody></table>\n\n</div>\n\n\n</div><br></div>\n",
       "reply_plain"=>"",
       "headers"=>{
         "Date"=>"Thu, 15 Sep 2016 12:20:17 +0300",
         "From"=>"Artoym P <#{from}>",
         "To"=>to+Report::EMAILTO_POSTFIX,
         "Message-ID"=>"<CAD8F-n41vEi2Lc2d5iOKkJrx_VyKF1MVO0VFgwb2JA9BxuNeNg@mail.gmail.com>",
         "Subject"=> subject,
         "Mime-Version"=>"1.0",
         "DKIM-Signature"=>"v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113; h=mime-version:in-reply-to:references:from:date:message-id:subject:to; bh=qVvoJTKb/CHmcanwq0y6C9qbZAChDczFTosk1Ww4Yjk=; b=h/R15Fzyt+lN9DBiRqTxgxVZqsgezrKQJ3VzkjSOesDEKqx4EaPzeGx2zVv2f89FOA egg7Pd8utXj+XOp8rpCpYDdirsKFsmAXc4bNiDkV9b3ltNwLkU6KYRwiix0N4z2T8lUh TI4Ei3gEvAMLu1aRFG77dgVL2PwTGdFoqL4qlAWJYSZOUBXgBccn6IjVOwp3N5Fg60k5 mYiHIzF4V34AmOVWEb6VgBYPVIYGIFnc+4Sq3DF/8cesKDZ4dbMsotUk9bB6xF3QSrkG v+ltqsKMm31uWog06s9u2OIDOjG0DyWo5Y49FMBUU/AIfBWIJmEf2zYzffxJLliLgBZ1 UysA==", "X-Google-DKIM-Signature"=>"v=1; a=rsa-sha256; c=relaxed/relaxed; d=1e100.net; s=20130820; h=x-gm-message-state:mime-version:in-reply-to:references:from:date :message-id:subject:to; bh=qVvoJTKb/CHmcanwq0y6C9qbZAChDczFTosk1Ww4Yjk=; b=JfUMSoIKQ4h0HiBsmnn4JPxxPXvpqE+mTq/IcqklAsHuBNY8KrM4as1zH1X12m8gDT vt0n9zUAVgrRtQu6nLfc2XC9xsoj4M44c8VCaZCaL/tASLAsSU/vQn7vps51DV3jv+fH gE0+vwL+t+ApNj6VfG5NGk4lE9lfbIu6wg2RLeH3UQoYjoEr1407IJK4FikOVbydL+Ug sYf70ruOsUcgNAZHCkPhSpby9PuXN5PViECWCzlePjA0FjKbQnT3NWKU9j6PeSzqYYtZ i8KpqyI/ePsUICpX47Qe8zNQPhEaRdrQEBrGsl5h3tILVecUbkwW7+zMPesXoicaDkHQ bA5Q==", "X-Gm-Message-State"=>"ABUngvdefRvach9rA6d52ZXe6c9aYjrHTRi9QP3mv7lz59OsDWAJxUqlAImz2azpzsh3MvNLisvoP/x1IXimNQ=="
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
           "0"=> pdf,
           "1"=> pdf2
       }
      }
    }

    it 'upload emails and ensure report' do
      VCR.use_cassette('email') do
        process :create, method: :post, params: params
        expect(response.status).to eq 200

        user.reload
        expect(emails.size).to eq 1
        expect(emails[0].subject).to eq subject
      end
    end

    it 'save attachments in filestack cdn' do
      VCR.use_cassette('img_urls') do
        process :create, method: :post, params: params
        expect(response.status).to eq 200

        user.reload
        expect(emails[0].img_urls.size).to eq 4
        expect(emails[0].img_urls.last['url'].include?('https://cdn.filestackcontent.com')).to be true
      end
    end
  end
end

