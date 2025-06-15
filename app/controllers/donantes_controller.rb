class DonantesController < ApplicationController
  def index
    @donantes = Donante.all
  end
  def new
    @donacion = Donacion.new
    @donante = Donante.find(params[:donante_id]) if params[:donante_id]
  end

  # def create
  #   @donante = Donante.new(donante_params)
  #   @donante.user = current_user  # Asocia el donante al usuario actual
  #
  #   if @donante.save
  #     redirect_to root_path, notice: "Registro de donante exitoso."
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end


  def create
  @donante = Donante.new(donante_params)
  @donante.user = current_user

  if @donante.save
    redirect_to root_path, notice: "Donante registrado exitosamente"
  else
    puts @donante.errors.full_messages  # <== línea para debug
    render :new
  end
  end


  private

  def donante_params
    params.require(:donante).permit(
      :tipo_sanguineo,
      :peso_kg,
      :estatura_cm,
      :tiene_tatuajes,
      :ult_donacion_fecha,
      medicamento_ids: [],
      condiciones_cronica_ids: []
    )
  end
end
