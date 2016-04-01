require 'refile/simple_form'
require 'refile/s3'

Refile.allow_uploads_to = :all

Refile.backends['filesystem_backend'] = Refile::Backend::FileSystem.new(Rails.root.join('uploads/filesystem/store').to_s, max_size: ENV['REFILE_FILESYSTEM_MAX_FILESIZE'].to_i.megabytes)
Refile.backends['filesystem_cache'] = Refile::Backend::FileSystem.new(Rails.root.join('uploads/filesystem/cache').to_s, max_size: ENV['REFILE_FILESYSTEM_MAX_FILESIZE'].to_i.megabytes)

if Rails.env.production? && ENV['REFILE_USE_S3'] == 'true'
  aws = {
      access_key_id: ENV['S3_ACCESS_KEY_ID'],
      secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
      region: ENV['S3_REGION'],
      bucket: ENV['S3_BUCKET'],
  }
  Refile.backends['s3_backend'] = Refile::S3.new(prefix: "store", max_size: ENV['REFILE_S3_MAX_FILESIZE'].to_i.megabytes, **aws)
  Refile.backends['s3_cache'] = Refile::S3.new(prefix: "cache", max_size: ENV['REFILE_S3_MAX_FILESIZE'].to_i.megabytes, **aws)
else
  Refile.backends['s3_backend'] = Refile::Backend::FileSystem.new(Rails.root.join('uploads/s3/store').to_s, max_size: ENV['REFILE_S3_MAX_FILESIZE'].to_i.megabytes)
  Refile.backends['s3_cache'] = Refile::Backend::FileSystem.new(Rails.root.join('uploads/s3/cache').to_s, max_size: ENV['REFILE_S3_MAX_FILESIZE'].to_i.megabytes)
end
