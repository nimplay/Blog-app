class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Post, public: true

    can :read, Comment, public: true

    return unless user.present?

    can :manage, Post, authorId: user.id
    can :manage, Comment, authorId: user.id

    return unless user.admin?

    can :manage, :all
  end
end
