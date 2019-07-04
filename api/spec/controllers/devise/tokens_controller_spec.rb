RSpec.describe Devise::TokensController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in user
    request.headers['access-token'] = user.access_token
    request.headers['Content-Type'] = "application/json"
  end

  describe "GET verify_token" do
    it "Successfully" do
      get :verify_token
      expect(response.body.to_json).to eq({})
    end
  end
end