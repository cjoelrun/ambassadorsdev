class Event < ActiveRecord::Base
  attr_accessible :ait, :date, :end_time, :hours, :instructions, :location, :members_needed, :start_time, :title, :event_type_id, :credit_type_id, :apparel_id
  has_many :registrations, :dependent => :destroy
  has_many :users, :through => :registrations
  belongs_to :event_type
  belongs_to :credit_type
  belongs_to :apparel
  validates_presence_of :date, :end_time, :hours, :members_needed, :start_time, :title, :event_type, :credit_type

  def datetime_start
    datetime = DateTime.new(date.year, date.month, date.day, start_time.hour, start_time.min, start_time.sec, DateTime.now.offset)
  end

  def datetime_end
    datetime = DateTime.new(date.year, date.month, date.day, end_time.hour, end_time.min, end_time.sec, DateTime.now.offset)
  end
end
