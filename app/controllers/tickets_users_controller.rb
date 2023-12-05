class TicketsUsersController < ApplicationController
  before_action :authenticate_user!

  def buy
    ticket = Ticket.find params[:id]
    unless current_user.tickets.where(id: params[:id]).any?
      current_user.tickets << ticket
    end
    redirect_to ticket
  end

  def cancel
    ticket = Ticket.find params[:id]
    if current_user.tickets.where(id: params[:id]).any?
      current_user.tickets.delete ticket.id
    end
    redirect_to ticket
  end
end
