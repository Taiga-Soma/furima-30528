class AddPrefecturesIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :prefectures_id, :integer
  end
end
