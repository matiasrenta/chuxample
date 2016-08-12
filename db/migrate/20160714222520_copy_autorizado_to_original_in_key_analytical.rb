class CopyAutorizadoToOriginalInKeyAnalytical < ActiveRecord::Migration
  def change
    sql = 'update key_analyticals set original = autorizado'
    ActiveRecord::Base.connection.execute(sql)
  end
end
