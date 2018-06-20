require 'pry'
require './lib/budget_category'
require './lib/department'

class Expense

  attr_reader       :department,
                    :budget_category,
                    :amount

  def initialize(d, bc, amount = "0")
    @department = d
    @budget_category = bc
    @amount = amount.to_f
  end

end
# expense = Expense.new("Roads", "asphalt", "70000")
# p expense
