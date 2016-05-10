class CreateAscriptions < ActiveRecord::Migration
  def change
    create_table :ascriptions do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
