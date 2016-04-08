class TownImport < BaseImport
  def create_entity_from_row(row)
    town = Town.new
    town.name = row[I18n.translate('simple_form.labels.defaults.name')]
    town.state_id = row['state_id']
    town
  end
end