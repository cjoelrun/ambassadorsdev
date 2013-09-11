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

  scope :attended, joins(:registration_status).where('registration_statuses.name = ?', 'Attended')
  scope :is_service, joins(:event => :credit_type).where(:credit_types => {:service => true})
  scope :by_year, lambda{|year| joins(:event).where(:events => {:date => year.start...year.end})}
  scope :by_month, lambda{|date| joins(:event).where(:events => {:date => date.beginning_of_month...date.end_of_month})}
  scope :by_credit_type, lambda{|type| joins(:event => :credit_type).where(:credit_types => {:id => type.id})}
  scope :by_event_type, lambda{|type| joins(:event => :event_type).where(:event_types => {:id => type.id})}

  def ait
    event.ait
  end

  private

  # Prevent users re-registering for a full event
  def ensure_slot_before_update
    canceled = RegistrationStatus.where("name = ? OR name = ?", "I need a replacement! (NOT allowed 48 hrs or less)", "Signed up but did not attend")
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
