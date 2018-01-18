class ReservacionsController < ApplicationController
  before_action :set_reservacion, only: [:show, :edit, :update, :destroy]

  # GET /reservacions
  # GET /reservacions.json
  def index
    @reservacions = Reservacion.all
  end

  # GET /reservacions/1
  # GET /reservacions/1.json
  def show
  end

  # GET /reservacions/new
  def new
    @reservacion = Reservacion.new
  end

  # GET /reservacions/1/edit
  def edit
  end

  # POST /reservacions
  # POST /reservacions.json
  def create
    @reservacion = Reservacion.new(reservacion_params)

    respond_to do |format|
      if @reservacion.save
        format.html { redirect_to @reservacion, notice: 'Su solicitud fue realizada satisfactoriamente.' }
        format.json { render :show, status: :created, location: @reservacion }
      else
        format.html { render :new }
        format.json { render json: @reservacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservacions/1
  # PATCH/PUT /reservacions/1.json
  def update
    respond_to do |format|
      if @reservacion.update(reservacion_params)
        format.html { redirect_to @reservacion, notice: 'La información de su reservación fue actualizada satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @reservacion }
      else
        format.html { render :edit }
        format.json { render json: @reservacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservacions/1
  # DELETE /reservacions/1.json
  def destroy
    @reservacion = Reservacion.find(params[:id])
    @reservacion.destroy
        redirect_to reservacions_path, :notice => "Su reservación fue eliminada satisfactoriamente."
  end

  def get_reservacion

  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservacion
      @reservacion = Reservacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservacion_params
      params.require(:reservacion).permit(:nresponsable, :nevento, :fechainicio, :fechafin, :horainicio, :horafin, :repeticion, :idrepeticiones, :aprobacion, :tipoactividad, :fechasolicitud)
    end

end
