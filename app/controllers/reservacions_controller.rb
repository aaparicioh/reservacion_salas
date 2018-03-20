class ReservacionsController < ApplicationController
  protect_from_forgery
  before_action :set_reservacion, only: [:show, :edit, :update, :destroy]
  respond_to :json

  # GET /reservacions
  # GET /reservacions.json
  def index
    @reservacions = Reservacion.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ReservacionPdf.new(@reservacions)
        send_data pdf.render, filename: 'reservacion.pdf', type: 'application/pdf'
      end
    end
  end

  # GET /reservacions/1
  # GET /reservacions/1.json
  def show
  @reservacion = Reservacion.find_by_id(params[:id])
  end

  # GET /reservacions/new
  def new
    #session[:reservacion_params] ||= {}
    @reservacion = Reservacion.new

  end

  # GET /reservacions/1/edit
  def edit 
    @reservacion = Reservacion.find_by_id(params[:id])
  end

  
  # POST /reservacions
  # POST /reservacions.json
  def create
  
    @reservacion = Reservacion.new(reservacion_params)
    @reservacion.save
    

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
    @reservacion = Reservacion.find_by_id(params[:id])
    @reservacion.destroy
      redirect_to reservacions_path, :notice => "Su reservación fue eliminada satisfactoriamente."
  
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservacion
      @reservacion = Reservacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservacion_params
      params.require(:reservacion).permit(:nresponsable, :nevento, :fechainicio, :fechafin, :horainicio, :horafin, :repeticion, :idrepeticiones, :aprobacion, :tipoactividad, :fechasolicitud, :cartel, :ncartel, :programa, :nprograma, :constancias, :nconstancias, :mesaRedonda, :auditorio, :videoproyector, :pc, :video, :conexInternet, :traducSimultanea, :conexSkype, :videoconferencia, :webcast, :grabVideo,:grabAudio, :cafe, :galletas, :fruta, :pizarron, :asistentes, :usuario)
    end
end
