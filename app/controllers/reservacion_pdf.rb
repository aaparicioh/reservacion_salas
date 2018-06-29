class ReservacionPdf < Prawn::Document
  require "prawn/measurement_extensions"

  def initialize(reservacion)
    super()
    @reservacion = reservacion #Reservacion.find_by_id(params[:id])
    encabezado
    datos_solicitante
    servicios
    fechas
    observaciones
    evaluacion
    codigo
  end

  def encabezado
    image "#{Rails.root}/app/assets/images/UNAM-Escudo.jpg", width: 57, height: 61, :at => [20,700]
    image "#{Rails.root}/app/assets/images/ceiich-300dpi.jpg", width: 71, height: 61, :at => [80,700]
    move_down 10.mm
    bounding_box([150,cursor], :width => 400, :height => 50) do
      text"UNIVERSIDAD NACIONAL AUTÓNOMA DE MÉXICO", size: 12, style: :bold, align: :center
      text"SECRETARÍAS Y UNIDADES ADMINISTRATIVAS - SGC", size: 12, align: :center
      text"SOLICITUD DE SERVICIOS DIVERSOS Y LIMPIEZA", size: 12, style: :bold, align: :center
    end
  end

  def datos_solicitante
    move_down 5.mm
    y1=cursor-6
    text"ÁREA SOLICITANTE:", size: 9
    draw_text"DEPARTAMENTO DE DIFUSIÓN", size: 8, :at => [150,y1+2]
    draw_text"FOLIO:", size: 9, :at => [430,y1]
    move_down 3.mm
    y2=cursor-6
    text"RESPONSABLE DEL ÁREA SOLICITANTE:", size: 9
    draw_text"MARÍA GLADYS CASTILLO GUERRERO", size: 8, :at => [190,y2+2]
    draw_text"FECHA DE LA SOLICITUD:", size: 9, :at => [368,y2]
    draw_text"|       |", size: 10, :at => [508,y2+2]
    draw_text"#{@reservacion.fechasolicitud.day}", size: 10, :at => [495,y2+2]
    draw_text"#{@reservacion.fechasolicitud.month}", size: 10, :at => [518,y2+2]
    draw_text"#{@reservacion.fechasolicitud.year}", size: 10, :at => [534,y2+2]
    draw_text"DÍA      MES       AÑO", size: 5, :at => [497,y2-8]
    move_down 3.mm
    y3=cursor-6
    text"NOMBRE DEL USUARIO:", size: 9
    draw_text"#{@reservacion.nresponsable}", size: 10, :at => [150,y3+2]
    draw_text"TELÉFONO:", size: 9, :at => [395,y3]

    stroke do
      horizontal_line  95, 420, :at => y1
      horizontal_line 465, 550, :at => y1
      horizontal_line 185, 350, :at => y2
      horizontal_line 490, 550, :at => y2
      horizontal_line 115, 385, :at => y3
      horizontal_line 450, 550, :at => y3
    end
  end

  def servicios
    fill_color "BDBDBD"
    fill_rectangle [0, 565], 550, 20
    fill_color "000000"
    stroke_color "000000"
    stroke do
      rectangle [0,565], 550, 110
      horizontal_line 0,550, :at => 545
      vertical_line 455,545, :at => 200
      vertical_line 455,545, :at => 400
    end
    bounding_box([0,565], :width => 550, :height => 20) do
      text"TIPO DE SERVICIO", size: 9, :align => :center, :valign => :center
    end
    move_down 4.mm
    draw_text"PRÉSTAMO DE:", size: 8, :at => [70,cursor], style: :bold
    move_down 2.mm
    draw_text"CAFETERÍA", size: 8, :at => [210,cursor]
    draw_text"LIMPIEZA", size: 8, :at => [320,cursor]
    move_down 10.mm
    stroke do
      rectangle [60,cursor+11], 16,19
      rectangle [60,cursor-21], 16,19

      rectangle [165,cursor+11], 16,19
      rectangle [165,cursor-21], 16,19

      rectangle [270,cursor+41], 16,19
      rectangle [270,cursor+11], 16,19
      rectangle [270,cursor-21], 16,19

      rectangle [365,cursor+41], 16,19
      rectangle [365,cursor+11], 16,19

      horizontal_line 460,530, :at => cursor
      horizontal_line 460,530, :at => cursor-12.mm
      horizontal_line 320,390, :at => cursor-12.mm-6
    end
    draw_text"SALA DE", size: 8, :at => [10,cursor+2]
    draw_text"JUNTAS", size: 8, :at => [10,cursor-8]
    draw_text"AUDITORIOS", size: 8, :at => [100,cursor-2]
    draw_text"CERRAJERÍA", size: 8, :at => [210,cursor-2]
    draw_text"OTRO", size: 8, :at => [320,cursor-2]
    draw_text"FECHA:", size: 8, :at => [420,cursor-2]
    draw_text"#{@reservacion.fechainicio}", size: 10, :at => [470,cursor+2]
    move_down 12.mm
    draw_text"AULAS", size: 8, :at => [10,cursor]
    draw_text"EQUIPO", size: 8, :at => [100,cursor+4]
    draw_text"AUDIOVISUAL", size: 8, :at => [100,cursor-6]
    draw_text"TRASLADO", size: 8, :at => [210,cursor+4]
    draw_text"DE BIENES", size: 8, :at => [210,cursor-6]
    draw_text"HORA:", size: 8, :at => [425,cursor]
    draw_text"#{@reservacion.horainicio.strftime('%H:%M')}", size: 10, :at => [480,cursor+2]
    move_down 6.mm
    stroke do
      rectangle [15,440], 515, 100
    end
  end

  def fechas
    move_down 30.mm
    y5=cursor-70
    draw_text "FECHA COMPROMISO  DE ENTREGA:", size: 9, :at => [0,y5]
    draw_text"#{@reservacion.fechainicio}", size: 10, :at => [180,y5+2]
    stroke do
      horizontal_line 165, 265, :at => y5
    end
  end

  def observaciones
    move_down 4.mm
    fill_color "BDBDBD"
    fill_rectangle [270, cursor-35], 260, 24
    fill_color "000000"
    stroke_color "000000"
    stroke do
      rectangle [270,cursor-35], 260, 150
      horizontal_line 270, 530, :at => cursor-59
    end
    bounding_box([270,cursor-35], :width => 260, :height => 24) do
      text"CUANDO EL SERVICIO TENGA UN COSTO Y REQUIERA AUTORIZACIÓN PRESUPUESTAL", size: 8, :align => :center, :valign => :center, style: :bold
    end
    move_down 10.mm
    draw_text "COSTO:", size: 8, :at => [405,cursor+12.5]
    draw_text "CON CARGO A:", size: 8, :at => [276.2,cursor+12.5]
    stroke do
      horizontal_line 340, 400, :at => cursor + 12.5
      horizontal_line 440, 525, :at => cursor + 12.5
    end
    move_down 3.mm
    draw_text "CONFIRMACIÓN DE", size: 8, :at => [30,cursor]
    draw_text "REALIZÓ", size: 8, :at => [190,cursor]
    draw_text "VO. BO. DE SUFICIENCIA", size: 8, :at => [280,cursor]
    draw_text "AUTORIZÓ", size: 8, :at => [445,cursor]
    move_down 4.mm
    draw_text "REQUISITOS", size: 8, :at => [45,cursor]
    draw_text "PRESUPUESTAL", size: 8, :at => [300,cursor]
    move_down 20.mm
    stroke do
      horizontal_line 10, 135, :at => cursor + 8
      horizontal_line 155, 265, :at => cursor + 8
      horizontal_line 270, 390, :at => cursor + 8
      horizontal_line 400, 530, :at => cursor + 8
    end
    draw_text "NOMBRE Y FIRMA", size: 8, :at => [40,cursor]
    draw_text "ING. PEDRO A. MONTIEL MORALES", size: 7, :at => [12,cursor+10]
    draw_text "NOMBRE Y FIRMA", size: 8, :at => [175,cursor]
    draw_text "LORENA VERA CRUZ", size: 7, :at => [175,cursor+10]
    draw_text "NOMBRE Y FIRMA", size: 8, :at => [297,cursor]
    draw_text "LIC. ADRIANA RAMOS G.", size: 7, :at => [291,cursor+10]
    draw_text "NOMBRE Y FIRMA", size: 8, :at => [429,cursor]
    draw_text "LIC. MA. ISABEL GARCÍA ROSAS", size: 7, :at => [412  ,cursor+10]
    move_down 3.mm
    draw_text "SERVICIOS GENERALES", size: 8, :at => [25,cursor]
    draw_text "RESPONSABLE DE", size: 8, :at => [295,cursor]
    draw_text "SECRETARIO O JEFE DE", size: 8, :at => [417,cursor]
    move_down 3.mm
    draw_text "PRESUPUESTO", size: 8, :at => [300,cursor]
    draw_text "UNIDAD ADMINISTRATIVA", size: 8, :at => [415,cursor]
  end

  def evaluacion
    y6=cursor
    fill_color "BDBDBD"
    fill_rectangle [15, 155], 515, 25
    fill_color "000000"
    stroke_color "000000"
    stroke do
      rectangle [15,155], 515, 95
      horizontal_line 15,530, :at => 130
      vertical_line 60,155, :at => 323
    end
    bounding_box([15,155], :width => 308, :height => 25) do
      text"OBSERVACIONES", size: 9, :align => :center, :valign => :center, style: :bold
    end
    bounding_box([323,155], :width => 207, :height => 25) do
      text"CONFORMIDAD DEL USUARIO DE RECIBIR EL SERVICIO EN LA FECHA COMPROMISO", size: 8, :align => :center, :valign => :center, style: :bold
    end
    stroke do
      horizontal_line 15, 323, :at => cursor-14
      horizontal_line 15, 323, :at => cursor-28
      horizontal_line 15, 323, :at => cursor-42
      horizontal_line 15, 323, :at => cursor-56
    end
    stroke do
      horizontal_line 323,530, :at => cursor-56
    end
    draw_text "NOMBRE Y FIRMA", size: 8, :at => [392, 65]
    draw_text"MARÍA GLADYS CASTILLO GUERRERO", size: 8, :at => [353,78]
    draw_text"Nota: Es necesario elaborar una solicitud por cada servicio requerido", size: 8, :at => [15,50], style: :bold
  end

  def codigo
    draw_text "Página 1 de 1", size: 12, :at => [235,-5]
    draw_text "F01 PSG 0201 Revisión 00", size: 12, :at => [380,-5]
  end
end