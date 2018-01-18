class AddDisposicionToReservacions < ActiveRecord::Migration[5.1]
  def change
  	add_column :reservacions, :disposicion, :string
  end
end
