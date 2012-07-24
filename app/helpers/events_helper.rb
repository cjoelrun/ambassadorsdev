module EventsHelper
  def render_ait(ait)
    if ait
      raw '<i class="icon-ok"></i>'
    else
      raw '<i class="icon-remove"></i>'
    end
  end
end
