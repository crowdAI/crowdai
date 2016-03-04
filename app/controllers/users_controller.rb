class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def edit
  end

  def update
  end

  def show
  end

  private
    def set_team
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :username, :password, :password_confirmation,
        :current_password, :phone_number, :country, :city, :first_name, :last_name,
        :email_public, :bio, :website, :github, :linkedin, :twitter)
    end

end
