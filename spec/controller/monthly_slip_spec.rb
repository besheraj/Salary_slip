require "rails_helper"

describe 'Monthly Slip API', type: :request do
    it 'return monthly slip' do
        get '/v1/monthly_slip'
        expect(response).to have_http_status(:success)
    end
    it 'give name and annual salary return with monthly salary slip ' do
        get('/v1/monthly_slip', params:{annual_salary:'60000',employee_name:'Besher'})
        expect(JSON(response.body)).to include(
            {
            "employee_name"=> "Besher",
            "gross_monthly_income"=> "5000.00",
            "monthly_income_tax"=> "500.00",
            "net_monthly_income"=> "4500.00"
            }
        )
      end
end