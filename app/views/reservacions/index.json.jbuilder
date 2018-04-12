#json.array! @reservacions, partial: 'reservacions/reservacion', as: :reservacion

json.array! @reservacions do |reservacion|
  #date_format = reservacion.all_day? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'
  #date_format = '%Y-%m-%dT%H:%M:%S'
  #json.id reservacion.id
  if reservacion.espacio_id == $espacioActual
    if reservacion.aprobacion == true
      json.title reservacion.nevento
      json.start reservacion.fechainicio#.strftime(date_format)
      json.end reservacion.fechafin#.strftime(date_format)
    else
      json.title reservacion.nevento
      json.start reservacion.fechainicio#.strftime(date_format)
      json.end reservacion.fechafin#.strftime(date_format)
      json.color '#F00'
    end
  end
  #json.allDay reservacion.all_day_event? ? true : false
  #json.update_url reservacion_path(reservacion, method: :patch)
  #json.update_url reservacion_path(reservacion, format: :html)
  #json.edit_url edit_reservacion_path(reservacion)
end