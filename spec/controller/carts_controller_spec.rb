# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  describe 'GET #show' do
    context 'when authenticated user' do
      let(:user) { create(:user) }
      let(:cart) { create(:cart, user: user) }

      before do
        login(user)
        get :show, params: { id: cart }
      end 

      it 'assigns the requested cart to @cart' do
        expect(assigns(:cart)).to eq cart
      end
  
      it 'renders show view' do
        expect(response).to render_template :show
      end
    end
  end
end
