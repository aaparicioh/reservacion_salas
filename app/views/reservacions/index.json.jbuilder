#json.array! @reservacions, partial: 'reservacions/reservacion', as: :reservacion

json.array! @reservacions do |reservacion|
  if reservacion.espacio_id == $espacioActual
    json.title "#{reservacion.nevento} - #{reservacion.nresponsable} - #{reservacion.asistentes}p"
    json.start "#{reservacion.fechainicio}T#{reservacion.horainicio.strftime('%H:%M:%S')}Z"
    json.end "#{reservacion.fechafin}T#{reservacion.horafin.strftime('%H:%M:%S')}Z"
    json.description "#{reservacion.nresponsable}"
    if reservacion.aprobacion == false
      json.color '#F00'
    end
  end

  if $espacioActual==0
    if reservacion.aprobacion == true
      json.title "#{reservacion.nevento} - #{reservacion.espacio.nombre} - #{reservacion.nresponsable} - #{reservacion.asistentes}p - Estado: Aprobada"
    else
      json.title "*#{reservacion.nevento} - #{reservacion.espacio.nombre} - #{reservacion.nresponsable} - #{reservacion.asistentes}p - Estado: Pendiente"
    end
    json.start "#{reservacion.fechainicio}T#{reservacion.horainicio.strftime('%H:%M:%S')}Z"
    json.end "#{reservacion.fechafin}T#{reservacion.horafin.strftime('%H:%M:%S')}Z"
    if reservacion.aprobacion == false
      json.color '#F00'
    end
    #if reservacion.espacio_id == 1 #En caso de colocar un color para cada espacio
    #  json.color '#4A235A'
    #end
  end

  #json.allDay reservacion.all_day_event? ? true : false
  #json.update_url reservacion_path(reservacion, method: :patch)
  #json.update_url reservacion_path(reservacion, format: :html)
  #json.edit_url edit_reservacion_path(reservacion)
end