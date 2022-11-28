class BeersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @beers = Beer.where(recipient_id: current_user).order(created_at: :desc)
    @beers.each do |beer|
      beer.read = true
      beer.save!
    end
    @beer = Beer.new
  end

  def create
    if Beer.between(params[:sender_id], params[:recipient_id]).present?
      @beer = Beer.between(params[:sender_id], params[:recipient_id]).first
    else
      @beer = Beer.create!(beer_params)
    end
  end

  def destroy
    @beerTarget = Beer.find(params[:id])
    @beerTarget.destroy
  end

  def create_beer
    @beer = Beer.new(sender_id: current_user.id, recipient_id: params[:id])
    if @beer.save
      redirect_to beers_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def delete_beer
    @beer = Beer.find(params[:id])
    @beer.destroy
  end

  private

  def beer_params
    params.permit(:sender_id, :recipient_id)
  end
end
