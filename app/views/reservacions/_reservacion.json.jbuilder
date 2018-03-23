#json.extract! reservacion, :id, :nresponsable, :nevento, :fechainicio, :fechafin, :horainicio, :horafin, :repeticion, :idrepeticiones, :aprobacion, :tipoactividad, :fechasolicitud, :cartel, :programa, :constancias, :mesaRedonda, :auditorio, :videoproyector, :pc, :conexInternet, :pizarron, :traducSimultanea, :conexSkype, :videoconferencia, :webcast, :grabVideo, :grabAudio, :cafe, :galletas, :fruta, :asistentes, :created_at, :updated_at
#json.extract! @reservacion, :id, :nevento, :fechainicio, :fechafin
#json.url reservacion_url(reservacion, format: :json)

#date_format = reservacion.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'

#json.id reservacion.id
#json.title reservacion.nevento
#json.start reservacion.fechainicio.start.strftime(date_format)
#json.end reservacion.fechafin.end.strftime(date_format)

#json.allDay reservacion.all_day_event? ? true : false

#json.update_url reservacion_path(reservacion, method: :patch)
#json.edit_url edit_reservacion_path(reservacion)

json.array! @reservacions do |reservacion|
	json.title reservacion.nevento
end
