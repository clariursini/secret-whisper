class BeersController < ApplicationController

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

    # if Beer.between(params[:sender_id], params[:recipient_id]).present?
    #   @beer = Beer.between(params[:sender_id], params[:recipient_id]).destroy
    # else
    #   @beer = Beer.between(params[:sender_id], params[:recipient_id]).first
    # end
  end

  private

  def beer_params
    params.permit(:sender_id, :recipient_id)
  end
end
