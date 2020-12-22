module ApplicationHelper
  def icon_alert
    {"alert" => "exclamation-triangle",
     "warning" => "exclamation-triangle",
     "notice" => "check-circle",
     "info" => "info-circle",
     "danger" => "",
     "success" => "check-circle",
     "danger" => "exclamation-circle"}
  end

  def alert_class
    {"alert" => "yellow",
     "warning" => "red",
     "notice" => "green",
     "info" => "blue"}
  end

  def is_homeworks_path
  	case request.path
		when '/homeworks' then 'active'
    end
  end

  def is_all_homeworks_path
    case request.path
    when '/mercado_de_tareas' then 'active'
    when '/' then 'active'
    end
  end


  def is_users_path
    case request.params[:controller]
    when 'admin/users' then 'active'
    end
  end

  def is_subjects_path
    case request.params[:controller]
    when 'subjects' then 'active'
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
