class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit create update destroy ]

  # GET /tickets or /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1 or /tickets/1.json
  def show
    @user_buy_current_ticket = user_signed_in? && current_user.tickets.where(id: params[:id]).any?
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
    authorize @ticket
  rescue Pundit::NotAuthorizedError
    redirect_to root_path
  end

  # GET /tickets/1/edit
  def edit
    authorize @ticket
  rescue Pundit::NotAuthorizedError
    redirect_to root_path
  end

  # POST /tickets or /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to :admin_page, notice: "Билет был успешно создан." }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1 or /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to :admin_page, notice: "Билет был успешно обновлён." }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1 or /tickets/1.json
  def destroy
    begin
      authorize @ticket
    rescue Pundit::NotAuthorizedError
      redirect_to root_path
      return
    end
    @ticket.destroy!

    respond_to do |format|
      format.html { redirect_to tickets_url, notice: "Билет был успешно удалён." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def ticket_params
    params.require(:ticket).permit(:name, :description, :country, :price, :rate)
  end
end
