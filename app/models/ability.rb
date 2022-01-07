class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Group, author: user
    can :manage, Entity, author: user
  end
end
