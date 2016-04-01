
class CatCfuFunctionImport < BaseImport
  def create_entity_from_row(row)
    cat_cfu_function = CatCfuFunction.new
    cat_cfu_function.key = row[I18n.translate('simple_form.labels.defaults.key')]
    cat_cfu_function.description = row[I18n.translate('simple_form.labels.defaults.description')]
    cat_cfu_function.cat_cfu_finality_id = CatCfuFinality.find_by_key(cat_cfu_function.key[0]).id
    cat_cfu_function
  end
end
