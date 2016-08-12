class AddSettVarForNominaDocumentsMaxFileSize < ActiveRecord::Migration
  def change
    Sett.create!(var: 'REFILE_S3_NOMINA_DOC_MAX_FILESIZE', value: 50, description: 'Tamaño máximo en megabytes para el store s3_nomina_documents_backend. usado para los documentos de nómina')
  end
end
