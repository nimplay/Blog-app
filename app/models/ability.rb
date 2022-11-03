class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    else
      can :manage, Post, author: user
      can :create, Comment
      can :manage, Comment, author: user
      can :create, Like
    end
  end
end
