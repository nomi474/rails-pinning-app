class PinsController < ApplicationController
  
  #GET /pins
  #get /pins.json
  def index
    @pins = Pin.all
  end
  
  #GET /pins/1
  #GET /pins/1.json
  def show
    @pin = Pin.find(params[:id])
  end
  
  def show_by_name
    @pin = Pin.find_by_slug(params[:slug])
    render :show
  end
  
  #GET /pins/new
  def new
    @pin = Pin.new
    render :new
  end
  
  def create
    @pin=Pin.new(pin_params)
    if @pin.save
      redirect_to @pin
    else
      @errors = @pin.errors
      render :new
    end
  end
  
  def edit
    @pin = Pin.find(params[:id])
    render :edit
  end
  
  private
  
  def pin_params
    params.require(:pin).permit(:title, :url,:slug, :text, :category_id)
  end
  
end