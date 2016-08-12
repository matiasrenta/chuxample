class CreateOpenData < ActiveRecord::Migration
  def change
    create_table :open_data do |t|
      t.string :title
      t.text :description
      t.string :labels
      t.string :published_by
      t.string :contact
      t.string :email
      t.string :access_level
      t.string :file_id
      t.string :file_filename
      t.integer :file_size
      t.string :file_content_type

      t.timestamps null: false
    end
  end
end
