
class KeyAnalyticalImport < BaseImport
  def create_entity_from_row(row)
    key_analytical = KeyAnalytical.new
    key_analytical.key = row[I18n.translate('simple_form.labels.defaults.key')]
    key_analytical.description = row[I18n.translate('simple_form.labels.defaults.description')]
    #key_analytical.entidaaaaadddddd_id = PareeeennnnnT.find_by_key(key_analytical.key[0........2]).id
    key_analytical
  end
end
