class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.role? :admin
      can :manage, :all
    else
      can :read, [Category, Article, Comment, Question, Review]
      can :create, Question
      can :create, Review

      if user.confirmed_at #is real user
        can :create, Camment
        can :create, Article
        can :update, Article, { :user_id => user.id, :status => :draft }
      end
    end

  end
end
