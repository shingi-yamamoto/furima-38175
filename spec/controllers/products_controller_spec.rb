require 'rails_helper'

describe ProductsController do
  describe 'GET #search' do
    it "renders the :search template :search" do
      get :search
      expect(response).to render_templat :search

    end
  end
end