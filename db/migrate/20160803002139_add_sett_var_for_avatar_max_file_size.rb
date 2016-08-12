class AddSettVarForAvatarMaxFileSize < ActiveRecord::Migration
  def change
    Sett.create!(var: 'REFILE_S3_AVATAR_MAX_FILESIZE', value: 5, description: 'Tamaño máximo en megabytes para el store s3_avatar_backend. usado para los avatars de usuarios')
    Sett.create!(var: 'REFILE_S3_FINANCIAL_DOCUMENTS_MAX_FILESIZE', value: 5, description: 'Tamaño máximo en megabytes para el store s3_financial_documents_backend. usado para los documentos financieros')
  end
end
