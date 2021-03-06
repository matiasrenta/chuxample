require 'refile/simple_form'
require 'refile/s3'

Refile.allow_uploads_to = :all

if Rails.env.production? && Admin::Settings['REFILE_USE_S3'] == 'true'
  aws = {
      access_key_id: ENV['S3_ACCESS_KEY_ID'],
      secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
      region: ENV['S3_REGION'],
      bucket: ENV['S3_BUCKET'],
  }
  Refile.backends['s3_financial_documents_backend'] = Refile::S3.new(prefix: "store_financial_documents", max_size: Admin::Settings['REFILE_S3_FINANCIAL_DOCUMENTS_MAX_FILESIZE'].to_i.megabytes, **aws)
  Refile.backends['s3_financial_documents_cache'] = Refile::S3.new(prefix: "cache_financial_documents", max_size: Admin::Settings['REFILE_S3_FINANCIAL_DOCUMENTS_MAX_FILESIZE'].to_i.megabytes, **aws)
  Refile.backends['s3_ley_backend'] = Refile::S3.new(prefix: "store_ley", max_size: Admin::Settings['REFILE_S3_LEY_MAX_FILESIZE'].to_i.megabytes, **aws)
  Refile.backends['s3_ley_cache'] = Refile::S3.new(prefix: "cache_ley", max_size: Admin::Settings['REFILE_S3_LEY_MAX_FILESIZE'].to_i.megabytes, **aws)
  Refile.backends['s3_open_data_backend'] = Refile::S3.new(prefix: "store_open_data", max_size: Admin::Settings['REFILE_S3_OPEN_DATA_MAX_FILESIZE'].to_i.megabytes, **aws)
  Refile.backends['s3_open_data_cache'] = Refile::S3.new(prefix: "cache_open_data", max_size: Admin::Settings['REFILE_S3_OPEN_DATA_MAX_FILESIZE'].to_i.megabytes, **aws)
  Refile.backends['s3_nomina_documents_backend'] = Refile::S3.new(prefix: "store_nomina_documents", max_size: Admin::Settings['REFILE_S3_NOMINA_DOC_MAX_FILESIZE'].to_i.megabytes, **aws)
  Refile.backends['s3_nomina_documents_cache'] = Refile::S3.new(prefix: "cache_nomina_documents", max_size: Admin::Settings['REFILE_S3_NOMINA_DOC_MAX_FILESIZE'].to_i.megabytes, **aws)
  Refile.backends['s3_avatar_backend'] = Refile::S3.new(prefix: "store_avatar", max_size: Admin::Settings['REFILE_S3_AVATAR_MAX_FILESIZE'].to_i.megabytes, **aws)
  Refile.backends['s3_avatar_cache'] = Refile::S3.new(prefix: "cache_avatar", max_size: Admin::Settings['REFILE_S3_AVATAR_MAX_FILESIZE'].to_i.megabytes, **aws)
  Refile.backends['s3_thing_backend'] = Refile::S3.new(prefix: "store_thing", max_size: Admin::Settings['REFILE_S3_AVATAR_MAX_FILESIZE'].to_i.megabytes, **aws)
  Refile.backends['s3_thing_cache'] = Refile::S3.new(prefix: "cache_thing", max_size: Admin::Settings['REFILE_S3_AVATAR_MAX_FILESIZE'].to_i.megabytes, **aws)
else
  Refile.backends['s3_financial_documents_backend'] = Refile::Backend::FileSystem.new(Rails.root.join('uploads/s3_financial_documents/store').to_s, max_size: Admin::Settings['REFILE_S3_FINANCIAL_DOCUMENTS_MAX_FILESIZE'].to_i.megabytes)
  Refile.backends['s3_financial_documents_cache'] = Refile::Backend::FileSystem.new(Rails.root.join('uploads/s3_financial_documents/cache').to_s, max_size: Admin::Settings['REFILE_S3_FINANCIAL_DOCUMENTS_MAX_FILESIZE'].to_i.megabytes)
  Refile.backends['s3_ley_backend'] = Refile::Backend::FileSystem.new(Rails.root.join('uploads/s3_ley/store').to_s, max_size: Admin::Settings['REFILE_S3_LEY_MAX_FILESIZE'].to_i.megabytes)
  Refile.backends['s3_ley_cache'] = Refile::Backend::FileSystem.new(Rails.root.join('uploads/s3_ley/cache').to_s, max_size: Admin::Settings['REFILE_S3_LEY_MAX_FILESIZE'].to_i.megabytes)
  Refile.backends['s3_open_data_backend'] = Refile::Backend::FileSystem.new(Rails.root.join('uploads/s3_open_data/store').to_s, max_size: Admin::Settings['REFILE_S3_OPEN_DATA_MAX_FILESIZE'].to_i.megabytes)
  Refile.backends['s3_open_data_cache'] = Refile::Backend::FileSystem.new(Rails.root.join('uploads/s3_open_data/cache').to_s, max_size: Admin::Settings['REFILE_S3_OPEN_DATA_MAX_FILESIZE'].to_i.megabytes)
  Refile.backends['s3_nomina_doc_backend'] = Refile::Backend::FileSystem.new(Rails.root.join('uploads/s3_nomina_doc/store').to_s, max_size: Admin::Settings['REFILE_S3_NOMINA_DOC_MAX_FILESIZE'].to_i.megabytes)
  Refile.backends['s3_nomina_doc_cache'] = Refile::Backend::FileSystem.new(Rails.root.join('uploads/s3_nomina_doc/cache').to_s, max_size: Admin::Settings['REFILE_S3_NOMINA_DOC_MAX_FILESIZE'].to_i.megabytes)
  Refile.backends['s3_avatar_backend'] = Refile::Backend::FileSystem.new(Rails.root.join('uploads/s3_avatar/store').to_s, max_size: Admin::Settings['REFILE_S3_AVATAR_MAX_FILESIZE'].to_i.megabytes)
  Refile.backends['s3_avatar_cache'] = Refile::Backend::FileSystem.new(Rails.root.join('uploads/s3_avatar/cache').to_s, max_size: Admin::Settings['REFILE_S3_AVATAR_MAX_FILESIZE'].to_i.megabytes)
  Refile.backends['s3_thing_backend'] = Refile::Backend::FileSystem.new(Rails.root.join('uploads/s3_thing/store').to_s, max_size: Admin::Settings['REFILE_S3_AVATAR_MAX_FILESIZE'].to_i.megabytes)
  Refile.backends['s3_thing_cache'] = Refile::Backend::FileSystem.new(Rails.root.join('uploads/s3_thing/cache').to_s, max_size: Admin::Settings['REFILE_S3_AVATAR_MAX_FILESIZE'].to_i.megabytes)
end
