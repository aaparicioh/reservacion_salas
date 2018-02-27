class AddServiciosToReservacions < ActiveRecord::Migration[5.1]
  def change
  	add_column :reservacions, :cartel, :boolean, :default => false
  	add_column :reservacions, :ncartel, :integer,
  	add_column :reservacions, :programa, :boolean, :default => false
  	add_column :reservacions, :nprograma, :integer, 
  	add_column :reservacions, :constancias, :boolean, :default => false
  	add_column :reservacions, :nconstancias, :integer
  	add_column :reservacions, :mesaRedonda, :boolean, :default => false
  	add_column :reservacions, :auditorio, :boolean, :default => false
  	add_column :reservacions, :videoproyector, :boolean, :default => true
  	add_column :reservacions, :pc, :boolean, :default => true
  	add_column :reservacions, :video, :boolean, :default => false
  	add_column :reservacions, :conexInternet, :boolean, :default => true
  	add_column :reservacions, :traducSimultanea, :boolean, :default => false
  	add_column :reservacions, :conexSkype, :boolean, :default => false
  	add_column :reservacions, :videoconferencia, :boolean, :default => false
  	add_column :reservacions, :webcast, :boolean, :default => false
  	add_column :reservacions, :grabVideo, :boolean, :default => false
  	add_column :reservacions, :grabAudio, :boolean, :default => false
  	add_column :reservacions, :cafe, :boolean, :default => true
  	add_column :reservacions, :galletas, :boolean, :default => false
  	add_column :reservacions, :fruta, :boolean, :default => false
  	add_column :reservacions, :asistentes, :integer

  end
end
