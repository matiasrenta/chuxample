
class CatUniMeasureUnitImport < BaseImport
  def create_entity_from_row(row)
    cat_uni_measure_unit = CatUniMeasureUnit.new
    cat_uni_measure_unit.key = row[I18n.translate('simple_form.labels.defaults.key')].round
    cat_uni_measure_unit.description = row[I18n.translate('simple_form.labels.defaults.description')]
    cat_uni_measure_unit
  end
end
