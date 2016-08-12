class CreateNominaDocuments < ActiveRecord::Migration
  def change
    create_table :nomina_documents do |t|
      t.integer :month
      t.integer :year
      t.string :file_id
      t.string :file_filename
      t.string :file_size
      t.string :file_content_type

      t.timestamps null: false
    end
  end
end
