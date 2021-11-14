# frozen_string_literal: true

require 'rails_helper'

feature 'User can open products page', "
  In order to chec products properties
  As a authenticated user
  I'd like to be able open products page
" do
  given(:property) { create(:property) }
  given(:product) { create(:product) }
  given!(:products_property) { create(:products_property, property: property, product: product) }

  describe 'when authenticated user' do
    given(:user) { create(:user) }

    background { sign_in(user) }

    scenario 'open product page' do
      expect(page).to_not have_content product.properties.first.name
      expect(page).to_not have_content product.products_properties.where(property: property).first.value

      visit product_path(product)

      expect(page).to have_content product.properties.first.name
      expect(page).to have_content product.products_properties.first.value
    end
  end
end
