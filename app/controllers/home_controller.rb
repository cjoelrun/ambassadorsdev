class HomeController < ApplicationController
  def index
    if current_user
      @users = User.all
      @events_today = Event.where("date = ?", Date.today)
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
