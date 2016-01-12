require 'rails_helper'

RSpec.describe UsersExpensesController, type: :controller do

  describe "GET #accept" do
    it "returns http success" do
      get :accept
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #pay" do
    it "returns http success" do
      get :pay
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #confirm" do
    it "returns http success" do
      get :confirm
      expect(response).to have_http_status(:success)
    end
  end

end
