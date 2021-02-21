def calculate_tax(salary)
  tax = 0
  tax_brackets = [
    { "from" => 0, "to" => 20000, "rate" => 0 },
    { "from" => 20000, "to" => 40000, "rate" => 0.1 },
    { "from" => 40000, "to" => 80000, "rate" => 0.2 },
    { "from" => 80000, "to" => 180000, "rate" => 0.3 },
    { "from" => 180000, "to" => Float::INFINITY, "rate" => 0.4 },
  ]
  for tax_bracket in tax_brackets
    if salary > tax_bracket["to"]
      taxableAmount = tax_bracket["to"] - tax_bracket["from"]
    else
      taxableAmount = salary - tax_bracket["from"]
    end
    if taxableAmount <= 0
      break
    end
    tax += taxableAmount * tax_bracket["rate"]
  end
  return tax
end

