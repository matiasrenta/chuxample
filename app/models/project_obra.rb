class ProjectObra < KeyAnalytical
  has_many :project_activity_obras, dependent: :restrict_with_error
end
