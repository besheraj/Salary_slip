class CreateSlips < ActiveRecord::Migration[6.1]
  def change
    create_table :slips do |t|
      t.string :time_stamp
      t.string :employee_name
      t.string :annual_salary
      t.string :monthly_income_tax
    end
  end
end
