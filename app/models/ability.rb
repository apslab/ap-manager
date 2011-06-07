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
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
    user ||= User.new # guest user (not logged in) 

    # rulez engines
    # Odiseo
    if user.can_managed_engine?(:odiseo)
      can :manage, Company, :id => user.current_or_first_company.id
      can :manage, Exercise, :company_id => user.current_or_first_company.id
      can :manage, Account, :company_id => user.current_or_first_company.id
      can :manage, Entry#, :exercise => {:company_id => user.current_or_first_company.id}
    end

    if user.can_operated_engine?(:odiseo)
      can :read, Company, :id => user.current_or_first_company.id
      can :read, Exercise, :company_id => user.current_or_first_company.id
      can :read, Account, :company_id => user.current_or_first_company.id
      can :read, Entry#, :exercise => {:company_id => user.current_or_first_company.id}
    end

    # Ares
    if user.can_managed_engine?(:ares)
      can :manage, Cliente#, :id => user.current_or_first_company.id
      can :manage, Tasaiva#, :id => user.current_or_first_company.id
      can :manage, Condicioniva#, :id => user.current_or_first_company.id
      can :manage, Factura#, :id => user.current_or_first_company.id
      can :manage, Notacredito#, :id => user.current_or_first_company.id
      can :manage, Recibo#, :id => user.current_or_first_company.id
    end

    if user.can_operated_engine?(:ares)
      can :read, Cliente#, :id => user.current_or_first_company.id
    end
  end
end
