class Registration < ActiveRecord::Base
  attr_accessible :event_id, :user_id, :registration_status_id

  belongs_to :user
  belongs_to :event
  belongs_to :registration_status

  validates_associated :user, :event
  validates_presence_of :user, :event, :registration_status
  before_create :validate_uniqueness

  def validate_uniqueness
    registrations = Registration.find(:all, :conditions => {
                                        :event_id => self.event_id,
                                        :user_id => self.user_id })

    errors[:base] << "Registration already exists" unless registrations.empty?
  end

  def ait
    event.ait
  end

  private
  def set_status_default
    self.registration_status_id = RegistrationStatus.first.id
  end

end
