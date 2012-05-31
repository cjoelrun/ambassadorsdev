module UsersHelper

  def local_address(id)
    html = '';
    user = User.find(params[:id])
    if (!user.local_street.blank?())
      html += "<p>#{user.local_street}</p>"
    end
    if (!user.local_city.blank?())
      html += "<p>#{user.local_city}"

      if(!user.local_state.blank?())
        html += " #{user.local_state}"
      end

      if(!user.local_zip.blank?())
        html += "  #{user.local_zip}"
      end

      html += "</p>"
    end
    if(!user.local_apt.blank?())
        html += "<p>#{user.local_apt}</p>"
    end
    html.html_safe
  end

  def permanent_address(id)
    html = '';
    user = User.find(params[:id])
    if (!user.permanent_street.blank?())
      html += "<p>#{user.permanent_street}</p>"
    end
    if (!user.permanent_city.blank?())
      html += "<p>#{user.permanent_city}"

      if(!user.permanent_state.blank?())
        html += " #{user.permanent_state}"
      end

      if(!user.permanent_zip.blank?())
        html += "  #{user.permanent_zip}"
      end

      html += "</p>"
    end
    if(!user.permanent_apt.blank?())
        html += "<p>#{user.permanent_apt}</p>"
    end
    html.html_safe
  end

end
