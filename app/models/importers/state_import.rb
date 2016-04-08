class StateImport < BaseImport
  def create_entity_from_row(row)
    state = State.new
    state.name = row[I18n.translate('simple_form.labels.defaults.name')]
    state.abbreviation = row[I18n.translate('simple_form.labels.defaults.abbreviation')]
    state
  end
end