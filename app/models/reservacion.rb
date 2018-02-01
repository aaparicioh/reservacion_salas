class Reservacion < ApplicationRecord
	validates :nresponsable, presence: true
	validates :nevento, presence: true
/belongs_to :usuario/
/belongs_to :espacio/
end
