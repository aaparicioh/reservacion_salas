class VideoconferenciaController < ApplicationController
  protect_from_forgery
  before_action :set_videoconferencium, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
  respond_to :json
  # GET /videoconferencia
  # GET /videoconferencia.json
  def handle_record_not_found
    redirect_to calendario_salaVideoconferencia_path, method: :post, :notice => "Verifique su folio de reservación."
  end

  def index
    @videoconferencia = Videoconferencium.all
  end

  # GET /videoconferencia/1
  # GET /videoconferencia/1.json
  def show
      @videoconferencium  = Videoconferencium.find_by_id(params[:id])
  end

  # GET /videoconferencia/new
  def new
    @videoconferencium = Videoconferencium.new
  end

  # GET /videoconferencia/1/edit
  def edit
    @videoconferencium = Videoconferencium.find_by_id(params[:id])
  end

  # POST /videoconferencia
  # POST /videoconferencia.json
  def create
    @videoconferencium = Videoconferencium.new(videoconferencium_params)
    @videoconferencium.save

    respond_to do |format|
      if @videoconferencium.save
        format.html { redirect_to @videoconferencium, notice: 'La reservación fue creada satisfactoriamente.' }
        format.json { render :show, status: :created, location: @videoconferencium }
      else
        format.html { render :new }
        format.json { render json: @videoconferencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videoconferencia/1
  # PATCH/PUT /videoconferencia/1.json
  def update
    respond_to do |format|
      if @videoconferencium.update(videoconferencium_params)
        format.html { redirect_to @videoconferencium, notice: 'La información ha sido actualizada satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @videoconferencium }
      else
        format.html { render :edit }
        format.json { render json: @videoconferencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videoconferencia/1
  # DELETE /videoconferencia/1.json
  def destroy
    @videoconferencium.destroy
    respond_to do |format|
      format.html { redirect_to videoconferencia_url, notice: 'La reservación fue eliminada satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_videoconferencium
      @videoconferencium = Videoconferencium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def videoconferencium_params
      params.require(:videoconferencium).permit(:nSolicitante, :tituloActividad, :fechaActividad, :coordinador, :tipoEnlace, :horainicio, :horafin, :coordinadorEnlace, :responsableTecnico, :numeroIP, :usuarioTipoEnlace, :telefono, :correoElectronico, :recursos, :horainicioEnlace, :horafinEnlace, :usuario, :fechaSolicitud, :aprobacion)
    end
end
