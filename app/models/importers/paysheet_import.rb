
class PaysheetImport < BaseImport
  def create_entity_from_row(row)
    paysheet = Paysheet.new
    paysheet.key = row[I18n.translate('simple_form.labels.defaults.key')]
    paysheet.description = row[I18n.translate('simple_form.labels.defaults.description')]
    #paysheet.entidaaaaadddddd_id = PareeeennnnnT.find_by_key(paysheet.key[0........2]).id
    paysheet
  end
end
