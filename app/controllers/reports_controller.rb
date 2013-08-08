class ReportsController < ApplicationController
  authorize_resource :class => false

  def monthly
    if params[:q]
      @q = User.search(params[:q])
      @users = @q.result(:distinct => true).order("first_name ASC, last_name ASC")
    else
      @ambassador_id = Role.find_by_name("ambassador").id
      @q = User.search(params[:q])
      @users = @q.result(:distinct => true).order("first_name ASC, last_name ASC").joins(:roles).where(:roles => {:name => "ambassador"})
    end
    if params[:date]
      @date = Date::civil(params[:date][:year].to_i, params[:date][:month].to_i, params[:date][:day].to_i)
    else
      @date = Date.today
    end
  end

  def yearly
    @q = User.search(params[:q])
    @users = @q.result(:distinct => true).order("first_name ASC, last_name ASC")
    if params[:year]
      @year = Year.find(params[:year])
    else
      @year = Year.order("start DESC").first
    end
  end

  def export
    if params[:year_id]
      @year = Year.find(params[:year_id])
    else
      @year = Year.order("start DESC").first
    end
    @events = Event.by_year(@year)
    @registrations = Registration.by_year(@year)
    @users = User.all
    respond_to do |format|
      format.xls
    end
  end
  
  def destroy_year
    if params[:year_id]
      @year = Year.find(params[:year_id])
    else
      @year = Year.order("start DESC").first
    end
    Event.by_year(@year).delete_all
    @year.delete
    respond_to do |format|
      format.html { redirect_to reports_yearly_path }
      format.json { head :no_content }
    end
  end

end
