class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.role? :admin
      can :manage, :all
    else
      can :read, [Category, Article, Comment]
      if user.confirmed_at #is real user
        can :create, Comment
        can :create, Article
        can :update, Article, { :user_id => user.id, :status => :draft }
      end
    end

  end
end
