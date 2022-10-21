require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET' do
    it 'Response status is 200' do
      get root_path
      expect(response).to have_http_status(200)
    end
    it 'Renders the index view template' do
      get new_user_path
      expect(response).to have_http_status(200)
    end
  end
end
