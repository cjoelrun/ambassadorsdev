class HomeController < ApplicationController
  def index
    @users = User.all
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
