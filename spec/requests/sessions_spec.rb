require 'rails_helper'

RSpec.describe "/sessions", type: :request do
  
  let(:user_admin) {FactoryBot.create :user_admin}
  let(:user_employee) {FactoryBot.create :user_employee}

  let(:admin_valid_attributes) {
    password: "123456"
    email: user_admin.email
  }

  let(:employee_valid_attributes) {
    password: "123456"
    email: user_employee.email
  }

  let(:invalid_attributes) {
    password: 123456,
    email: 1
  }


  describe "POST /login as Admin" do
    context "with valid parameters" do
      it "creates a new Session" do
        expect {
          post "/login",
            params: { user: valid_attributes }, 
            headers: valid_headers, 
            as: :json
        }.to change(Session, :count).by(1)
      end

      it "renders a JSON response with the new session" do
        post "/login",
          params: { user: valid_attributes }, 
          headers: valid_headers, 
          as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Session" do
        expect {
          post "/login",
            params: { user: invalid_attributes }, as: :json
        }.to change(Session, :count).by(0)
      end

      it "renders a JSON response with errors for the new session" do
        post "/login",
          params: { user: invalid_attributes }, 
          headers: valid_headers, 
          as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end
end
