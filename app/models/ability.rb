class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Group, public: true
    can :manage, Entity, user_id: user.id
  end
end
