class CalendarioPdf < Prawn::Document
  require "prawn/measurement_extensions"

  def initialize(calendarios)
    super()
    @calendarios = calendarios
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
    image "#{Rails.root}/app/assets/images/ceiich-300dpi.jpg", width: 71, height: 61, :at => [470,700]
    move_down 10.mm
    text"UNIVERSIDAD NACIONAL AUTÓNOMA DE MÉXICO", size: 12, style: :bold, align: :center
    text"SECRETARÍAS Y UNIDADES ADMINISTRATIVAS", size: 12, align: :center
    text"SERVICIOS GENERALES", size: 12, align: :center
    text"SOLICITUD DE SERVICIOS DIVERSOS", size: 11, style: :bold, align: :center
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
    draw_text"TELÉFONO:", size: 9, :at => [429,y3]

    stroke do
      horizontal_line 100, 350, :at => y1
      horizontal_line 490, 550, :at => y1
      horizontal_line 190, 350, :at => y2
      horizontal_line 490, 550, :at => y2
      horizontal_line 120, 350, :at => y3
      horizontal_line 490, 550, :at => y3
      move_down 6.mm
      horizontal_line 120, 350, :at => cursor
    end
  end

  def servicios
    fill_color "BDBDBD"
    fill_rectangle [0, 510], 550, 25
    fill_color "000000"
    stroke_color "000000"
    stroke do
      rectangle [0,510], 550, 135
      horizontal_line 0,550, :at => 485
      vertical_line 375,510, :at => 250
    end
    bounding_box([0,510], :width => 250, :height => 25) do
      text"TIPO DE SERVICIO", size: 9, :align => :center, :valign => :center
    end
    bounding_box([250,510], :width => 300, :height => 25) do
      text"DESCRIPCIÓN DEL SERVICIO REQUERIDO", size: 9, :align => :center, :valign => :center
    end
    move_down 4.mm
    draw_text"PRÉSTAMO DE:", size: 9, :at => [2,cursor]
    move_down 5.mm
    stroke do
      rectangle [95,cursor+9], 18,12
      rectangle [95,cursor-8], 18,12
      rectangle [95,cursor-25], 18,12
      rectangle [95,cursor-43], 18,12
      rectangle [95,cursor-59], 18,12
      rectangle [200,cursor+9], 18,12
      rectangle [200,cursor-8], 18,12
      rectangle [200,cursor-25], 18,12
      horizontal_line 300,380, :at => cursor
      horizontal_line 460,550, :at => cursor
      horizontal_line 460,550, :at => cursor-34
      horizontal_line 140,218, :at => cursor-52
      horizontal_line 250,550, :at => cursor-52
      horizontal_line 140,218, :at => cursor-68
      horizontal_line 250,550, :at => cursor-68
    end
    draw_text"SALA DE JUNTAS", size: 9, :at => [10,cursor]
    draw_text"CAFETERÍA", size: 9, :at => [140,cursor]
    draw_text"X", size: 10, :at => [206,cursor-1]
    draw_text"FECHA:", size: 9, :at => [260,cursor]
    draw_text"HORARIO:", size: 9, :at => [400,cursor]
    move_down 6.mm
    draw_text"AULAS", size: 9, :at => [10,cursor]
    draw_text"LIMPIEZA", size: 9, :at => [140,cursor]
    draw_text"X", size: 10, :at => [206,cursor-1]
    move_down 6.mm
    draw_text"SALONES", size: 9, :at => [10,cursor]
    draw_text"OTRO", size: 9, :at => [140,cursor]
    draw_text"OTRAS ESPECIFICACIONES O REQUISITOS:", size: 9, :at => [260,cursor]
    move_down 6.mm
    draw_text"AUDITORIOS", size: 9, :at => [10,cursor]
    move_down 6.mm
    draw_text"EQ. AUDIOVISUAL", size: 9, :at => [10,cursor]
  end

  def fechas
    move_down 10.mm
    y5=cursor-6
    text"FECHA COMPROMISO:", size: 9
    draw_text"FECHA DE LIBERACIÓN:", size: 9, :at => [308,y5]
    stroke do
      horizontal_line 120, 240, :at => y5
      horizontal_line 430, 550, :at => y5
    end
  end

  def observaciones
    move_down 4.mm
    text "OBSERVACIONES:", size: 9, style: :bold
    fill_color "BDBDBD"
    fill_rectangle [350, cursor+15], 200, 30
    fill_color "000000"
    stroke_color "000000"
    stroke do
      rectangle [350,cursor+15], 200, 180
      horizontal_line 120, 350, :at => cursor
      horizontal_line 0, 550, :at => cursor - 15
      horizontal_line 0, 350, :at => cursor - 30
      horizontal_line 0, 350, :at => cursor - 45
    end
    bounding_box([350,cursor+15], :width => 200, :height => 30) do
      text"CUANDO EL SERVICIO TENGA UN COSTO Y REQUIERA AUTORIZACIÓN PRESUPUESTAL", size: 8, :align => :center, :valign => :center
    end
    move_down 15.mm
    draw_text "COSTO:", size: 8, :at => [385,cursor+27.5]
    draw_text "CON CARGO A:", size: 8, :at => [356.2,cursor+12.5]
    stroke do
      horizontal_line 420, 520, :at => cursor + 27.5
      horizontal_line 420, 520, :at => cursor + 12.5
    end
    move_down 5.mm
    draw_text "VO. BO. DE CONFIRMACIÓN DE", size: 8, :at => [10,cursor]
    draw_text "REALIZÓ", size: 8, :at => [245,cursor]
    draw_text "VO. BO. DE SUFICIENCIA", size: 8, :at => [351,cursor]
    draw_text "AUTORIZÓ", size: 8, :at => [485,cursor]
    move_down 4.mm
    draw_text "REQUISITOS", size: 8, :at => [45,cursor]
    draw_text "PRESUPUESTAL", size: 8, :at => [370,cursor]
    move_down 20.mm
    stroke do
      horizontal_line 0, 145, :at => cursor + 8
      horizontal_line 210, 320, :at => cursor + 8
      horizontal_line 350, 435, :at => cursor + 8
      horizontal_line 445, 550, :at => cursor + 8
    end
    draw_text "NOMBRE Y FIRMA", size: 8, :at => [40,cursor]
    draw_text "ING. PEDRO A. MONTIEL MORALES", size: 7, :at => [12,cursor+10]
    draw_text "NOMBRE Y FIRMA", size: 8, :at => [230,cursor]
    draw_text "LORENA VERA CRUZ", size: 7, :at => [230,cursor+10]
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
    fill_rectangle [0, 145], 550, 25
    fill_color "000000"
    stroke_color "000000"
    stroke do
      rectangle [0,145], 550, 75
      horizontal_line 0,550, :at => 120
      vertical_line 70,145, :at => 350
    end
    bounding_box([0,145], :width => 350, :height => 25) do
      text"¿CÓMO CALIFICA EL SERVICIO RECIBIDO?", size: 9, :align => :center, :valign => :center
    end
    bounding_box([350,145], :width => 200, :height => 25) do
      text"CONFORMIDAD DEL USUARIO DE RECIBIR EL SERVICIO EN LA FECHA COMPROMISO", size: 8, :align => :center, :valign => :center
    end
    draw_text "EXCELENTE", size: 9, :at => [5,cursor-23]
    draw_text"X", size: 10, :at => [71,cursor-24]
    draw_text "BUENO", size: 9, :at => [95,cursor-23]
    draw_text "REGULAR", size: 9, :at => [185,cursor-23]
    draw_text "MALO", size: 9, :at => [275,cursor-23]
    stroke do
      rectangle [65,cursor-14], 18,12
      rectangle [135,cursor-14], 18,12
      rectangle [240,cursor-14], 18,12
      rectangle [315,cursor-14], 18,12
    end
    stroke do
      horizontal_line 350,550, :at =>80
    end
    draw_text "NOMBRE Y FIRMA", size: 8, :at => [415, 72]
    draw_text"MARÍA GLADYS CASTILLO GUERRERO", size: 8, :at => [380,82]
  end

  def codigo
    draw_text "F01 PSG 0303 Rev. 3", size: 9, :at => [450,0]
  end
end