class User < ActiveRecord::Base
  has_many :surveys
  has_many :respsurveys

  def self.authenticate(email,password)
    user = User.where(email: email).first

    if user.password == password
      user
    else
      nil
    end
  end
end
