class Api::MailchimpWebhooksController < Api::BaseController

  def show
    # used by MailChimp to test endpoint
    head :ok
  end

  def create
    #email_preferences = Participant.where(email: params[:email]).email_preferences
    #email_preferences.update(newsletter: false)
    head :ok
  end

end
