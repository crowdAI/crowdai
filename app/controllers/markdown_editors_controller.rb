class MarkdownEditorsController < ApplicationController
  before_action :authenticate_participant!
  respond_to :js

  def index
    markdown_text = markdown_params[:markdown_text]
    @markdown_text = Kramdown::Document.new(markdown_text,{coderay_line_numbers: nil}).to_html
    render json: { :success => "success", :status_code => "200", data: @markdown_text }
  end

  def create
    @markdown_field = params[:markdown_field_id]
    attachment = params[:attachment]
    s3_key = "markdown_editor/#{SecureRandom.hex}_#{attachment.original_filename}"
    file = attachment.tempfile
    s3_obj = Aws::S3::Resource.new.bucket(ENV['AWS_S3_SHARED_BUCKET']).object(s3_key)
    s3_obj.upload_file(file, acl:'public-read')
    url = s3_obj.public_url
    @attachment_markdown = "![#{attachment.original_filename}](#{url})"
    render 'markdown_editor/public_url'
  end

  private
  def markdown_params
    params.require(:markdown).permit(:markdown_text)
  end

end
