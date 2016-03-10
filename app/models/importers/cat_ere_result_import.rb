
class CatEreResultImport < BaseImport
  def create_entity_from_row(row)
    cat_ere_result = CatEreResult.new
    cat_ere_result.key = row[I18n.translate('simple_form.labels.defaults.key')]
    cat_ere_result.description = row[I18n.translate('simple_form.labels.defaults.description')]
    cat_ere_result.cat_ere_expending_focu_id = CatEreExpendingFocu.find_by_key(cat_ere_result.key[0..1]).id
    cat_ere_result
  end
end
