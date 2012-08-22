class ReportsController < ApplicationController
  authorize_resource :class => false

  def monthly
  end

  def yearly
    @q = User.search(params[:q])
    @users = @q.result(:distinct => true)
  end
end
