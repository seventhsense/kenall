#encoding: utf-8
require 'spec_helper'

describe "Postcodes" do
  describe "GET /postcodes" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get postcodes_index_path
      response.status.should be(200)
    end
  end
  describe "using capybara" do
    it "works! (with capybara)" do
      visit '/'
      page.should have_content '検索する語を入力してください'
    end
  end

  describe "郵便番号検索" do
    it "半角数字で検索" do
      visit '/'
      fill_in 'search', with: '100'
      click_button '検索'
      page.should have_content '東京都 千代田区'
    end

    it "全角数字で検索" do
      visit '/'
      fill_in 'search', with: '１００'
      click_button '検索'
      page.should have_content '東京都 千代田区'
    end

    it "ハイフンいり半角数字で検索" do
      visit '/'
      fill_in 'search', with: '100-0000'
      click_button '検索'
      page.should have_content '東京都 千代田区'
    end

    it "ハイフンいり全角数字で検索" do
      visit '/'
      fill_in 'search', with: '１００−００００'
      click_button '検索'
      page.should have_content '東京都 千代田区'
    end
    it "ダッシュいり全角数字で検索" do
      visit '/'
      fill_in 'search', with: '１００―００００'
      click_button '検索'
      page.should have_content '東京都 千代田区'
    end
  end

  describe "かなカナ検索" do
    it "カタカナで検索" do
      visit '/'
      fill_in 'search', with: 'チヨダク'
      click_button '検索'
      page.should have_content '東京都 千代田区'
    end
    
    it "ひらがなで検索" do
      visit '/'
      fill_in 'search', with: 'ちよだく'
      click_button '検索'
      page.should have_content '東京都 千代田区'
    end

  end

  describe "漢字で検索" do
    it "漢字で検索" do
      visit '/'
      fill_in 'search', with: '千代田区'
      click_button '検索'
      page.should have_content '東京都 千代田区'
    end

    it "ひらがなと漢字で検索" do
      visit '/'
      fill_in 'search', with: 'さいたま市'
      click_button '検索'
      page.should have_content '埼玉県 さいたま市'
    end
    
  end
end
