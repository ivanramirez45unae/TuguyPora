module Admin
  class UsersController < Admin::BaseController
    before_action :set_user, only: %i[edit update destroy deactivate]

    # LISTA
    def index
      @users = User.order(:created_at)
    end

    # FORMULARIO NUEVO CENTRO
    def new
      @user = User.new(rol: "centro")
    end

    # CREAR CENTRO
    def create
      @user = User.new(user_params.merge(rol: "centro"))
      if @user.save
        redirect_to admin_dashboard_path, notice: "Centro creado."
      else
        render :new
      end
    end

    # FORMULARIO DE EDICIÓN
    def edit; end

    # ACTUALIZAR USUARIO
    def update
      clean = user_params
      clean.delete(:password) if clean[:password].blank?
      clean.delete(:password_confirmation) if clean[:password_confirmation].blank?

      if @user.update(clean)
        redirect_to admin_dashboard_path, notice: "Usuario actualizado."
      else
        render :edit
      end
    end

    # DESACTIVAR (CAMBIAR ROL)
    def deactivate
      @user.update(rol: "desactivado")
      redirect_to admin_dashboard_path, notice: "Usuario desactivado."
    end

    # ELIMINAR
    def destroy
      @user.destroy
      redirect_to admin_dashboard_path, notice: "Usuario eliminado."
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(
        :nombre, :nombredeusuario, :email, :rol,
        :num_telefono, :fec_nacimiento, :direccion, :genero,
        :password, :password_confirmation
      )
    end
  end
end
