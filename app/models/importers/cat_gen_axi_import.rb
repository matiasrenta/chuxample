class CatGenAxiImport < BaseImport
  def create_entity_from_row(row)
    cat_gen_axi = CatGenAxi.new
    cat_gen_axi.key = row[I18n.translate('simple_form.labels.defaults.key')]
    cat_gen_axi.description = row[I18n.translate('simple_form.labels.defaults.description')]
    cat_gen_axi
  end
end

