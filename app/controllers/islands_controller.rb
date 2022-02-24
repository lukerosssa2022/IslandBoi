class IslandsController < ApplicationController
  before_action :find_island, only: %i[edit destroy]

  def index
    if params[:query].present?
      @islands = Island.global_search(params[:query])
    else
      @islands = Island.all
    end
  end

  def show
    @island = Island.find(params[:id])
    @booking = Booking.new
  end

  def edit
  end

  def new
    @island = Island.new
  end

  def create
    @island = Island.new(island_params)
    @island.user = current_user
    if @island.save
      redirect_to @island, notice: 'New island was created!'
    else
      render :new
    end
  end

  def destroy
    @island.destroy
    redirect_to islands_path, notice: "Island was deleted successfully"
  end

  private

  def find_island
    @island = Island.find(params[:id])
  end

  def island_params
    params.require(:island).permit(:name, :territory, :description, :price_per_day, :size, :main_photo, photos: [])
  end
end

# ARCHIVE

# def index_user
# @user_islands = current_user.islands
# end
