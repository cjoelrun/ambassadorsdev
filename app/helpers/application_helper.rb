module ApplicationHelper
  def table_status(status)
    if status == "Attended"
      "success"
    elsif status == "Will attend"
      "info"
    else
      "error"
    end
  end
end
