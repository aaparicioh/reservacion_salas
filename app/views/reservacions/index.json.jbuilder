#json.array! @reservacions, partial: 'reservacions/reservacion', as: :reservacion

json.array! @reservacions do |reservacion|
  if reservacion.espacio_id == $espacioActual
    if reservacion.aprobacion == true
      json.title reservacion.nevento
      json.start "#{reservacion.fechainicio}T#{reservacion.horainicio.strftime('%H:%M:%S')}Z"
      json.end "#{reservacion.fechafin}T#{reservacion.horafin.strftime('%H:%M:%S')}Z"
      json.description reservacion.nresponsable
    else
      json.title reservacion.nevento
      json.start "#{reservacion.fechainicio}T#{reservacion.horainicio.strftime('%H:%M:%S')}Z"
      json.end "#{reservacion.fechafin}T#{reservacion.horafin.strftime('%H:%M:%S')}Z"
      json.description reservacion.nresponsable
      json.color '#F00'
    end
  end

  if $espacioActual==0
    if reservacion.aprobacion == true
      json.title "#{reservacion.nevento} - #{reservacion.espacio.nombre} - Estado: Aprobada"
    else
      json.title "*#{reservacion.nevento} - #{reservacion.espacio.nombre} - Estado: Pendiente"
    end
    json.start "#{reservacion.fechainicio}T#{reservacion.horainicio.strftime('%H:%M:%S')}Z"
    json.end "#{reservacion.fechafin}T#{reservacion.horafin.strftime('%H:%M:%S')}Z"
    if reservacion.aprobacion == false
      json.color '#F00'
    end
    #if reservacion.espacio_id == 1
    #  json.color '#4A235A'
    #elsif reservacion.espacio_id == 2
    #    json.color '#884EA0'
    #  elsif reservacion.espacio_id == 3
    #      json.color '#D498F9'
    #    elsif reservacion.espacio_id == 4
    #        json.color '#11B5D6'
    #      elsif reservacion.espacio_id == 5
    #          json.color '#14788C'
    #        elsif reservacion.espacio_id == 6
    #            json.color '#014957'
    #end
  end

  #json.allDay reservacion.all_day_event? ? true : false
  #json.update_url reservacion_path(reservacion, method: :patch)
  #json.update_url reservacion_path(reservacion, format: :html)
  #json.edit_url edit_reservacion_path(reservacion)
end