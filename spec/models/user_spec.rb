require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    # validation examples here

    it 'Should create new user when all credentials are provided and passwords match.' do
      testUser = User.create({
        name: 'John Doe',
        email: 'johnny@example.com',
        password: 'mahogany',
        password_confirmation: 'mahogany'
      })
      expect(testUser).to be_valid
    end
    
    it 'Should not create new user when passwords do not match' do
      testUser = User.create({
        name: 'John Doe',
        email: 'johnny@example.com',
        password: 'mahogany',
        password_confirmation: 'burgundy'
      })
      expect(testUser.errors.full_messages).to include("Password confirmation doesn't match Password")
      expect(testUser).to_not be_valid
    end

    it 'Should not create new user if email already exists.' do
      user1 = User.create({
        name: 'John Doe',
        email: 'johnny@example.com',
        password: 'mahogany',
        password_confirmation: 'mahogany'
      })
      user2 = User.create({
        name: 'Jane Smith',
        email: 'johnny@example.com',
        password: 'lavender',
        password_confirmation: 'lavender'
      })
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end























    it 'Should not validate when the password is less than 8 characters long.' do
      testUser = User.create({
        name: 'John Doe',
        email: 'johnny@example.com',
        password: 'hello',
        password_confirmation: 'hello'
      })
      expect(testUser.errors.full_messages).to include ("Password is too short (minimum is 8 characters)")
    end

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'Should login successfully when all credentials are provided and passwords match.' do
      testUser = User.create({
        name: 'John Doe',
        email: 'johnny@example.com',
        password: 'mahogany',
        password_confirmation: 'mahogany'
      })
      expect(User.authenticate_with_credentials('johnny@example.com', 'mahogany')).to_not be_nil
    end

    it 'Should not login with improper credentials.' do
      testUser = User.create({
        name: 'John Doe',
        email: 'johnny@example.com',
        password: 'mahogany',
        password_confirmation: 'mahogany'
      })
      expect(User.authenticate_with_credentials('johnny@example.com', 'wrongpassword')).to be_nil
    end

    it 'Should login when email is a different case ie upper or lower' do
      testUser = User.create({
        name: 'John Doe',
        email: 'johnny@example.com',
        password: 'mahogany',
        password_confirmation: 'mahogany'
      })  
      expect(User.authenticate_with_credentials('JoHnNy@example.com', 'mahogany')).to_not be_nil
    end

    it 'Should login when there is leading or trailing whitespace in the email' do
      testUser = User.create({
        name: 'John Doe',
        email: 'johnny@example.com',
        password: 'mahogany',
        password_confirmation: 'mahogany'
      })  
      expect(User.authenticate_with_credentials('   JoHnNy@example.com   ', 'mahogany')).to_not be_nil
    end





  end

end

  





