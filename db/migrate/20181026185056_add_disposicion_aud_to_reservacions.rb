class AddDisposicionAudToReservacions < ActiveRecord::Migration[5.1]
  def change
    add_column :reservacions, :disposicionAud, :string
  end
end
