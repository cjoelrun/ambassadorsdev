class ReportsController < ApplicationController
  authorize_resource :class => false

  def monthly
    @q = User.search(params[:q])
    @users = @q.result(:distinct => true).order("first_name ASC, last_name ASC")
    if params[:q]
      @active_user_roles = params[:q][:roles_id_in]
      @date = Date::civil(params[:date][:year].to_i, params[:date][:month].to_i, params[:date][:day].to_i)
    else
      @active_user_roles = Role.where(:name => ["ambassador", "ait"]).map(&:id)
      @date = Date.today
    end
    @users.joins(:roles).where(:roles => {:id => @active_user_roles})
  end

  def yearly
    @q = User.search(params[:q])
    @users = @q.result(:distinct => true).order("first_name ASC, last_name ASC")
    if params[:year]
      @active_user_roles = params[:q][:roles_id_in]
      @year = Year.find(params[:year])
    else
      @active_user_roles = Role.where(:name => ["ambassador", "ait"]).map(&:id)
      @year = Year.order("start DESC").first
    end
    @users.joins(:roles).where(:roles => {:id => @active_user_roles})
    @service_sum = Registration.attended.is_service.by_year(@year).sum('events.hours')
    tour = EventType.find_by_name("Tour")
    @tour_sum = Registration.attended.by_year(@year).by_event_type(tour).count
  end

  def export
    @year = Year.find(params[:year])
    @events = Event.by_year(@year)
    @registrations = Registration.by_year(@year)
    @users = User.all
    @service_sum = Registration.attended.is_service.by_year(@year).sum('events.hours')
    tour = EventType.find_by_name("Tour")
    @tour_sum = Registration.attended.by_year(@year).by_event_type(tour).count
    respond_to do |format|
      format.xls
    end
  end
  
  def destroy_year
    @year = Year.find(params[:year_id])
    @year.servicehours = Registration.attended.is_service.by_year(@year).sum('events.hours')
    tour = EventType.find_by_name("Tour")
    @year.tours = Registration.attended.by_year(@year).by_event_type(tour).count
    @year.save
    
    Event.by_year(@year).delete_all
    respond_to do |format|
      format.html { redirect_to reports_yearly_path }
      format.json { head :no_content }
    end
  end

end
