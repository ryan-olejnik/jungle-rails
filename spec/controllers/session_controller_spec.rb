require 'rails_helper'
require 'user.rb'
require 'sessions_controller.rb'


RSpec.describe SessionsController, type: :controller do
  describe '.authenticate_with_credentials' do
    it 'should return false if email is incorrect' do
      @user = User.new(first_name: 'Jane', last_name: 'Doe', email: 'jane.doe@gmail.com', password: 'password', password_confirmation: 'password')
      @user.save
      expect(SessionsController.authenticate_with_credentials('WRONG_jane.doe@gmail.com', 'password')).to be_falsy
    end
    it 'should return false if password is incorrect' do
      @user = User.new(first_name: 'Jane', last_name: 'Doe', email: 'jane.doe@gmail.com', password: 'password', password_confirmation: 'password')
      @user.save
      expect(SessionsController.authenticate_with_credentials('jane.doe@gmail.com', 'WRONG_password')).to be_falsy
    end
    it 'should return user object (truthy) if email and password are correct' do
      @user = User.new(first_name: 'Jane', last_name: 'Doe', email: 'jane.doe@gmail.com', password: 'password', password_confirmation: 'password')
      @user.save
      expect(SessionsController.authenticate_with_credentials('jane.doe@gmail.com', 'password')).to be_truthy
    end


  end

end
