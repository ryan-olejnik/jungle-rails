class Admin::CategoriesController < ApplicationController
  include HttpAuthConcern

  def index
    @categories = Category.order(:name)
  end

  def create #handle post request from client 
    # puts "inside create!!!:  #{params}"
    puts "params = #{params[:category]}"
    @category = Category.new(name: params[:category][:name])
    @category.save
    puts @category.to_s


    redirect_to admin_categories_path
  end

  def new
    @category = Category.new
  end
end


