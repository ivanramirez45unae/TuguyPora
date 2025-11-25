class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    root_path  # O el path que corresponda tras iniciar sesión
  end

  def authenticate_user!
    super
    # flash.delete(:alert) # <-- comenta o borra esta línea
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :nombre,
      :nombredeusuario,
      :num_telefono,
      :fec_nacimiento,
      :direccion,
      :genero,
      :avatar
    ])

    devise_parameter_sanitizer.permit(:account_update, keys: [
      :nombre,
      :nombredeusuario,
      :num_telefono,
      :fec_nacimiento,
      :direccion,
      :genero,
      :avatar
    ])
  end
end
