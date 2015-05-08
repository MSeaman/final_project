class GamesController < ApplicationController

  before_action :authenticate

  def index
    # @games = Game.all
  end

  def search
    @games = Game.search(params['Search'])
    # render json: games 
  end

  def show
    games = Game.game(params[:id])
    render json: game
  end

  # def new
  #   @game = Game.new
  # end

  # def create
  #   @game = Game.new(game_params)
  #   if @game.save
  #     redirect_to @game
  #   else
  #     render :new
  #   end
  # end


  # private
  # def game_params
  #   params.require(:game).permit(:name, :boxart, :review, :synopsis, :gameplay_pic, :walkthrough)
  # end
end
