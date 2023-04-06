# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    return unless user.present?

    can :manage, Category, user_id: user.id
    can :manage, CategoryDetail, users_id: user.id
  end
end
