class AddSettingVariableForAmozonUrlPhotos < ActiveRecord::Migration
  def change
    Sett.create!(var: 'S3_ROOT_PATH', value: 'https://s3-us-west-2.amazonaws.com/cuauhtemoc/', description: 'Directorio root del S3, a partir de aqui los documentos que se suben deben del tipo: nombre_directorio/nombre_archivo.ext')
  end
end
