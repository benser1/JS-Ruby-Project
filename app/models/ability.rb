class Ability
  include CanCan::Ability

  def initialize(user)

    # user.can :read, Post
    # return if user.guest?

    # user.can :update, :read, :create, :destroy, Post {owner_id: user.id}
    # return if user.normal?

    # user.can :manage, Post if user.admin?

    #-------------------------------------------------------------
    # unless user.nil?
    #     can :create, Post
    #     can :update, Post
    #     can :destroy, Post
    # end
    # if user.admin? 
    #     can :manage, Post
    # end
  end
end ## class end 