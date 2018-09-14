class ReservacionsController < ApplicationController
  protect_from_forgery
  before_action :set_reservacion, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
  #before_action :reservacion_map, only: [:new, :edit]
  #before_action :reservacion_update, only: [:create, :update]
  respond_to :json

  def as_json(options={})
    super(:only => [:nevento],
          :include => {
            :start => {:only => [:fechainicio]},
            :end => {:only => [:fechafin]}
          }
    )
  end

  # GET /reservacions
  # GET /reservacions.json
  def handle_record_not_found
    redirect_to calendario_actividadesInvestigacion_path, :notice => "Verifique su folio de reservación."
  end

  def index
    @reservacions = Reservacion.all
    @reservacion = Reservacion.find_by_id(params[:id])
    respond_to do |format|
      format .json
      format.html
      format.pdf do
        pdf = ReservacionPdf.new
        send_data pdf.render, filename: "reservacion_#{@reservacion.id}", type: 'application/pdf', disposition: 'inline'
      end
    end
  end

  # GET /reservacions/1
  # GET /reservacions/1.json
  def show
    @reservacion = Reservacion.find_by_id(params[:id])
    if @reservacion.usuario == current_user.email or current_user.email == "dianpau01@gmail.com" or current_user.email == "paulina.gv@ceiich.unam.mx"
      respond_to do |format|
        format .json
        format.html
        format.pdf do
          pdf = ReservacionPdf.new
          send_data pdf.render, filename: "reservacion_#{@reservacion.id}", type: 'application/pdf', disposition: 'inline'
        end
      end
    else redirect_to calendario_actividadesInvestigacion_path, :notice => "Verifique su folio de reservación."
    end

  end
 

  # GET /reservacions/new
  def new
    @reservacion = Reservacion.new
    @espacios = Espacio.where(id: [2,3,5,6])
    @espaciosadmin = Espacio.where(id: [1,2,3,4,5,6])
  end

  # GET /reservacions/1/edit
  def edit
    @reservacion = Reservacion.find_by_id(params[:id])
    @solicitud = Reservacion.find_by_id(params[:id])
    @espacios = Espacio.where(id: [2,3,5,6])
    @espaciosadmin = Espacio.where(id: [1,2,3,4,5,6])

    respond_to do |format|
      format.html
    end
  end

  # POST /reservacions
  # POST /reservacions.json
  def create
    colision = false
    @reservaciones = Reservacion.all
    @reservacion = Reservacion.new(reservacion_params)
    @reservacion.fechafin = @reservacion.fechainicio

    @reservaciones.each do |r|
      if #(@solicitud.fechainicio==s.fechainicio&&@solicitud.horainicio>s.horainicio)&&(@solicitud.fechafin==s.fechafin&&@solicitud.horafin<s.horafin)
      (@reservacion.espacio_id==r.espacio_id) && (( @reservacion.fechainicio==r.fechafin && @reservacion.horainicio<r.horafin ) || ( @reservacion.fechafin==r.fechainicio && @reservacion.horafin>r.horainicio ))
        colision = true
      end
    end

    respond_to do |format|
      if colision == false
        @reservacion.save
        ReservacionMailer.solicitud_email(@reservacion).deliver_now
        format.html { redirect_to @reservacion, notice: 'Su solicitud fue realizada satisfactoriamente.' }
        format.json { render :show, status: :created, location: @reservacion }
      else
        format.html { redirect_to calendario_actividadesInvestigacion_path, :notice => 'Eror al procesar su solicitud: "Existe un traslape con una reservación previa".' }
        format.json { render json: @reservacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservacions/1
  # PATCH/PUT /reservacions/1.json
  def update
    colision = false
    respaldo=@reservacion
    espacio = respaldo.espacio_id
    fi = respaldo.fechainicio
    ff = respaldo.fechafin
    hi = respaldo.horainicio
    hf = respaldo.horafin
    @reservacion.horainicio = Time.parse("00:00")#Time.now.strftime("%d-%m-%Y %H:%M")
    @reservacion.horafin = Time.parse("00:00")#(Time.now+600).strftime("%d-%m-%Y %H:%M")
    @reservacion.save
    @reservaciones = Reservacion.all
    @reservaciones.each do |r|
      condicion = (@solicitud.espacio_id==r.espacio_id) && (( @solicitud.fechainicio==r.fechafin && @solicitud.horainicio<r.horafin ) || ( @solicitud.fechafin==r.fechainicio && @solicitud.horafin>r.horainicio ))
      puts r.id.to_s + condicion.to_s + " -> " + colision.to_s
      if condicion
        colision = true
      end
    end

    puts "El valor de colisión es: " + colision.to_s

    respond_to do |format|
      if colision == false
        @reservacion.update(reservacion_params)
        @reservacion.fechafin = @reservacion.fechainicio
        @reservacion.save
        if @reservacion.aprobacion == true 
          ReservacionMailer.aprobacion_email(@reservacion).deliver_now
        end
        format.html { redirect_to @reservacion, notice: 'La información de su reservación fue actualizada satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @reservacion }
      else
        @reservacion.horainicio = hi
        @reservacion.horafin = hf
        @reservacion.save
        format.html { redirect_to calendario_actividadesInvestigacion_path, :notice => 'Error al actualizar su solicitud: "Existe un traslape con una reservación previa".' }
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

    def solicitud
    @reservacion = Reservacion.find_by_id(params[:id])
      respond_to do |format|
        format.html
        format.pdf do
          pdf = ReportPdf.new(@reservacion)
          send_data pdf.render, filename: @reservacion.id+'.pdf', type: 'application/pdf'
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservacion_params
      params.require(:reservacion).permit(:nresponsable, :nevento, :fechainicio, :fechafin, :horainicio, :horafin, :repeticion, :idrepeticiones, :aprobacion, :tipoactividad, :fechasolicitud, :cartel, :ncartel, :programa, :nprograma, :constancias, :nconstancias, :mesaRedonda, :auditorio, :videoproyector, :pc, :video, :conexInternet, :traducSimultanea, :conexSkype, :videoconferencia, :webcast, :grabVideo,:grabAudio, :cafe, :galletas, :fruta, :pizarron, :asistentes, :usuario, :espacio_id)
    end

    #def reservacion_map
    #  @espacios = Espacio.all.map { |result| [result.nombre, result.id] }
    #end

    #def reservacion_update
    #  @reservacion.espacio_id=params[:espacio_id]
    #end
end