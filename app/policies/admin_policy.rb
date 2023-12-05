class AdminPolicy < ApplicationPolicy
  attr_reader :user, :ticket

  def initialize(user, ticket)
    @user = user
    @ticket = ticket
  end

  def index?
    @user.present? && @user.admin?
  end
end
