class CreateSocialDevelopmentPrograms < ActiveRecord::Migration
  def change
    create_table :social_development_programs do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
