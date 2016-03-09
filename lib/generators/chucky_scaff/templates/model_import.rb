class Import < BaseImport
  def create_entity_from_row(row)
    thing = Thing.new
    thing.name = row[I18n.translate('simple_form.labels.defaults.name')]
    thing
  end
end

