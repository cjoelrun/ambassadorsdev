class CreditType < ActiveRecord::Base
  has_many :events
  attr_accessible :name, :service, :month_requirement
end
