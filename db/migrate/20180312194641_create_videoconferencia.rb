class CreateVideoconferencia < ActiveRecord::Migration[5.1]
  def change
    create_table :videoconferencia do |t|
      t.string :nSolicitante
      t.string :tituloActividad
      t.date :fechaActividad
      t.string :coordinador
      t.string :tipoEnlace
      t.time :horainicio
      t.time :horafin

      t.string :coordinadorEnlace
      t.string :responsableTecnico
      t.string :numeroIP
      t.string :usuarioTipoEnlace
      t.string :telefono
      t.string :correoElectronico
      t.string :recursos
      t.time :horainicioEnlace
      t.time :horafinEnlace

      t.datetime :fechaSolicitud
      t.string :usuario
      t.boolean :aprobacion


      t.timestamps
    end
  end
end
