
class CatPprSpendingDestinationImport < BaseImport
  def create_entity_from_row(row)
    cat_ppr_spending_destination = CatPprSpendingDestination.new
    cat_ppr_spending_destination.key = row[I18n.translate('simple_form.labels.defaults.key')]
    cat_ppr_spending_destination.description = row[I18n.translate('simple_form.labels.defaults.description')]
    #cat_ppr_spending_destination.entidaaaaadddddd_id = PareeeennnnnT.find_by_key(cat_ppr_spending_destination.key[0........2]).id
    cat_ppr_spending_destination
  end
end
