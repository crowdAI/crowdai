class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable,
         :authentication_keys => [:login]

  attr_accessor :login

  def admin?
    self.admin
  end
end
