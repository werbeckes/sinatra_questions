class User < ActiveRecord::Base
  include BCrypt

  has_many :questions
  has_many :answers, through: :questions


  def self.authenticate(params)
    @user = User.find_by_username(params[:username])
    if @user && @user.password == params[:password]
      return @user.id
    end
    return nil
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    self.password_hash = Password.create(new_password)
  end
end
