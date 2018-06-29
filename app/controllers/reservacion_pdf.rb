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
    move_down 10.mm
    y1=cursor-6
    text"ÁREA SOLICITANTE:", size: 9
    draw_text"DEPARTAMENTO DE DIFUSIÓN", size: 8, :at => [150,y1+2]
    draw_text"FOLIO:", size: 9, :at => [450,y1]
    move_down 6.mm
    y2=cursor-6
    text"RESPONSABLE DEL ÁREA SOLICITANTE:", size: 9
    draw_text"MARÍA GLADYS CASTILLO GUERRERO", size: 8, :at => [190,y2+2]
    draw_text"FECHA DE LA SOLICITUD:", size: 9, :at => [368,y2]
    draw_text"|       |", size: 10, :at => [508,y2+2]
    draw_text"NOMBRE Y FIRMA", size: 9, :at => [235,y2-10]
    draw_text"DÍA   MES   AÑO", size: 7, :at => [495,y2-10]
    move_down 5.mm
    y3=cursor-6
    text"NOMBRE DEL USUARIO:", size: 9
    draw_text"#{@reservacion.nresponsable}", size: 10, :at => [150,y3+2]
    draw_text"TELÉFONO:", size: 9, :at => [429,y3]

    stroke do
      horizontal_line 100, 350, :at => y1
      horizontal_line 490, 550, :at => y1
      horizontal_line 190, 350, :at => y2
      horizontal_line 490, 550, :at => y2
      horizontal_line 120, 350, :at => y3
      horizontal_line 490, 550, :at => y3
    end
  end

  def servicios
    fill_color "BDBDBD"
    fill_rectangle [0, 540], 550, 20
    fill_color "000000"
    stroke_color "000000"
    stroke do
      rectangle [0,540], 550, 135
      horizontal_line 0,550, :at => 520
      vertical_line 405,520, :at => 200
      vertical_line 405,520, :at => 400
    end
    bounding_box([0,540], :width => 550, :height => 20) do
      text"TIPO DE SERVICIO", size: 9, :align => :center, :valign => :center
    end
    move_down 8.mm
    draw_text"PRÉSTAMO DE:", size: 9, :at => [2,cursor]
    draw_text"CAFETERÍA", size: 9, :at => [210,cursor]
    draw_text"LIMPIEZA", size: 9, :at => [320,cursor]
    move_down 10.mm
    stroke do
      rectangle [60,cursor+9], 18,20
      rectangle [60,cursor-25], 18,20

      rectangle [165,cursor+9], 18,20
      rectangle [165,cursor-25], 18,20

      rectangle [280,cursor+43], 18,20
      rectangle [280,cursor+9], 18,20
      rectangle [280,cursor-25], 18,20

      rectangle [370,cursor+43], 18,20
      rectangle [370,cursor+9], 18,20

      horizontal_line 460,530, :at => cursor
      horizontal_line 460,530, :at => cursor-12.mm
      horizontal_line 320,390, :at => cursor-12.mm-10
    end
    draw_text"SALA DE", size: 9, :at => [10,cursor]
    draw_text"JUNTAS", size: 9, :at => [10,cursor-10]
    draw_text"AUDITORIOS", size: 9, :at => [100,cursor]
    draw_text"CERRAJERÍA", size: 10, :at => [210,cursor]
    draw_text"OTRO", size: 10, :at => [320,cursor]
    draw_text"FECHA:", size: 9, :at => [420,cursor]
    move_down 12.mm
    draw_text"AULAS", size: 9, :at => [10,cursor-4]
    draw_text"EQUIPO", size: 9, :at => [100,cursor]
    draw_text"AUDIOVISUAL", size: 9, :at => [100,cursor-10]
    draw_text"TRASLADO", size: 9, :at => [210,cursor]
    draw_text"DE BIENES", size: 9, :at => [210,cursor-10]
    draw_text"HORA:", size: 9, :at => [425,cursor]
    move_down 6.mm
    
    move_down 6.mm
    
  end

  def fechas
    move_down 10.mm
    y5=cursor-50
    draw_text "FECHA COMPROMISO:", size: 9, :at => [0,y5]
    stroke do
      horizontal_line 105, 240, :at => y5
    end
  end

  def observaciones
    move_down 4.mm
    fill_color "BDBDBD"
    fill_rectangle [290, cursor-20], 260, 25
    fill_color "000000"
    stroke_color "000000"
    stroke do
      rectangle [290,cursor-20], 260, 150
    end
    bounding_box([290,cursor-20], :width => 260, :height => 25) do
      text"CUANDO EL SERVICIO TENGA UN COSTO Y REQUIERA AUTORIZACIÓN PRESUPUESTAL", size: 8, :align => :center, :valign => :center, style: :bold
    end
    move_down 10.mm
    draw_text "COSTO:", size: 8, :at => [425,cursor+12.5]
    draw_text "CON CARGO A:", size: 8, :at => [296.2,cursor+12.5]
    stroke do
      horizontal_line 360, 420, :at => cursor + 12.5
      horizontal_line 460, 545, :at => cursor + 12.5
    end
    move_down 3.mm
    draw_text "VO. BO. DE CONFIRMACIÓN DE", size: 8, :at => [10,cursor]
    draw_text "REALIZÓ", size: 8, :at => [205,cursor]
    draw_text "VO. BO. DE SUFICIENCIA", size: 8, :at => [351,cursor]
    draw_text "AUTORIZÓ", size: 8, :at => [485,cursor]
    move_down 4.mm
    draw_text "REQUISITOS", size: 8, :at => [45,cursor]
    draw_text "PRESUPUESTAL", size: 8, :at => [370,cursor]
    move_down 20.mm
    stroke do
      horizontal_line 0, 145, :at => cursor + 8
      horizontal_line 170, 280, :at => cursor + 8
      horizontal_line 350, 435, :at => cursor + 8
      horizontal_line 445, 550, :at => cursor + 8
    end
    draw_text "NOMBRE Y FIRMA", size: 8, :at => [40,cursor]
    draw_text "ING. PEDRO A. MONTIEL MORALES", size: 7, :at => [12,cursor+10]
    draw_text "NOMBRE Y FIRMA", size: 8, :at => [190,cursor]
    draw_text "LORENA VERA CRUZ", size: 7, :at => [190,cursor+10]
    draw_text "NOMBRE Y FIRMA", size: 8, :at => [358,cursor]
    draw_text "LIC. ADRIANA RAMOS G.", size: 7, :at => [353,cursor+10]
    draw_text "NOMBRE Y FIRMA", size: 8, :at => [465,cursor]
    draw_text "LIC. MA. ISABEL GARCÍA ROSAS", size: 7, :at => [444  ,cursor+10]
    move_down 3.mm
    draw_text "SERVICIOS GENERALES", size: 8, :at => [25,cursor]
    draw_text "RESPONSABLE DE", size: 8, :at => [356,cursor]
    draw_text "SECRETARIO O JEFE DE", size: 8, :at => [448,cursor]
    move_down 3.mm
    draw_text "PRESUPUESTO", size: 8, :at => [365,cursor]
    draw_text "UNIDAD ADMINISTRATIVA", size: 8, :at => [448,cursor]
  end

  def evaluacion
    y6=cursor
    fill_color "BDBDBD"
    fill_rectangle [0, 180], 550, 25
    fill_color "000000"
    stroke_color "000000"
    stroke do
      rectangle [0,180], 550, 120
      horizontal_line 0,550, :at => 155
      vertical_line 60,180, :at => 350
    end
    bounding_box([0,180], :width => 350, :height => 25) do
      text"OBSERVACIONES", size: 9, :align => :center, :valign => :center
    end
    bounding_box([350,180], :width => 200, :height => 25) do
      text"CONFORMIDAD DEL USUARIO DE RECIBIR EL SERVICIO EN LA FECHA COMPROMISO", size: 8, :align => :center, :valign => :center
    end
    stroke do
      horizontal_line 0, 350, :at => cursor-20
      horizontal_line 0, 350, :at => cursor-40
      horizontal_line 0, 350, :at => cursor-60
      horizontal_line 0, 350, :at => cursor-80
    end
    stroke do
      horizontal_line 350,550, :at => cursor-80
    end
    draw_text "NOMBRE Y FIRMA", size: 8, :at => [415, 65]
    draw_text"MARÍA GLADYS CASTILLO GUERRERO", size: 8, :at => [380,78]
    draw_text"Nota: Es necesario elaborar una solicitud por cada servicio requerido", size: 8, :at => [0,50], style: :bold
  end

  def codigo
    draw_text "Página 1 de 1", size: 9, :at => [240,0]
    draw_text "F01 PSG 0201 Revisión 00", size: 9, :at => [440,0]
  end
end