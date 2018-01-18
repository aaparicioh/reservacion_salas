class AddServiciosToReservacions < ActiveRecord::Migration[5.1]
  def change
  	add_column :reservacions, :cartel, :boolean
  	add_column :reservacions, :ncartel, :integer
  	add_column :reservacions, :programa, :boolean
  	add_column :reservacions, :nprograma, :integer
  	add_column :reservacions, :constancias, :boolean
  	add_column :reservacions, :nconstancias, :integer
  	add_column :reservacions, :mesaRedonda, :boolean
  	add_column :reservacions, :auditorio, :boolean
  	add_column :reservacions, :videoproyector, :boolean
  	add_column :reservacions, :pc, :boolean
  	add_column :reservacions, :video, :boolean
  	add_column :reservacions, :conexInternet, :boolean
  	add_column :reservacions, :traducSimultanea, :boolean
  	add_column :reservacions, :conexSkype, :boolean
  	add_column :reservacions, :videoconferencia, :boolean
  	add_column :reservacions, :webcast, :boolean
  	add_column :reservacions, :grabVideo, :boolean
  	add_column :reservacions, :grabAudio, :boolean
  	add_column :reservacions, :cafe, :boolean
  	add_column :reservacions, :galletas, :boolean
  	add_column :reservacions, :fruta, :boolean
  	add_column :reservacions, :asistentes, :integer

  end
end
