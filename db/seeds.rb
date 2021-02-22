5.times do
    Slip.create({
        time_stamp: Faker::Date.in_date_period,
        employee_name: Faker::Name.name,
        annual_salary: Faker::Number.number(digits: 6),
        monthly_income_tax: Faker::Number.number(digits: 5)
    })
end