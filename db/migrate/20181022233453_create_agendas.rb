class CreateAgendas < ActiveRecord::Migration[5.1]
  def change
    create_table :agendas do |t|
      t.date :fecha

      t.timestamps
    end
  end
end
