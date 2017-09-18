class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |t|
      t.string :nick
      t.string :pass
      t.string :nombre
      t.string :appat
      t.string :apmat
      t.string :tipo_usuario
      t.integer :autorizado

      t.timestamps
    end
  end
end
