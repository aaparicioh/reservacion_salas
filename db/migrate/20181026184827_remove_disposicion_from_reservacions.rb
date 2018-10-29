class RemoveDisposicionFromReservacions < ActiveRecord::Migration[5.1]
  def change
    remove_column :reservacions, :disposicion, :string
  end
end
