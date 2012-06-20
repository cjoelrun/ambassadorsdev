class Registration < ActiveRecord::Base
  attr_accessible :event_id, :user_id, :registration_status_id

  belongs_to :user
  belongs_to :event
  belongs_to :registration_status

  validates_associated :user, :event
  validates_presence_of :user, :event, :registration_status
  validates_uniqueness_of :user_id, :scope => :event_id

  before_create :set_status_default

  private
  def set_status_default
    self.registration_status_id = RegistrationStatus.first.id
  end

end
