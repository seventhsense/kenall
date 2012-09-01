class Postcodes < ActiveRecord::Migration
  def up
    change_column :postcodes, :address, :text,limit: nil
    change_column :postcodes, :address_kana, :text, limit: nil
  end

  def down
    change_column :postcodes, :address, :string
    change_column :postcodes, :address_kana, :string
  end
end
