class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :manage, User do |u|
      user == u
    end
        
    can :manage, Invoice do |invoice|
      invoice.user == user
    end
  end
end