class AddSetingVariableForOpenDataMaxFileSize < ActiveRecord::Migration
  def change
    Sett.create!(var: 'REFILE_S3_OPEN_DATA_MAX_FILESIZE', value: 50, description: 'Tamaño máximo en megabytes para el store refile_s3_open_data. usado para los documentos de datos abiertos')
  end
end
