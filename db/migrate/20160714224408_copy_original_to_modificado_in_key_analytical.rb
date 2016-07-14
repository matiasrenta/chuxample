class CopyOriginalToModificadoInKeyAnalytical < ActiveRecord::Migration
  def change
    sql = 'update key_analyticals set modificado = original'
    ActiveRecord::Base.connection.execute(sql)
  end
end
