class CalendarioController < ApplicationController
	#protect_from_forgery
	def show
		render '/calendario/actividadesInvestigacion'
	end

	def pdfs
		#render '/calendario/pdfs'
	end
end
