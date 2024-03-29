class RentalpostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

  def index
  end

  def create
    @rentalpost = current_user.rentalposts.build(params[:rentalpost])
    if @rentalpost.save
      flash[:success] = "Rentalpost created!"
      redirect_to root_url
    else
     @feed_items = []
     render 'static_pages/home'
    end
  end

  def destroy
    @rentalpost.destroy
    redirect_to root_url
  end

  private

    def correct_user
      @rentalpost = current_user.rentalposts.find_by_id(params[:id])
      redirect_to root_url if @rentalpost.nil?
    end
end
