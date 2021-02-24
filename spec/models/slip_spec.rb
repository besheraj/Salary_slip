require 'rails_helper'

# testing models validity
RSpec.describe Slip, :type => :model do
  subject {
    described_class.new(time_stamp: "Anything",
                        employee_name: "Lorem ipsum",
                        annual_salary: "Lorem ipsum",
                        monthly_income_tax: "Lorem ipsum")
  }

  it "is not valid without a time_stamp" do
    subject.time_stamp = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a employee_name" do
    subject.employee_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a annual_salary" do
    subject.annual_salary = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a monthly_income_tax" do
    subject.monthly_income_tax = nil
    expect(subject).to_not be_valid
  end
end