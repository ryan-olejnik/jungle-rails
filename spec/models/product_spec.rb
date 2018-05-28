require 'rails_helper'
require 'category.rb'
require 'product.rb'

RSpec.describe Product, type: :model do
  before do
    @toy_category = Category.new(name: 'toys')
  end
  
  describe 'Validations' do

    it 'should throw the correct error if it is instantiated without a name' do
      @new_product = Product.new(name: nil, price: 100, quantity: 5, category: @toy_category)
      expect(@new_product.save).to be_falsy
      expect(@new_product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should throw the correct error if it is instantiated without a price' do
      @new_product = Product.new(name: 'RC car', price: nil, quantity: 5, category: @toy_category)
      expect(@new_product).to be_invalid
      @new_product.save
      expect(@new_product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should throw the correct error if it is instantiated without a quantity' do
      @new_product = Product.new(name: 'RC car', price: 100, quantity: nil, category: @toy_category)
      expect(@new_product).to be_invalid
      @new_product.save
      expect(@new_product.errors.full_messages).to include("Quantity can't be blank")
    end
  

    it 'should throw the correct error if it is instantiated without a category' do
      @new_product = Product.new(name: 'RC car', price: 100, quantity: 5, category: nil)
      expect(@new_product).to be_invalid
      @new_product.save
      expect(@new_product.errors.full_messages).to include("Category can't be blank")
    end

    it 'should successfully save if valid parameters are given for all feilds' do
      @new_product = Product.new(name: 'RC car', price: 100, quantity: 5, category: @toy_category)
      expect(@new_product).to be_valid
      expect(@new_product.save).to be_truthy
      expect(Product.all.size).to eql(1)
    end

    

  end
end
