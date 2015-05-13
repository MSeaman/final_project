class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :boxart
      t.integer :review
      t.string :synopsis
      t.string :gameplay_pic
      t.string :walkthrough
      t.string :api_id

      t.timestamps
    end
  end
end
