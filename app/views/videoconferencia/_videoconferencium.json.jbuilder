#json.extract! videoconferencium, :id, :created_at, :updated_at
#json.url videoconferencium_url(videoconferencium, format: :json)
#date_format = reservacion.all_day? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'

if videoconferencium.aprobacion == true
  json.title videoconferencium.tituloActividad
  json.start "#{videoconferencium.fechaActividad}T#{videoconferencium.horainicio.strftime("%H:%M:%S")}Z"
  json.end "#{videoconferencium.fechaActividad}T#{videoconferencium.horafin.strftime("%H:%M:%S")}Z"
else
  json.title videoconferencium.tituloActividad
  json.start "#{videoconferencium.fechaActividad}T#{videoconferencium.horainicio.strftime("%H:%M:%S")}Z"
  json.end "#{videoconferencium.fechaActividad}T#{videoconferencium.horafin.strftime("%H:%M:%S")}Z"
  json.color '#F00'
end

#json.extract! @videoconferencium do |videoconferencium|
  #date_format = videoconferencia.all_day? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'
  #date_format = '%Y-%m-%dT%H:%M:%S'
  #json.id reservacion.id
  #json.title videoconferencia.tituloActividad
  #json.start videoconferencia.fechaActividad
  #json.end videoconferencia.fechaActividad
  #json.allDay reservacion.all_day_event? ? true : false
  #json.update_url reservacion_path(reservacion, method: :patch)
  #json.update_url reservacion_path(reservacion, format: :html)
  #json.edit_url edit_reservacion_path(reservacion)
#end