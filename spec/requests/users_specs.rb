require 'rails_helper'

RSpec.describe 'users controller', type: :request do
  describe 'GET user routes' do
    describe 'GET /users' do
      before(:example) { get users_path }

      it 'should return 200 http_status_code' do
        expect(response).to have_http_status(:ok)
      end

      it 'should render the correct template' do
        expect(response).to render_template(:index)
      end

      it 'should display the correct placeholder text' do
        expect(response.body).to include('Users')
      end
    end
  end
end
