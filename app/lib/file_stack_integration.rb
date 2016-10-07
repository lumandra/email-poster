require "net/http"
require "uri"
require 'open-uri'

class FileStackIntegration

  def initialize email
    @email = email
  end

  def save_img
    @email.attachments.each do |attach|
      parsing_all_pages(attach)
    end
      @email.save
  end

  private

  def image_url url
    TestApp::Application.config.host + url
  end

  def parsing_all_pages attach
    page_number = 1
    response = parse_page page_number, attach

    while response.body.scan('Invalid response').blank?
      @email.img_urls << JSON.parse(response.body.gsub('=>', ':'))
      page_number += 1
      response = parse_page page_number, attach
    end
  end

  def parse_page page_number, attach
    params = {url: "https://process.filestackapi.com/AS6blLW1pSyaEm0kfBKmEz/output=format:jpg,density:108,page:#{page_number}/#{image_url(attach.url)}"}
    Net::HTTP.post_form(URI.parse("https://www.filestackapi.com/api/store/S3?key=#{TestApp::Application.config.filestack_api_secret}"), params)
  end

end
