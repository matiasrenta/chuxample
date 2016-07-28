class ProjectNomina < KeyAnalytical
  #has_many :project_activity_nominas, dependent: :restrict_with_error
  has_and_belongs_to_many :nomina_documents, join_table: 'proj_nominas_nom_docs_joins'

  scope :by_year, -> (year){where(year: year)}
  scope :by_partidas_especificas, -> (partidas_array){where(cat_ppr_par_partida_especifica_id: partidas_array)}

  def calculate_and_save_ejercido
    # este metodo no hace nada pero es necesario, es un metodo override de KeyAnalytical
    # los demás tipos de proyecto lo usan, pero en los de nomina el ejercido se calcula de otra forma y
    # el codigo esta en NominaDocument (en los after_create y before_destroy)
  end
end