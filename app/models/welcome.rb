class Welcome < ApplicationRecord
validates :tipoactividad, presence: true
validates :asistentes, presence: true
end