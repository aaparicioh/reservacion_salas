class CreateEspacios < ActiveRecord::Migration[5.1]
  def change
    create_table :espacios do |t|
      t.string :nombre
      t.string :ubicacion
      t.integer :aforo
      t.string :descripcion
      t.text :servicios_adicionales
      t.string :estatus

      t.timestamps
    end
  end
end
