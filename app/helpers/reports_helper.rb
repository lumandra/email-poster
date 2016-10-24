require "uri"
require "net/http"

module ReportsHelper
  def user_images user
    content_tag :div, class: 'row user-images' do
      user.emails.each do |email|
        email.attachments.each do |attach|
          concat user_image attach.url
        end
      end
    end
  end

  def user_image image_path
    image_tag "https://process.filestackapi.com/#{TestApp::Application.config.filestack_api_secret}/output=format:jpg,density:30/#{image_url(image_path)}",
              class: 'img-rounded'
  end

  private

  def image_url image_path
    TestApp::Application.config.host + image_path
  end
end


