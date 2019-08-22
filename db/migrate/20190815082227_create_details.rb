class CreateDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :details do |t|
      t.string      :name, null: false, index: true
      t.text        :place
      t.string      :phone_number
      t.text        :feature
      t.string      :opentime
      t.string      :closetime
      t.string      :holiday
      t.string      :recommendation
      t.integer     :average_use_price
      t.text        :url
      t.text        :note
      t.references  :genre, null: false, foreign_key: true
      t.references  :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end