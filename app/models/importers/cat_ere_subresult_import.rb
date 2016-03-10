
class CatEreSubresultImport < BaseImport
  def create_entity_from_row(row)
    cat_ere_subresult = CatEreSubresult.new
    cat_ere_subresult.key = row[I18n.translate('simple_form.labels.defaults.key')]
    cat_ere_subresult.description = row[I18n.translate('simple_form.labels.defaults.description')]
    cat_ere_subresult.cat_ere_result_id = CatEreResult.find_by_key(cat_ere_subresult.key[0..4]).id
    cat_ere_subresult
  end
end
