require "salary_calc.rb"

class V1::MonthlySlipController < ApplicationController
  
  # calculate salary slip details
  def monthly_slip(params)
    @employee_name = params[:employee_name]
    @annual_salary = params[:annual_salary].to_i

    @tax = calculate_tax(@annual_salary)
    @gross_monthly_income = formatWith2Decimals(@annual_salary / 12.0)
    @monthly_income_tax = formatWith2Decimals(@tax / 12.0)
    @net_monthly_income = formatWith2Decimals((@annual_salary - @tax) / 12.0)

    return @monthly_slip = {
             "employee_name" => @employee_name,
             "gross_monthly_income" => @gross_monthly_income,
             "monthly_income_tax" => @monthly_income_tax,
             "net_monthly_income" => @net_monthly_income,
           }
  end
  
  # return calculated details 
  def show
    monthly_slip(params)
    # secure valid input
    return render json: { msg: "input valid number" } unless @annual_salary > 0
    render json: @monthly_slip, status: :ok
  end

  # save input details with calculated tax in the database 
  def create
    monthly_slip(params)
    # secure valid input
    return render json: { msg: "input valid number" } unless @annual_salary > 0
    @timestamp = DateTime.now
    slip = Slip.new({
      "time_stamp" => @timestamp,
      "annual_salary" => @annual_salary,
      "employee_name" => @employee_name,
      "monthly_income_tax" => @monthly_income_tax,
    })
    if slip.save
      render json: { status: "SUCCESS", message: "Saved Infotmation", data: slip }, status: :ok
    else
      render json: { status: "ERROR", message: "Information not saved", data: slip.errors }, status: :unprocessable_entity
    end
  end

  # define parameters
  def slip_params
    params.permit(:employee_name, :annual_salary)
  end
end
