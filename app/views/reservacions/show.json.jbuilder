#json.partial! "reservacions/reservacion", reservacion: @reservacion, :nevento, :fechainicio

#json.array! @reservacions, :nevento, :fechainicio, :fechafin

#json.array! @reservacions do |reservacion|
#	json.title reservacion.nevento
#end

#json.title @reservacion.nevento
#json.start @reservacion.fechainicio
#json.end @reservacion.fechafin

#json.array! @reservacions, :nevento, :fechainicio, :fechafin

#json.extract! @reservacion, :nevento, :fechainicio, :fechafin
#json.(@reservacion, :nevento, :fechainicio, :fechafin)
#json.edit_url edit_reservacion_url(@reservacion)# if current_user.admin?