class CreateSolicituds < ActiveRecord::Migration[5.1]
  def change
    create_table :solicituds do |t|
      t.string :sala
      t.string :responsable
      t.string :motivo
      t.string :sesiones
      t.string :fechainicio
      t.string :fechafin
      t.string :diasemana
      t.string :horario
      t.string :numpersonas
      t.string :requerimientos

      t.timestamps
    end
  end
end
