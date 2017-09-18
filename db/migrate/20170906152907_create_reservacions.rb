class CreateReservacions < ActiveRecord::Migration[5.1]
  def change
    create_table :reservacions do |t|
      t.string :nresponsable
      t.string :nevento
      t.date :fechainicio
      t.date :fechafin
      t.time :horainicio
      t.time :horafin
      t.boolean :repeticion
      t.string :idrepeticiones
      t.boolean :aprobacion
      t.string :tipoactividad
      t.datetime :fechasolicitud

      t.timestamps
    end
  end
end
