require "rails_helper"

describe 'Monthly Slip API', type: :request do
    it 'return monthly slip' do
        get '/v1/monthly_slip'
        expect(response).to have_http_status(:success)
    end
end