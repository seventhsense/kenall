#encoding: utf-8
class PostcodesController < ApplicationController
  def index
    @search = modify_search_term params[:search]
    @searches = ""
    unless @search.nil? || @search.empty? 
      @searches = Postcode.where("zip LIKE ?","#{ @search}%").page(params[:page])
      @searches = Postcode.where("zip LIKE ?","%#{@search}%").page(params[:page]) if @searches.empty?
      @searches = Postcode.where("address_kana LIKE ?","%#{@search}%").page(params[:page]) if @searches.empty?
      @searches = Postcode.where("address LIKE ?","%#{@search}%").page(params[:page]) if @searches.empty?
    end
  end

  private
  def modify_search_term(term)
    if /[０-９]+ー*[０-９]+/ =~ term
      term.tr! "０-９","0-9"
      term.tr! "ー", "-"
    end
    term.tr!("ぁ-ん", "ァ-ン") if /^[\p{hiragana}ー－]+$/ =~ term
    term.gsub!(/-/,'') if /^\d+(\-)\d+$/ =~ term
    return term
  end
end
