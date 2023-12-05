class TicketPolicy < ApplicationPolicy
  attr_reader :user, :ticket

  def initialize(user, ticket)
    @user = user
    @ticket = ticket
  end

  def create?
    @user.present? && @user.admin?
  end

  def update?
    @user.present? && @user.admin?
  end

  def destroy?
    @user.present? && @user.admin?
  end
end
