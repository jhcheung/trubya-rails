class CreatePlacings < ActiveRecord::Migration[6.0]
  def change
    create_table :placings do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :leaderboard, null: false, foreign_key: true

      t.timestamps
    end
  end
end
