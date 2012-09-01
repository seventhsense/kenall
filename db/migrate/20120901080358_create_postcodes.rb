class CreatePostcodes < ActiveRecord::Migration
  def change
    create_table :postcodes do |t|
      t.string :zip
      t.string :address
      t.string :address_kana

      t.timestamps
    end
  end
end
