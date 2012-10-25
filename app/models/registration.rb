class Registration < ActiveRecord::Base
  attr_accessible :event_id, :user_id, :registration_status_id

  belongs_to :user
  belongs_to :event
  belongs_to :registration_status
  
  validates_associated :user, :event
  validates_presence_of :user, :event, :registration_status

  # Prevents duplicate registrations
  validates :user_id, :uniqueness => { :scope => :event_id }

  def ait
    event.ait
  end

  private
  def set_status_default
    self.registration_status_id = RegistrationStatus.first.id
  end

end
