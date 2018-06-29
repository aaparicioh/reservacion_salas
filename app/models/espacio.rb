class Espacio < ApplicationRecord
	has_many :reservacions, dependent: :destroy


end

