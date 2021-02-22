class Slip < ApplicationRecord
    validates :time_stamp, presence: true
    validates :employee_name, presence: true
    validates :annual_salary, presence: true
    validates :monthly_income_tax, presence: true
end
