class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
  Time.zone = 'Central Time (US & Canada)'

  after_filter :flash_to_headers
  
  private
  
  def flash_to_headers
    return unless request.xhr?
    response.headers['X-Message'] = flash_message
    response.headers["X-Message-Type"] = flash_type.to_s
    
    flash.discard # don't want the flash to appear when you reload page
  end
  
  def flash_message
    [:error, :warning, :notice].each do |type|
      return flash[type] unless flash[type].blank?
    end
    # if we don't return something here, the above code will return "error, warning, notice"
    return ''
  end
  
  def flash_type
    [:error, :warning, :notice].each do |type|
      return type unless flash[type].blank?
    end
  end
end
