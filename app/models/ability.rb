# frozen_string_literal: true

class Ability
  include CanCan::Ability

  attr_reader :user

  def initialize(user)
    @user = user
    if user.admin?
      admin_abilities
    elsif user.paid_user? || user.email == 'guest@example.com'
      paid_abilities(user)
    else
      guest_abilities
    end
  end

  def admin_abilities
    can :manage, :all
  end

  def paid_abilities(_user)
    guest_abilities
    can %i[create update update_inline import destroy], [DigitizationAgsk],
        user_id: @user.id
  end

  def guest_abilities
    can :read, :all
  end
end