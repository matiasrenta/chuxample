class AddCamposDePresupuestoToKeyAnalyticals < ActiveRecord::Migration
  def change
    add_column :key_analyticals, :original, :float
    add_column :key_analyticals, :modificado, :float
    add_column :key_analyticals, :programado, :float
    add_column :key_analyticals, :ejercido, :float
  end
end
