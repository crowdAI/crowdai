class MailersController < InheritedResources::Base
  before_action :set_mailer, only: [:show, :update, :destroy]
  after_action :verify_authorized

  def index
    @mailers = Mailer.all
    authorize @mailers
    load_gon
  end

  def show
    load_gon
  end

  def update
    @mailer.update(paused: params[:paused])
    @mailer.save
    redirect_to mailer_path(@mailer)
  end

  private
  def set_mailer
    @mailer = Mailer.find(params[:id])
    authorize @mailer
  end

  def mailer_params
    params.require(:mailer).permit(:paused)
  end
end
