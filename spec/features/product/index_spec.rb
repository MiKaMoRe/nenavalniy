# frozen_string_literal: true

require 'rails_helper'

feature 'User can see product list', "
  In order to choose product
  As a guest
  I'd like to be able see product list
" do
  describe 'Guest' do
    given!(:product) { create(:product) }

    scenario 'Open products list' do
      visit products_path

      expect(page).to have_content product.article
      expect(page).to have_content product.name
      expect(page).to have_content product.price
      expect(page).to have_content product.amount
    end
  end
end
