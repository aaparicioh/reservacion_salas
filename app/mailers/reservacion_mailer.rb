class ReservacionMailer < ApplicationMailer
	default from: 'sge.reservaciones@ceiich.unam.mx'

  def solicitud_email(reservacion)
  	@reservacion = reservacion
    @url  = 'http://localhost:3000/users/sign_in'
    mail(to: @reservacion.usuario, subject: 'SGE SOLICITUD REALIZADA')
  end

  def aprobacion_email(reservacion)
  	@reservacion = reservacion
    @url  = 'http://localhost:3000/users/sign_in'
    mail(to: @reservacion.usuario, subject: 'SGE RESERVACIÓN APROBADA')
  end
end
