module UsersHelper

  def local_address(id)
    html = '';
    user = User.find(params[:id])
    if (!user.local_street.blank?())
      html += "#{user.local_street}<br />"
    end
    if (!user.local_city.blank?())
      html += "#{user.local_city}"

      if(!user.local_state.blank?())
        html += " #{user.local_state}"
      end

      if(!user.local_zip.blank?())
        html += "  #{user.local_zip}"
      end

      html += "<br />"
    end
    if(!user.local_apt.blank?())
      html += "#{user.local_apt}<br />"
    end
    html.html_safe
  end

  def permanent_address(id)
    html = '';
    user = User.find(params[:id])
    if (!user.permanent_street.blank?())
      html += "#{user.permanent_street}<br />"
    end
    if (!user.permanent_city.blank?())
      html += "#{user.permanent_city}"

      if(!user.permanent_state.blank?())
        html += " #{user.permanent_state}"
      end

      if(!user.permanent_zip.blank?())
        html += "  #{user.permanent_zip}"
      end

      html += "<br />"
    end
    if(!user.permanent_apt.blank?())
      html += "#{user.permanent_apt}<br />"
    end
    html.html_safe
  end

  def render_tour_trained(tour_trained)
    if tour_trained
      raw '<i class="icon-ok"></i>'
    else
      raw '<i class="icon-remove"></i>'
    end
  end
  
end
