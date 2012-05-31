class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
  :recoverable, :rememberable, :trackable, :validatable
  devise :encryptable, :encryptor => :md5

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :name, :email, :password, :password_confirmation, :remember_me, :confirmed_at, :phone, :birthday, :local_street, :local_city, :local_state, :local_zip, :local_apt, :permanent_street, :permanent_city, :permanent_state, :permanent_zip, :permanent_apt, :same_address, :tour_trained
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

  def name
    if(last_name.blank?)
      first_name
    end
    [first_name,last_name].join(' ')
  end
end
