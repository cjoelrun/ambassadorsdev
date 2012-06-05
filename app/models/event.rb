class Event < ActiveRecord::Base
  attr_accessible :ait, :date, :end_time, :hours, :instructions, :location, :members_needed, :start_time, :title
  has_one :event_type
  has_one :credit_type
end
