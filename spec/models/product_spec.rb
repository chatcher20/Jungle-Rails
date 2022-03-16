require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    before(:each) do
      @category = Category.new
    end

    it 'Should save with the presence of name, price, quantity and category' do
      testProduct = Product.new({
        name: 'John Doe',
        price: '$1000',
        quantity: '3',
        category: @category
      })
      expect(testProduct.save).to be true
    end
  
    it 'Should not save when name missing' do
      testProduct = Product.new({
        name: 'John Doe',
        category: @category
      })
      expect(testProduct.save).to be false
    end

    it 'Should not save when price missing' do
      testProduct = Product.new({
        price: '$1000',
        category: @category
      })
      expect(testProduct.save).to be false
    end

    it 'Should not save when quantity missing' do
      testProduct = Product.new({
        quantity: '3',
        category: @category
      })
      expect(testProduct.save).to be false
    end

    it 'Should not save when category missing' do
      testProduct = Product.new({
        name: 'John Doe',
        price: '$1000',
        quantity: '3'        
      })
      expect(testProduct.save).to be false
    end

  end

end




