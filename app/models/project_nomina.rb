class ProjectNomina < KeyAnalytical
  #has_many :project_activity_nominas, dependent: :restrict_with_error

  def calculate_and_save_ejercido
    # TODO: para los proyectos de nomina hay que sobreescribir este metodo para que sume el prorrateado (se carga el ejercido por partida) que se le asigne cuando el empleado llene el formulario donde carga los tres tipos de documentos comprobatorios de nomina
    #self.ejercido = 0.00
    #save
  end
end