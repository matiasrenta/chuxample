class ThingImport < BaseImport
  def create_entity_from_row(row)
    thing = Thing.new
    thing.name = row[I18n.translate('simple_form.labels.defaults.name')]
    thing.age = row[I18n.translate('simple_form.labels.defaults.age')]
    thing
  end
end

