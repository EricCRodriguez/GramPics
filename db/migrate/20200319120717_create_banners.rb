class CreateBanners < ActiveRecord::Migration[6.0]
  def change
    create_table :banners do |t|
      t.string :title
      t.string :image
      t.string :url
      t.datetime :start_time
      t.datetime :end_time
      t.string :position
      t.boolean :active, default: true
    end
  end
end
