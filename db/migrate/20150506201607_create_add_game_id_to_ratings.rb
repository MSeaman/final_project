class CreateAddGameIdToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :game_id, :integer
    add_foreign_key :ratings, :games
  end
end
