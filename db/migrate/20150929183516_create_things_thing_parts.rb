class CreateThingsThingParts < ActiveRecord::Migration
  def change
    create_table :things_thing_parts, id: false do |t|
      t.belongs_to :things, index: true
      t.belongs_to :thing_parts, index: true
    end
  end
end
