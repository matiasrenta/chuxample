
class CatCfuSubfunctionImport < BaseImport
  def create_entity_from_row(row)
    cat_cfu_subfunction = CatCfuSubfunction.new
    cat_cfu_subfunction.key = row[I18n.translate('simple_form.labels.defaults.key')]
    cat_cfu_subfunction.description = row[I18n.translate('simple_form.labels.defaults.description')]
    cat_cfu_subfunction.cat_cfu_function_id = CatCfuFunction.find_by_key(cat_cfu_subfunction.key[0..2]).id
    cat_cfu_subfunction
  end
end
