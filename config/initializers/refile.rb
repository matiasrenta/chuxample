require 'refile/simple_form'
require 'refile/s3'

Refile.backends['filesystem_backend'] = Refile::Backend::FileSystem.new(Rails.root.join('uploads/filesystem/store').to_s, max_size: 2.megabytes)
Refile.backends['filesystem_cache'] = Refile::Backend::FileSystem.new(Rails.root.join('uploads/filesystem/cache').to_s, max_size: 2.megabytes)

if Rails.env.production?
  aws = {
      access_key_id: "ver en marihuana",
      secret_access_key: "ver en marihuana",
      region: "us-west-2",
      bucket: "change_me",
  }
  Refile.backends['s3_backend'] = Refile::S3.new(prefix: "store", **aws)
  Refile.backends['s3_cache'] = Refile::S3.new(prefix: "cache", **aws)
else
  Refile.backends['s3_backend'] = Refile::Backend::FileSystem.new(Rails.root.join('uploads/s3/store').to_s, max_size: 2.megabytes)
  Refile.backends['s3_cache'] = Refile::Backend::FileSystem.new(Rails.root.join('uploads/s3/cache').to_s, max_size: 2.megabytes)
end




