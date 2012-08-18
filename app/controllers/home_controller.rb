class HomeController < ApplicationController
  skip_authorization_check
  def index
    if current_user
      @users = User.all
      @events_upcoming = Event.where('date + start_time >= ?', DateTime.new(DateTime.now.year, DateTime.now.month, DateTime.now.day, DateTime.now.hour, DateTime.now.min, DateTime.now.second, 0))
      @my_events = current_user.events.find(:all, :order => "date desc", :limit => 5)
      @birthdays = User.find_birthdays_for(Date.today.beginning_of_month, Date.today.end_of_month)
    end
  end

  def about_ambassadors
  end

  def about_ait
  end

  def ambassador_letter
  end

  def ait_letter
  end

end
