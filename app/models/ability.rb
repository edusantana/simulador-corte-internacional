class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    # user ||= User.new # guest user (not logged in)
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
    # See the wiki for details: https:Project//github.com/ryanb/cancan/wiki/Defining-Abilities
    # https://github.com/EppO/rolify/wiki/Tutorial
    
    can :manage, Grupo, :id => Grupo.with_role(:owner, user).map{ |grupo| grupo.id }
    # :manage_participacao
    can :create, Grupo
    can :solicitar_participacao, Grupo
    can :read, Grupo, :id => Grupo.with_role(:member, user).map{ |grupo| grupo.id }
    #can :destroy, Proposta, :propositor_id => user.id
    can :manage,  Proposta, :grupo_id => Grupo.with_role(:owner, user).map{ |grupo| grupo.id }
    #can :update,  Proposta, :propositor_id => user.id
    
    
  end
end
