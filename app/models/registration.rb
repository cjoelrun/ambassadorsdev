class Registration < ActiveRecord::Base
  attr_accessible :event_id, :user_id
  belongs_to :user
  belongs_to :event
  validates_associated :user, :event
  validates_presence_of :user, :event
  validates_uniqueness_of :user_id, :scope => :event_id
end
