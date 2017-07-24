class TicketsController < ApplicationController

  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      flash[:notice] = "Ticket added!"
      redirect_to tickets_path
    else
      render :new
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket= Ticket.find(params[:id])
    if @ticket.update(ticket_params)
      flash[:notice] = "Ticket updated!"
      redirect_to tickets_path
    else
      render :edit
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    flash[:alert] = "Ticket deleted!"
    redirect_to tickets_path
  end

private
  def ticket_params
    params.require(:ticket).permit(:ticket_img, :tess_text)
  end

end
