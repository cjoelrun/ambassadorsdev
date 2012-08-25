class ReportsController < ApplicationController
  authorize_resource :class => false

  def monthly
    @q = User.search(params[:q])
    @users = @q.result(:distinct => true)
    if params[:date]
      @date = Date::civil(params[:date][:year].to_i, params[:date][:month].to_i, params[:date][:day].to_i)
    else
      @date = Date.today
    end
  end

  def yearly
    @q = User.search(params[:q])
    @users = @q.result(:distinct => true)
  end
end
