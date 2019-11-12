class AddEnabledToTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :enabled, :boolean, default: false
  end
end
