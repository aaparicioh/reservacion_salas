class EspaciosController < ApplicationController
protect_from_forgery
  before_action :set_espacio, only: [:show, :edit, :update, :destroy]

  # GET /espacios
  # GET /espacios.json
  def index
    @espacios = Espacio.all
  end

  # GET /espacios/1
  # GET /espacios/1.json
  def show
  end

  # GET /espacios/new
  def new
    @espacio = Espacio.new
  end

  # GET /espacios/1/edit
  def edit
  end

  # POST /espacios
  # POST /espacios.json
  def create
    @espacio = Espacio.new(espacio_params)

    respond_to do |format|
      if @espacio.save
        format.html { redirect_to @espacio, notice: 'El espacio fue agregado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @espacio }
      else
        format.html { render :new }
        format.json { render json: @espacio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /espacios/1
  # PATCH/PUT /espacios/1.json
  def update
    respond_to do |format|
      if @espacio.update(espacio_params)
        format.html { redirect_to @espacio, notice: 'Los datos del espacio fueron actualizados satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @espacio }
      else
        format.html { render :edit }
        format.json { render json: @espacio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /espacios/1
  # DELETE /espacios/1.json
  def destroy
    @espacio.destroy
    respond_to do |format|
      format.html { redirect_to espacios_url, notice: 'Los datos del espacio fueron eliminados satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_espacio
      @espacio = Espacio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def espacio_params
      params.require(:espacio).permit(:nombre, :ubicacion, :aforo, :descripcion, :servicios_adicionales, :estatus)
    end
end
