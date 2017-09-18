json.extract! reservacion, :id, :nresponsable, :nevento, :fechainicio, :fechafin, :horainicio, :horafin, :repeticion, :idrepeticiones, :aprobacion, :tipoactividad, :fechasolicitud, :created_at, :updated_at
json.url reservacion_url(reservacion, format: :json)
