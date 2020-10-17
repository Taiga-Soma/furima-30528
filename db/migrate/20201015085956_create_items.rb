class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title 
      t.integer  :price 
      t.text :description
      t.integer  :category_id 
      t.integer  :status_id 
      t.integer  :burden_id 
      t.integer  :prefectures_id 
      t.integer  :daystoship_id
      t.references  :user 
      t.timestamps
    end
  end
end
