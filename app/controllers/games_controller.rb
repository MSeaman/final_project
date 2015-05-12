class GamesController < ApplicationController

  before_action :authenticate

  def index
  end

  def search
    @games = Giant.search(params['Search'])
    # render json: games 
  end

  def show
  end

  def one
    @games = Giant.game(params['gameID'])
  end

  # def create
  #   @games = Giant.save_game(params['gameID'])
  # end

  def create
    @games = Giant.save_game(params['gameID'])
    # @game = game.new(game_params)
    # @game.completed = false

    if @game.save
      respond_to do |format|
        # format.html { redirect_to '/games' }
        format.html { redirect_to games_path }
        format.json { render json: @game }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: { error: 'BAD STUFF', status: 400 }}
      end
    end

  end


  private
  def game_params
    params.require(:game).permit(:name, :boxart, :synopsis) #:review, #:gameplay_pic, :walkthrough)
  end
end
