class EspacioPdf < Prawn::Document
  require "prawn/measurement_extensions"

  def initialize(espacios)
    super()
    @espacios = espacios
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
    draw_text"FOLIO:", size: 9, :at => [450,y1]
    move_down 6.mm
    y2=cursor-6
    text"RESPONSABLE DEL ÁREA SOLICITANTE:", size: 9
    draw_text"FECHA DE LA SOLICITUD:", size: 9, :at => [368,y2]
    draw_text"NOMBRE Y FIRMA", size: 9, :at => [235,y2-10]
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
    draw_text"FECHA:", size: 9, :at => [260,cursor]
    draw_text"HORARIO:", size: 9, :at => [400,cursor]
    move_down 6.mm
    draw_text"AULAS", size: 9, :at => [10,cursor]
    draw_text"LIMPIEZA", size: 9, :at => [140,cursor]
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
    draw_text "VO. BO. DE CONFIRMACIÓN DE", size: 8, :at => [10,cursor]
    draw_text "REALIZÓ", size: 8, :at => [245,cursor]
    draw_text "VO. BO. DE SUFICIENCIA", size: 8, :at => [351,cursor]
    draw_text "AUTORIZÓ", size: 8, :at => [485,cursor]
    move_down 4.mm
    draw_text "REQUISITOS", size: 8, :at => [45,cursor]
    draw_text "PRESUPUESTAL", size: 8, :at => [370,cursor]
    move_down 23.mm
    stroke do
      horizontal_line 0, 145, :at => cursor + 8
      horizontal_line 210, 320, :at => cursor + 8
      horizontal_line 350, 440, :at => cursor + 8
      horizontal_line 460, 550, :at => cursor + 8
    end
    draw_text "NOMBRE Y FIRMA", size: 8, :at => [40,cursor]
    draw_text "NOMBRE Y FIRMA", size: 8, :at => [230,cursor]
    draw_text "NOMBRE Y FIRMA", size: 8, :at => [360,cursor]
    draw_text "NOMBRE Y FIRMA", size: 8, :at => [470,cursor]
    move_down 3.mm
    draw_text "SERVICIOS GENERALES", size: 8, :at => [25,cursor]
    draw_text "RESPONSABLE DE", size: 8, :at => [360,cursor]
    draw_text "SECRETARIO O JEFE DE", size: 8, :at => [450,cursor]
    move_down 3.mm
    draw_text "PRESUPUESTO", size: 8, :at => [370,cursor]
    draw_text "UNIDAD ADMINISTRATIVA", size: 8, :at => [450,cursor]
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
  end

  def codigo
    draw_text "F01 PSG 0303 Rev. 3", size: 9, :at => [450,0]
  end

  #def text_content
    # The cursor for inserting content starts on the top left of the page. Here we move it down a little to create more space between the text and the image inserted above
  #  y_position = cursor - 50

    # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
  #  bounding_box([0, y_position], :width => 270, :height => 300) do
  #    text "Lorem ipsum", size: 15, style: :bold
  #    text "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse interdum semper placerat. Aenean mattis fringilla risus ut fermentum. Fusce posuere dictum venenatis. Aliquam id tincidunt ante, eu pretium eros. Sed eget risus a nisl aliquet scelerisque sit amet id nisi. Praesent porta molestie ipsum, ac commodo erat hendrerit nec. Nullam interdum ipsum a quam euismod, at consequat libero bibendum. Nam at nulla fermentum, congue lectus ut, pulvinar nisl. Curabitur consectetur quis libero id laoreet. Fusce dictum metus et orci pretium, vel imperdiet est viverra. Morbi vitae libero in tortor mattis commodo. Ut sodales libero erat, at gravida enim rhoncus ut."
  #  end

  #  bounding_box([300, y_position], :width => 270, :height => 300) do
  #   text "Duis vel", size: 15, style: :bold
  #    text "Duis vel tortor elementum, ultrices tortor vel, accumsan dui. Nullam in dolor rutrum, gravida turpis eu, vestibulum lectus. Pellentesque aliquet dignissim justo ut fringilla. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut venenatis massa non eros venenatis aliquet. Suspendisse potenti. Mauris sed tincidunt mauris, et vulputate risus. Aliquam eget nibh at erat dignissim aliquam non et risus. Fusce mattis neque id diam pulvinar, fermentum luctus enim porttitor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos."
  #  end

  #end

  #def table_content
    # This makes a call to product_rows and gets back an array of data that will populate the columns and rows of a table
    # I then included some styling to include a header and make its text bold. I made the row background colors alternate between grey and white
    # Then I set the table column widths
  #  table espacio_rows do
  #    row(0).font_style = :bold
  #    self.header = true
  #    self.row_colors = ['DDDDDD', 'FFFFFF']
  #    self.column_widths = [40, 300, 200]
  #  end
  #end

  #def espacio_rows
  #  [['#', 'nombre']] +
  #    @espacios.map do |espacio|
  #    [espacio.id, espacio.nombre]
  #  end
  #end
end