require "net/http"
require "uri"
require 'open-uri'

class FileStackIntegration

  PAGE_LIMIT=5

  def initialize email
    @email = email
  end

  def save_images
    if @email.report.processing_type == 'pdf'
      @email.attachments.each do |attach|
        return if attach.content_type != 'application/pdf'
        process_pdf(attach)
      end
    else
      @email.images.each{ |image| process_image(image) }
    end
    @email.save
  end

  private

  def process_image image_url
    url = save_image({url: "#{process_url}/#{image_url}"})
    add_image_to_email! url
  end

  def process_pdf pdf
    current_page = 1
    reader = PDF::Reader.new(open(attach_url(pdf.url)))

    while reader.page_count >= current_page
      process_pdf_page(current_page, pdf)
      current_page += 1
    end
  end

  def process_pdf_page page, attach
    url = save_image({url: process_url + ",page:#{page}/" + attach_url(attach.url)})
    add_image_to_email! url
  end

  def add_image_to_email! response
    @email.img_urls << JSON.parse(response.body.gsub('=>', ':'))
  end

  def save_image params
    Net::HTTP.post_form(URI.parse("https://www.filestackapi.com/api/store/S3?key=#{TestApp::Application.config.filestack_api_secret}"), params)
  end

  def attach_url url
    TestApp::Application.config.host + url
  end

  def process_url
    "https://process.filestackapi.com/#{TestApp::Application.config.filestack_api_secret}/output=format:jpg,density:108"
  end

end
