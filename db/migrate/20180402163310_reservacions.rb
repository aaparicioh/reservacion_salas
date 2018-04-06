class Reservacions < ActiveRecord::Migration[5.1]
  def change
	add_column :reservacions,:espacio_id,:integer
  end
end
