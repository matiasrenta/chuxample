
class JobTitleImport < BaseImport
  def create_entity_from_row(row)
    job_title = JobTitle.new
    job_title.name = row[I18n.translate('simple_form.labels.defaults.name')]
    job_title
  end
end
