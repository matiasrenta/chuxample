json.array! @open_data do |od|
  json.title od.title
  json.description od.description
  json.labels od.labels
  json.published_by od.published_by
  json.contact od.contact
  json.email od.email
  json.file_filename od.file_filename
  json.friendly_file_size friendly_file_size(od.file_size)
  json.file_content_type od.file_content_type
  json.link "#{ENV['DOMAIN_OR_SUBDOMAIN']}#{attachment_url(od, :file)}"
  json.created_at od.created_at
  json.updated_at od.updated_at
end