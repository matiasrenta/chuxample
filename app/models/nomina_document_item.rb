class NominaDocumentItem < ActiveRecord::Base
  belongs_to :nomina_document
  belongs_to :cat_ppr_par_partida_especifica
end
