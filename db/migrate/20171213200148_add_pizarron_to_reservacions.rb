class AddPizarronToReservacions < ActiveRecord::Migration[5.1]
  def change
  	add_column :reservacions, :pizarron, :boolean
  end
end
