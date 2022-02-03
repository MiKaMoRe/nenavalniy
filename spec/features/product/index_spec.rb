# frozen_string_literal: true

require 'rails_helper'

feature 'User can see product list', "
  In order to choose product
  As a guest
  I'd like to be able see product list
" do
  describe 'when guest' do
    given!(:product) { create(:product) }

    scenario 'when open products list' do
      visit products_path

      expect(page).to have_content product.name
      expect(page).to have_content product.price
      expect(page).to have_content product.amount
    end
  end

  describe 'when product' do
    given(:product_out_of_stock) { create(:product, :out_of_stock) }
    given(:product) { create(:product) }

    scenario 'in stock' do
      product
      visit products_path

      expect(page).to have_content 'В корзину'
      expect(page).to have_content 'В наличии'
    end

    scenario 'out of stock' do
      product_out_of_stock
      visit products_path

      expect(page).to have_content 'Нет в наличии'
      expect(page).to_not have_content 'В корзину'
    end
  end
end
