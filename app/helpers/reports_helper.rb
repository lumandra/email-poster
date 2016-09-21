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
    image_tag "https://process.filestackapi.com/AS6blLW1pSyaEm0kfBKmEz/output=format:jpg,density:30/#{image_url(image_path)}",
              class: 'img-rounded'
  end

  private

  def image_url image_path
    request.protocol + request.host_with_port + image_path
  end
end
