class Ability
  include CanCan::Ability

  def initialize(_user)
    can :read, Post, public: true
    can :read, Comment, public: true

    return unless current_user.present?

    can :read, Post, author: current_user
    can :destroy, Comment, author_id: current_user
  end
end
