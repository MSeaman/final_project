class GamesController < ApplicationController

  before_action :authenticate

  def index
    # @games = Game.all
    @games = current_user.games
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
    @game = Giant.save_game(params['gameID'])
    # @game.completed = false
    # @game = game.new(game_params)

    if @game.save 
     current_user.games << @game
      respond_to do |format|
        # format.html { redirect_to '/games' }
        format.html { redirect_to games_path }
        format.json { render json: @games }
      end
    else
      flash.now[:alert] = 'This game already exists in your favorites!'
      respond_to do |format|
        format.html { redirect_to games_path }
        format.json { render json: { error: 'BAD STUFF', status: 400 }}
      end
    end
  end

  def destroy
    @game = Game.find(params[:id])

    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_path }
      format.json { render json: @games }
    end
  end


  private
  def game_params
    params.require(:game).permit(:name, :boxart, :synopsis) #:review, #:gameplay_pic, :walkthrough)
  end
end
