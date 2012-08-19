class ReportsController < ApplicationController

  def monthly
  end

  def yearly
    @q = User.search(params[:q])
    @users = @q.result(:distinct => true)
  end
end
