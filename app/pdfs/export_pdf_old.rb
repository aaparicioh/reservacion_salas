class ExportPdf < Prawn::Document#.generate("calendario.pdf", :page_layout => :landscape)
  require "prawn/measurement_extensions"
  # "include" instead of subclassing Prawn::Document
  # as advised by the official manual
  #include Prawn::View
  #require "prawn/measurement_extensions"
  def initialize()
    super()
    @reservacions = Reservacion.all
    @inicio_alto = 635
    @ancho = 550
    @ancho_inicio = 70
    @num_salas = 7
    @alto_fila_enc = 25
    @alto_fila_hora = 24
    $fecha=Time.new(2018,10,12)#Time.now
    encabezado
    fecha
    salas
    programacion
    pie_pagina
  end

  def encabezado
    image "#{Rails.root}/app/assets/images/UNAM-Escudo.jpg", width: 57, height: 61, :at => [20,725]
    image "#{Rails.root}/app/assets/images/ceiich-300dpi.jpg", width: 71, height: 61, :at => [470,725]
    text"UNIVERSIDAD NACIONAL AUTÓNOMA DE MÉXICO", size: 12, style: :bold, align: :center
    move_down 1.5.mm
    text"CENTRO DE INVESTIGACIONES INTERDISCIPLINARIAS", size: 12, align: :center
    text"EN CIENCIAS Y HUMANIDADES", size: 12, align: :center
    move_down 1.5.mm
    text"DEPARTAMENTO DE DIFUSIÓN", size: 10, align: :center
    move_down 1.5.mm
    text"CALENDARIO DE ACTIVIDADES ACADÉMICAS, "+$fecha.strftime("%Y"), size: 9, style: :bold, align: :center
  end

  def fecha
    anio=$fecha.strftime("%Y").to_i
    mes=$fecha.strftime("%m").to_i
    dia=$fecha.strftime("%d").to_i
    bisiesto = anio%4
    emes = [0,3,3,6,1,4,6,2,5,0,3,5,0,3,4,0,2,5,0,3,6,1,4,6]
    if bisiesto != 0
      eme = emes[mes-1]
    else
      eme = emes[mes+11]
    end
    d = ( (anio-1)%7 + ( (anio-1)/4 - 3*( (anio-1)/100 + 1)/4 )%7 + eme + dia%7 )%7
    dias = ['Domingo','Lunes','Martes','Miércoles','Jueves','Viernes','Sábado']

    fill_color "BDBDBD"
    fill_rectangle [0, @inicio_alto], @ancho_inicio, 2*@alto_fila_enc
    fill_color "000000"
    stroke_color "000000"
    stroke do
      rectangle [0,@inicio_alto], @ancho_inicio, 2*@alto_fila_enc
      horizontal_line 0,@ancho_inicio, :at => @inicio_alto-@alto_fila_enc
    end
    mes_num = $fecha.strftime("%m").to_i
    meses = ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre']
    bounding_box([0,@inicio_alto], :width => @ancho_inicio, :height => @alto_fila_enc) do
      text meses[mes_num-1], size: 12, :align => :center, :valign => :center
    end
    bounding_box([0,@inicio_alto-@alto_fila_enc], :width => @ancho_inicio, :height => @alto_fila_enc) do
      text dias[d]+" "+$fecha.strftime("%d"), size: 12, :align => :center, :valign => :center
    end
  end

  def salas
    $ancho_celda = (@ancho-@ancho_inicio)/@num_salas
    nom_salas = ['Auditorio 4°','Sala 1 5°','Sala 2 5°','Auditorio 5°','Sala 6°','Sala Anexo','Video 5°']
    fill_color "000000"
    stroke_color "000000"
    stroke do
      rectangle [@ancho_inicio,@inicio_alto-@alto_fila_enc], @num_salas*$ancho_celda, @alto_fila_enc
      i = 0
      until i > @num_salas-1 do
        vertical_line @inicio_alto-2*@alto_fila_enc-24*@alto_fila_hora,@inicio_alto-@alto_fila_enc, :at => (@ancho_inicio+i*$ancho_celda)
        bounding_box([@ancho_inicio+i*$ancho_celda,@inicio_alto-@alto_fila_enc], :width => $ancho_celda, :height => @alto_fila_enc) do
          text nom_salas[i], size: 10, :align => :center, :valign => :center
        end
        i += 1
      end
      vertical_line @inicio_alto-2*@alto_fila_enc-24*@alto_fila_hora,@inicio_alto-@alto_fila_enc, :at => (@ancho_inicio+i*$ancho_celda)
    end
  end

  def programacion
    stroke do
      rectangle [0,@inicio_alto-2*@alto_fila_enc], @ancho_inicio, 24*@alto_fila_hora
      i = 0
      until i > 11 do
        horizontal_line 0,@ancho_inicio, :at => @inicio_alto-2*@alto_fila_enc-2*i*@alto_fila_hora
        horizontal_line 0,@ancho_inicio, :at => @inicio_alto-2*@alto_fila_enc-(2*i+1)*@alto_fila_hora
        if i%2 == 0
          horizontal_line @ancho_inicio,@ancho_inicio+7*$ancho_celda, :at => @inicio_alto-2*@alto_fila_enc-i*@alto_fila_hora
          horizontal_line @ancho_inicio,@ancho_inicio+7*$ancho_celda, :at => @inicio_alto-2*@alto_fila_enc-(12+i)*@alto_fila_hora
        end
        bounding_box([0,@inicio_alto-2*@alto_fila_enc-2*i*@alto_fila_hora], :width => @ancho_inicio, :height => @alto_fila_hora) do
          horario = (i+8).to_s+":00 - "+(i+8).to_s+":30"
          text horario, size: 10, :align => :center, :valign => :center
        end
        bounding_box([0,@inicio_alto-2*@alto_fila_enc-(2*i+1)*@alto_fila_hora], :width => @ancho_inicio, :height => @alto_fila_hora) do
          horario = (i+8).to_s+":30 - "+(i+9).to_s+":00"
          text horario, size: 10, :align => :center, :valign => :center
        end
        i += 1
      end
      horizontal_line @ancho_inicio,@ancho_inicio+7*$ancho_celda, :at => @inicio_alto-2*@alto_fila_enc-(12+i)*@alto_fila_hora
    end

    #text "Aquí van todas las actividades programadas"
    $icono=10
    @reservacions.each do |r|
      if (r.fechainicio.strftime("%d-%m-%Y") == $fecha.strftime("%d-%m-%Y")) && r.aprobacion
        #bounding_box([0,@inicio_alto-2*@alto_fila_enc-(2*i+1)*@alto_fila_hora], :width => $ancho_celda, :height => @alto_fila_hora*(r.horafin-r.horainicio)*2) do
        celdas_abajo=(r.horainicio.strftime("%H").to_i-8)*2+(r.horainicio.strftime("%M").to_f/30)
        fill_color "D0D0DD"
        fill_rectangle [@ancho_inicio+$ancho_celda*(r.espacio_id-1),@inicio_alto-2*@alto_fila_enc-celdas_abajo*@alto_fila_hora], $ancho_celda, @alto_fila_hora*2*(r.horafin-r.horainicio)/3600
        fill_color "000000"
        bounding_box([@ancho_inicio+$ancho_celda*(r.espacio_id-1),@inicio_alto-2*@alto_fila_enc-celdas_abajo*@alto_fila_hora], :width => $ancho_celda, :height => @alto_fila_hora*2*(r.horafin-r.horainicio)/3600) do
          image "#{Rails.root}/app/assets/images/pc.png", width: $icono, height: $icono, :at => [0,$icono] if r.pc
          image "#{Rails.root}/app/assets/images/skype.png", width: $icono, height: $icono, :at => [$icono,$icono] if r.conexSkype
          image "#{Rails.root}/app/assets/images/www.png", width: $icono, height: $icono, :at => [2*$icono,$icono] if r.conexInternet
          #text r.horainicio.strftime("%H:%M - ")+r.horafin.strftime("%H:%M ")+r.nevento, size: 8, :align => :center, :valign => :center
          text r.tipoactividad+"\n"+r.nevento+" "+r.nresponsable+" "+r.asistentes.to_s+"p", size: 8, :align => :center, :valign => :center
        end
      end
    end
  end

  def pie_pagina
    draw_text "Fecha y hora de generación: "+Time.now.strftime("%d-%m-%Y %H:%M"), size: 10, :at => [335,0]
  end
end