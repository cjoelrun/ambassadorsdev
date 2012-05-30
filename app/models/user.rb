class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :encryptable, :encryptor => :md5

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :confirmed_at
  # attr_accessible :title, :body
  
  def valid_password?(password)
    return false if encrypted_password.blank?
    Devise.secure_compare(Devise::Encryptable::Encryptors::Md5.digest(password, nil, nil, nil), self.encrypted_password)
  end

  def password_salt
    'no salt'
  end

  def password_salt=(new_salt)
  end
end
