class AddBurdenIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :burden_id, :integer
  end
end
