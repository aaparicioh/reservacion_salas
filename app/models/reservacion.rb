class Reservacion < ApplicationRecord
	belongs_to :espacio
	validates :nresponsable, presence: true
	validates :nevento, presence: true
end