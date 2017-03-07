class MailersController < InheritedResources::Base

  private

    def mailer_params
      params.require(:mailer).permit(:mailer, :paused)
    end
end

