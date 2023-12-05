class AdminController < ApplicationController
  def index
    @tickets = Ticket.all
    authorize Ticket, policy_class: AdminPolicy
  rescue Pundit::NotAuthorizedError
    redirect_to root_path
  end
end
