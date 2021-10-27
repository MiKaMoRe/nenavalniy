# frozen_string_literal: true

require 'rails_helper'

feature 'User can check added to cart products', "
  In order to order products
  As a authenticated user
  I'd like to be able check added to cart products
" do
  given(:product) { create(:product) }

  describe 'when authenticated user' do
    given(:user) { create(:user) }
    given(:cart) { create(:cart, user: user) }

    background do
      sign_in(user)
      visit cart_path(cart)
    end

    scenario 'add product and check his cart' do
      expect(page).to_not have_content product.name

      visit products_path
      click_on 'В корзину'
      visit cart_path(cart)

      expect(page).to have_content product.name
    end
  end
end
