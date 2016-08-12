class TerritorialUnitImport < BaseImport
  def create_entity_from_row(row)
    tu = TerritorialUnit.new
    tu.code = row[I18n.translate('simple_form.labels.defaults.code')]
    tu.name = row[I18n.translate('simple_form.labels.defaults.name')]
    tu.grado_marginacion = row[I18n.translate('simple_form.labels.defaults.grado_marginacion')]
    tu
  end
end