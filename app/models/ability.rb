class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # usuario invitado (no registrado)

    can :read, WorkoutSession, user_id: user.id
    can :create, WorkoutSession, user_id: user.id
    can :update, WorkoutSession, user_id: user.id
    can :destroy, WorkoutSession, user_id: user.id
  end
end

