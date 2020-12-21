module ApplicationHelper
  def icon_alert
    {"alert" => "exclamation-triangle", "warning" => "exclamation-triangle", "notice" => "check-circle", "info" => "info-circle", "danger" => "", "success" => "check-circle", "danger" => "exclamation-circle"}
  end

  def is_homeworks_path
  	case request.params[:controller]
		when 'homeworks' then 'active' 
    end
  end

  def is_tutorings_path
  	case request.params[:controller]
		when 'tutorings' then 'active' 
    end
  end

  def is_users_path
  	case request.params[:controller]
		when 'users' then 'active' 
    end
  end

end
