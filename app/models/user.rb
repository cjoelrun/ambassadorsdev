class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  devise :encryptable, :encryptor => :md5

  has_many :registrations, :dependent => :destroy
  has_many :events, :through => :registrations

  belongs_to :committee

  acts_as_birthday :birthday

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :password, :password_confirmation, :name, :email, :remember_me, :confirmed_at, :phone, :birthday, :local_street, :local_city, :local_state, :local_zip, :local_apt, :permanent_street, :permanent_city, :permanent_state, :permanent_zip, :permanent_apt, :same_address, :tour_trained, :role_ids, :major, :hours_enrolled, :graduation_date, :hometown, :committee_id, :old_id

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
    [first_name,last_name].compact.join(' ')
  end

  def committee_hours_month(date=Date.today)
    type = CreditType.find_by_name('Committee')
    registrations.attended.by_month(date).by_credit_type(type).sum('events.hours').to_d
  end

  def event_hours_month(date=Date.today)
    type = CreditType.find_by_name('Event')
    registrations.attended.by_month(date).by_credit_type(type).sum('events.hours').to_d
  end

  def service_hours_month(date=Date.today)
    registrations.attended.by_month(date).is_service.sum('events.hours').to_d
  end

  def committee_hours_year(year=Year.order('start DESC').first)
    type = CreditType.find_by_name('Committee')
    registrations.attended.by_year(year).by_credit_type(type).sum('events.hours').to_d
  end

  def event_hours_year(year=Year.order('start DESC').first)
    type = CreditType.find_by_name('Event')
    registrations.attended.by_year(year).by_credit_type(type).sum('events.hours').to_d
  end

  def tours_year(year=Year.order('start DESC').first)
    type = EventType.find_by_name('Tour')
    registrations.attended.by_year(year).by_event_type(type).sum('events.hours').to_d
  end

  def ceremonies_year(year=Year.order('start DESC').first)
    type = EventType.find_by_name('Commencement')
    registrations.attended.by_year(year).by_event_type(type).sum('events.hours').to_d
  end

  def service_hours_year(year=Year.order('start DESC').first)
    registrations.is_service.attended.by_year(year).sum('events.hours').to_d
  end

  def avatar_url()
    gravatar_id = Digest::MD5.hexdigest(email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end
end
