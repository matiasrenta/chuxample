class ProjectSocial < KeyAnalytical
  has_many :project_activity_socials, dependent: :restrict_with_error
end
