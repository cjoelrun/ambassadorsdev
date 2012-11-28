class Registration < ActiveRecord::Base
  attr_accessible :event_id, :user_id, :registration_status_id

  belongs_to :user
  belongs_to :event
  belongs_to :registration_status

  validates_associated :user, :event
  validates_presence_of :user, :event, :registration_status
  validate :ensure_slot_before_update, 
           :on => :update, 
           :if => :registration_status_id_changed?

  # Prevents duplicate registrations
  validates :user_id, :uniqueness => { :scope => :event_id }

  def ait
    event.ait
  end

  private

  # Prevent users re-registering for a full event
  def ensure_slot_before_update
    canceled = RegistrationStatus.where("name = ? OR name = ?", "Swap", "Signed up but did not attend")
    if(canceled.exists?(registration_status_id_was))
      if(event.filled?)
        errors.add(:registration_status, "Event is filled")
      end
    end
  end


  def set_status_default
    self.registration_status_id = RegistrationStatus.first.id
  end

end
