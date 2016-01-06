require 'rails_helper'

RSpec.describe UsersTripsController, type: :controller do

  describe "GET #invite" do
    it "returns http success" do
      get :invite
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #accept" do
    it "returns http success" do
      get :accept
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
