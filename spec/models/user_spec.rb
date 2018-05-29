require 'rails_helper'
require 'user.rb'
require 'users_controller.rb'

RSpec.describe User, type: :model do
  describe 'validation' do
    it 'should not register a new user if the password and password_confirmation do not match' do
      @user = User.new(first_name: 'Jane', last_name: 'Doe', email: 'jane.doe@gmail.com', password: 'password', password_confirmation: 'oassword')
      expect(@user.save).to be_falsy
      expect(User.all.size).to eql(0)
    end

    it 'should successfully register a new user if the password and password_confirmation do not match' do
      @user = User.new(first_name: 'Jane', last_name: 'Doe', email: 'jane.doe@gmail.com', password: 'password', password_confirmation: 'password')
      expect(@user.save).to be_truthy
      expect(User.all.size).to eql(1)
    end

    it 'should not register a new user if their password is less than 6 characters' do 
      @user = User.new(first_name: 'Jane', last_name: 'Doe', email: 'jane.doe@gmail.com', password: 'pass', password_confirmation: 'pass')
      expect(@user.save).to be_falsy
      expect(User.all.size).to eql(0)      
    end
  end
end
