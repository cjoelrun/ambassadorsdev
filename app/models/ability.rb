class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    end
    if user.has_role? :ambassador
      can :read, :all
    end
    if user.has_role? :ait
      can :read, :all
    end
  end
end
