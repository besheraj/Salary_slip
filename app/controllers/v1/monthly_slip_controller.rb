require "salary.rb"

class V1::MonthlySlipController < ApplicationController

  # define parameters
  def slip_params
    params.permit(:employee_name, :annual_salary)
  end

  def index
    employee_name = params[:employee_name]
    annual_salary = params[:annual_salary].to_i

    # secure valid input
    return render json: { msg: "input valid number" } unless annual_salary > 0

    tax = calculate_tax(annual_salary)
    gross_monthly_income = formatWith2Decimals(annual_salary / 12.0)
    monthly_income_tax = formatWith2Decimals(tax / 12.0)
    net_monthly_income = formatWith2Decimals((annual_salary - tax) / 12.0)
    monthly_slip = {
      "employee_name" => employee_name,
      "gross_monthly_income" => gross_monthly_income,
      "monthly_income_tax" => monthly_income_tax,
      "net_monthly_income" => net_monthly_income,
    }
    render json: monthly_slip, status: :ok
  end
end
