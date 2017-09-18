json.extract! solicitud, :id, :sala, :responsable, :motivo, :sesiones, :fechainicio, :fechafin, :diasemana, :horario, :numpersonas, :requerimientos, :created_at, :updated_at
json.url solicitud_url(solicitud, format: :json)
