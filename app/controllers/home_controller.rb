class HomeController < ApplicationController
  skip_authorization_check
  def index
    if current_user
      @users = User.all

      @events_upcoming = Event.where('date + start_time >= ?', DateTime.new(DateTime.now.year, DateTime.now.month, DateTime.now.day, DateTime.now.hour, DateTime.now.min, DateTime.now.second, 0))

      @my_events = current_user.events.find(:all, :order => "date desc", :limit => 5)

      @birthdays = User.find_birthdays_for(Date.today.beginning_of_month, Date.today.end_of_month)

      year = Year.order("start DESC").first
      status_attended = RegistrationStatus.find_by_name("Attended")

      @hour_leaders = User.find(:all, :limit => 10,
                                :select => "user_id id, first_name, last_name, sum(hours) as service_hours",
                                :joins => 'INNER JOIN "registrations" ON "registrations"."user_id" = "users"."id"
                                           INNER JOIN "events" ON "events"."id" = "registrations"."event_id"
                                           LEFT JOIN "registration_statuses" ON "registration_statuses"."id" = "registrations"."registration_status_id"
                                           LEFT JOIN "credit_types" ON "credit_types"."id" = "events"."credit_type_id"',
                                :conditions => ['registration_statuses.name = ? AND credit_types.service = ? AND date >= ? AND date <= ?', "Attended", true, year.start, year.end],
                                :order => "service_hours DESC",
                                :group => "user_id, first_name, last_name")

      @tour_leaders = User.find(:all, :limit => 10,
                                :select => "user_id id, first_name, last_name, count(events) tours",
                                :joins => 'INNER JOIN "registrations" ON "registrations"."user_id" = "users"."id"
                                           INNER JOIN "events" ON "events"."id" = "registrations"."event_id"
                                           LEFT JOIN "registration_statuses" ON "registration_statuses"."id" = "registrations"."registration_status_id"
                                           LEFT JOIN "event_types" ON "event_types"."id" = "events"."event_type_id"',
                                :conditions => ["registration_statuses.name = ? AND event_types.name = ? AND date >= ? AND date <= ?", "Attended", "Tour", year.start, year.end],
                                :order => "tours DESC",
                                :group => "user_id, first_name, last_name")
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
