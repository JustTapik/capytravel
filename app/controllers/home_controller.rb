class HomeController < ApplicationController
  
  before_action :authenticate_user!, only: [:profile]

  def index
    redirect_to tickets_path
  end

  def profile
    @current_user = current_user
    @tickets = current_user.tickets
  end
end
