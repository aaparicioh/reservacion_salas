class AddUsuarioToReservacions < ActiveRecord::Migration[5.1]
  def change
    add_column :reservacions, :usuario, :string
  end
end
