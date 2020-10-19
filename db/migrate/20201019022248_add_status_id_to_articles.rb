class AddStatusIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :status_id, :integer
  end
end
