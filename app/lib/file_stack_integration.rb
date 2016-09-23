require "net/http"
require "uri"
require 'open-uri'

class FileStackIntegration

  def initialize email
    @email = email
  end

  def save_img
    @email.attachments.each do |attach|
      params = {url: "https://process.filestackapi.com/AS6blLW1pSyaEm0kfBKmEz/output=format:jpg,density:30/#{image_url(attach.url)}"}

      response = Net::HTTP.post_form(URI.parse("https://www.filestackapi.com/api/store/S3?key=#{TestApp::Application.config.filestack_api_secret}"), params)
      @email.img_urls << JSON.parse(response.body.gsub('=>', ':'))
    end
      @email.save
  end

  def image_url url
    TestApp::Application.config.host + url
  end

end
