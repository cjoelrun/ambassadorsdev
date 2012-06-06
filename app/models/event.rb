class Event < ActiveRecord::Base
  attr_accessible :ait, :date, :end_time, :hours, :instructions, :location, :members_needed, :start_time, :title, :event_type_id, :credit_type_id
  has_many :users, :through => :registrations
  belongs_to :event_type
  belongs_to :credit_type
  validates_presence_of :date, :end_time, :hours, :members_needed, :start_time, :title, :event_type, :credit_type
end
