class ErrorsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def e404
    respond_to do |format|
      #format.html { render 'errors/404', status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end
end
