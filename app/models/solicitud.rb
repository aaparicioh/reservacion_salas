class Solicitud < ApplicationRecord
	validates :asistentes, presence: true
end
