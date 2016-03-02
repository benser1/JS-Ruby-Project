class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin? 
        can :manage, :all
    elsif !user.nil?
        can :manage, :all
        cannot :destroy, Post 
        cannot :update, Post 
        cannot :create, Post
        can :create, Post, :user => user
        can :update, Post, :user => user
        can :destroy, Post, :user => user
    end
  end
end ## class end 
