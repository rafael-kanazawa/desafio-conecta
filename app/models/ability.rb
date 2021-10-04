class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.employee?
      can :read, Product
      can :manage, Stock
      can [:rean, :update], User, user = user
    end
  end
end
