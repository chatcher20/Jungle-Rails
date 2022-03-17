require 'rails_helper'

RSpec.feature "Visitor sees cart count increase after clicking 'Add to Cart.'", type: :feature, js: true do
  
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see their cart increase by one after clicking the 'Add to Cart' button for a product on the home page." do
     # ACT
    visit root_path

    expect(page).to have_content('My Cart (0)')

    page.find('button.btn-primary', match: :first).click

    # VERIFY
    expect(page).to have_content('My Cart (1)')
    save_screenshot
  end

end


