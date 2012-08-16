class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    end
    if user.has_role? :ambassador
      can :read, :all
      # Can create and update their own Registrations
      can [:create, :update], Registration, :user_id => user.id
      # Can register for events
      can :add, Event
      # Cannot register for past events
      cannot :add, Event, :start_past? => true
    end
    if user.has_role? :ait
      can :read, :all
      # Can't view non-ait events
      cannot :read, Event, :ait => false
      # Can create and update their own Registrations for ait events
      can [:create, :update], Registration, :user_id => user.id
      # Can register for ait events
      can :add, Event, :ait => true
      # Cannot register for past events
      cannot :add, Event, :start_past? => true
    end
  end
end
