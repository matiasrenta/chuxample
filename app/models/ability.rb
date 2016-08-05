class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    @user = user
    send(@user.role.name.delete(' ').underscore)
		everybody_can_do
    cannot_for_everyone
  end

  def superuser
		can :manage, :all
	end

	def administrador
		can [:manage], OpenDatum
		can [:manage], LeyFraccion
		can [:manage], LeyArticulo
		can [:read], Verification
		can [:manage], Staff
		can [:manage], JobTitle
		can [:manage], Ascription
		can [:manage], ProjectActivityAdquisicion
		can [:manage], ProjectActivitySocial
		can [:manage], ProjectActivityObra

		can [:manage], Beneficiary
		can [:manage], TerritorialUnit
		can [:manage], SocialDevelopmentProgram
		can [:manage], Supplier
		can [:manage], Town
		can [:manage], State
		can [:manage], FinancialDocumentType
		can [:manage], FinancialDocument
		can [:manage], KeyAnalytical # no puede :massive_load
		cannot :massive_load, KeyAnalytical
		can [:manage], CatPprSpendingDestination
		can [:manage], CatUniMeasureUnit
		can [:manage], CatAreArea
		can [:manage], CatPprDigitIdentifier
		can [:manage], CatPprParPartidaEspecifica
		can [:manage], CatPprParPartidaGenerica
		can [:manage], CatPprParConcept
		can [:manage], CatPprParChapter
		can [:manage], CatPprExpenseType
		can [:manage], CatAciInstitutionalActivity
		can [:manage], CatEreSubresult
		can [:manage], CatEreResult
		can [:manage], CatEreExpendingFocu
		can [:manage], CatCfuSubfunction
		can [:manage], CatCfuFunction
		can [:manage], CatCfuFinality
		can [:manage], CatFonFund
		can [:manage], CatFonOriginResource
		can [:manage], CatFonYearDocument
		can [:manage], CatFonSpecificSource
		can [:manage], CatFonGenericSource
		can [:manage], CatPgdLineOfAction
		can [:manage], CatPgdGoal
		can [:manage], CatPgdObjective
		can [:manage], CatPgdAreaOfOpportunity
		can [:manage], CatFonFundingSource
		can [:manage], CatPgdAxi
		can [:manage], CatGenLineOfAction
		can [:manage], CatGenStrategy
		can [:manage], CatGenAxi
		can [:manage], CatDerLineOfAction
		can [:manage], CatDerStrategy
		can [:manage], CatDerHumanRight
		can [:manage], User
		can :read, :catalogs
		can :read, :administrations
		can :change_user_role, User
	end

	def ejecutor_general
		ejecutor
		can [:update], KeyAnalytical
		can [:create, :update], ProjectActivityAdquisicion
		can [:create, :update], ProjectActivityObra
		can [:create, :update], ProjectActivitySocial
		can [:manage], Beneficiary
		can [:create], FinancialDocument
	end

	def ejecutor_adquisición
		ejecutor
		can [:update], KeyAnalytical, adquisicion?: true
		can [:create, :update], ProjectActivityAdquisicion
		can [:create], FinancialDocument, project_activityable: {parent_project: {adquisicion?: true}}
	end
	def ejecutor_nómina
		ejecutor
		can [:update], KeyAnalytical, nomina?: true
	end
	def ejecutor_obra
		ejecutor
		can [:update], KeyAnalytical, obra?: true
		can [:create, :update], ProjectActivityObra
		can [:create], FinancialDocument, project_activityable: {parent_project: {obra?: true}}
	end
	def ejecutor_social
		ejecutor
		can [:update], KeyAnalytical, social?: true
		can [:create, :update], ProjectActivitySocial
		can :create, FinancialDocument, project_activityable: {parent_project: {social?: true}}
		can :manage, Beneficiary
	end

	def revisor
		can [:read, :change_status], Verification
		read_edit_own_user
		can [:read, :approve_changes, :reject_changes], KeyAnalytical
		can [:create, :read, :update], ProjectActivityAdquisicion
		can [:create, :read, :update], ProjectActivityObra
		can [:create, :read, :update], ProjectActivitySocial
		can [:create, :read], FinancialDocument
		can :read, Staff
		can [:create, :read, :update], Supplier
		can :read, :catalogs
		can_do_with_all_catalogs(:read)
		can :read, State
		can :read, Town
		can :read, :administrations
	end

	def visor
		read_edit_own_user
		can [:read], KeyAnalytical
		can [:read], ProjectActivityAdquisicion
		can [:read], ProjectActivityObra
		can [:read], ProjectActivitySocial
		can [:read], FinancialDocument
		can :read, Beneficiary
		can :read, Supplier
	end

	def verificador_delegacional
		read_edit_own_user
		can :read, KeyAnalytical, project_type: 'ProjectObra'
		can :read, ProjectActivityObra
		can :read, FinancialDocument
		can :read, Supplier
	end

	def transparentador
		read_edit_own_user
		can [:read], KeyAnalytical
		can [:read], ProjectActivityAdquisicion
		can [:read], ProjectActivityObra
		can [:read], ProjectActivitySocial
		can [:read], FinancialDocument
		can :read, Beneficiary
		can :read, Supplier
		can [:create, :read, :update], LeyFraccion
		can [:create, :read, :update], LeyArticulo
	end

	def verificador_ciudadano
	end


	private

	#este metodo es para restringir cosas a nivel negocio, no importa el perfil
  def cannot_for_everyone
    #todo: cannot manage para todas las entidades que son CONSTANT
    #ejemplo: cannot [:create, :update, :destroy], User

		cannot :update, KeyAnalytical, status: KeyAnalytical.status_array # no se puede editar cuando esta pendiente de revisar una afectacion
		cannot :update, NominaDocument # es para que no se vuelva a calcular el ejercido, es decir, le sume dinero al ejercido de cada proyecto

		unless @user.superuser?
			cannot [:create, :read, :update, :destroy], User, role_id: Role.find_by_name('superuser').id
			cannot [:create, :read, :update, :destroy], Role, id: Role.find_by_name('superuser').id
		end
	end

	def read_edit_own_user
		can [:read, :update], User, id: @user.id
	end

	def ejecutor
		read_edit_own_user
		can :read, KeyAnalytical
		can [:create, :read], Supplier
		can :read, ProjectActivitySocial
		can :read, ProjectActivityAdquisicion
		can :read, ProjectActivityObra
		can :read, FinancialDocument
		can :read, Beneficiary
	end

	def can_do_with_all_catalogs(operation)
		can [operation], CatPprSpendingDestination
		can [operation], CatUniMeasureUnit
		can [operation], CatAreArea
		can [operation], CatPprDigitIdentifier
		can [operation], CatPprParPartidaEspecifica
		can [operation], CatPprParPartidaGenerica
		can [operation], CatPprParConcept
		can [operation], CatPprParChapter
		can [operation], CatPprExpenseType
		can [operation], CatAciInstitutionalActivity
		can [operation], CatEreSubresult
		can [operation], CatEreResult
		can [operation], CatEreExpendingFocu
		can [operation], CatCfuSubfunction
		can [operation], CatCfuFunction
		can [operation], CatCfuFinality
		can [operation], CatFonFund
		can [operation], CatFonOriginResource
		can [operation], CatFonYearDocument
		can [operation], CatFonSpecificSource
		can [operation], CatFonGenericSource
		can [operation], CatPgdLineOfAction
		can [operation], CatPgdGoal
		can [operation], CatPgdObjective
		can [operation], CatPgdAreaOfOpportunity
		can [operation], CatFonFundingSource
		can [operation], CatPgdAxi
		can [operation], CatGenLineOfAction
		can [operation], CatGenStrategy
		can [operation], CatGenAxi
		can [operation], CatDerLineOfAction
		can [operation], CatDerStrategy
		can [operation], CatDerHumanRight
	end

	def everybody_can_do
		can :read, :dashboard
		can :read, PublicActivity::Activity
	end

end
