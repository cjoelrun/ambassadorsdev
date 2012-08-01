class HomeController < ApplicationController
  def index
    if current_user
      @users = User.all
      @events_today = Event.where("date = ?", Date.today)
      @my_events = current_user.events.find(:all, :order => "date desc", :limit => 5)
      # @birthdays = User.where("strftime('%-m', birthday) = ?", Date.today.month)
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
