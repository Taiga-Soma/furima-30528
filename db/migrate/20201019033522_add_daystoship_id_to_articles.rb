class AddDaystoshipIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :daystoship_id, :integer
  end
end
