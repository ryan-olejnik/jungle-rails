require 'rails_helper'
require 'category.rb'
require 'product.rb'
RSpec.feature "ProductDetails", type: :feature,  js: true do
  before :each do
    @category = Category.create!(name: 'Toys')

    @category.products.create!(
      name: 'RC Car',
      description: 'Super fast remote controlled car.',
      quantity: 10,
      price: 139.99,
      image: open_asset('apparel1.jpg')
      )
    visit root_path
  end

  scenario 'the user clicks on a product' do
    expect(page).to have_content('RC Car')
    click_on('RC Car')
    expect(find('#name')).to have_content('RC Car')
    expect(find('#description')).to have_content('Super fast remote controlled car.')
    expect(find('#quantity')).to have_content(10)
    expect(find('#price')).to have_content(139.99)

  end







end
