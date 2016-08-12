class DeleteRecordFromRolesTable < ActiveRecord::Migration
  def change
    Role.destroy_all(name: 'prueba')
  end
end
