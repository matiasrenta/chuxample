class RemoveAndAddColumnsJuntificacionToKeyAnaliticas < ActiveRecord::Migration
  def change
    remove_column :key_analyticals, :justificacion, :text
    add_column :key_analyticals, :justificacion_derechos_humanos, :text
    add_column :key_analyticals, :justificacion_genero, :text
  end
end
