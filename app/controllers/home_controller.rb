class HomeController < ApplicationController
  def redirect_user
    return redirect_to new_user_session_path unless current_user

    case current_user.rol
    when "user"
      redirect_to users_dashboard_path
    when "centro"
      redirect_to centros_dashboard_path
    else
      redirect_to root_path, alert: "Dashboard no disponible para este rol."
    end
  end
end
