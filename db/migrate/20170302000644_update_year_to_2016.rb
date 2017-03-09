class UpdateYearTo2016 < ActiveRecord::Migration
  def change
    sql = "update key_analyticals set year = 2016 where year != 2016"
    ActiveRecord::Base.connection.execute(sql)
  end
end
