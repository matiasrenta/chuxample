class NominaDocument < ActiveRecord::Base
	include PublicActivity::Model
  tracked only: [:create, :update, :destroy]
  tracked :on => {update: proc {|model, controller| model.changes.except(*model.except_attr_in_public_activity).size > 0 }}
  tracked owner: ->(controller, model) {controller.try(:current_user)}
  #tracked recipient: ->(controller, model) { model.xxxx }
  tracked :on => {:update => proc {|model, controller| model.changes.except(*model.except_attr_in_public_activity).keys.size > 0 }}
  tracked :parameters => {
              :attributes_changed => proc {|controller, model| model.id_changed? ? nil : model.changes.except(*model.except_attr_in_public_activity)},
              :model_label => proc {|controller, model| "#{model.try(:month)} #{model.try(:year)}" }
          }

  has_many :nomina_document_items, dependent: :destroy
  has_and_belongs_to_many :project_nominas, join_table: 'proj_nominas_nom_docs_joins'
  accepts_nested_attributes_for :nomina_document_items, allow_destroy: true

  serialize :monto_por_project

  attachment :file, extension: %w[jpg jpeg png gif pdf doc docx xls xlsx], store: 's3_nomina_doc_backend', cache: 's3_nomina_doc_cache'
  #content_type: %w[image/jpeg image/png image/gif text/plain application/pdf application/doc application/docx]


  validates :month, :year, :file, presence: true

  MONTH_FIELDS = %W(enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre)

  before_create :projects_association
  after_create :increase_ejercido
  before_destroy :decrease_ejercido
  after_destroy :remove_file_attached

  def month_in_word
    MONTH_FIELDS[self.month - 1]
  end

  def except_attr_in_public_activity
    [:id, :file_id, :updated_at]
  end

  private

  def remove_file_attached
    file.try(:delete)
  end

  def projects_association
    # los proyectos de nomina del mismo año que tengan una partida que este en algun self.nomina_document_items, seria:
    self.project_nominas = ProjectNomina.by_year(self.year).by_partidas_especificas(self.nomina_document_items.map(&:cat_ppr_par_partida_especifica_id))
  end

  def increase_ejercido
    # obtener el porcentaje del total que ocupa el programado de cada self.project_nominas.
    # obtener del self.nomina_document_items.group(:cat_ppr_par_partida_especifica_id).sum(:monto) el porcentaje que le corresponde, y se lo sumamos al ejercido de ese proyecto. Asi con cada proyecto

    montos_ejercidos_por_project_hash = Hash.new

    montos_por_partida = self.nomina_document_items.group(:cat_ppr_par_partida_especifica_id).sum(:monto)
    montos_por_partida.keys.each do |partida_id|
      projects_de_la_partida = self.project_nominas.by_partidas_especificas(partida_id)
      total_programado_por_partida = projects_de_la_partida.sum(self.month_in_word) # solo el del mes
      if total_programado_por_partida > 0
        projects_de_la_partida.each do |project|
          project_percent = eval("project.#{self.month_in_word}").to_f / total_programado_por_partida # solo del mes
          monto_a_sumar_al_ejercido = montos_por_partida[partida_id] * project_percent
          if project.update_attribute(:ejercido, project.ejercido.to_f + monto_a_sumar_al_ejercido)
            montos_ejercidos_por_project_hash[project.id] = monto_a_sumar_al_ejercido
          end
        end
      end
    end
    self.update_column(:monto_por_project, montos_ejercidos_por_project_hash) # lo necesito para hacer el decrease_ejercido
  end

  def decrease_ejercido
    self.monto_por_project.keys.each do |project_id|
      project = ProjectNomina.where(id: project_id).first # hago where por las dudas no exista mas el ProjectNomina
      if project
        project.update_attribute(:ejercido, (project.ejercido.to_f - self.monto_por_project[project_id].to_f).round)
      end
    end
  end

end
