class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :accounts
  has_many :incomes
  has_many :expenses
  has_many :login_logs
  has_many :posts

  def after_database_authentication
    LoginLog.create(login_time: current_sign_in_at, ip_address: current_sign_in_ip, user: self)
  end
end
