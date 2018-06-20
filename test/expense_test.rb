require 'minitest/autorun'
require 'minitest/pride'
require './lib/expense'
require './lib/department'
require './lib/budget_category'
require 'pry'

class ExpenseTest < Minitest::Test
  def test_it_exists
    d = Department.new("Parks and Recreation")
    bc = BudgetCategory.new("Appliances")
    expense = Expense.new(d, bc, "656.50")

    assert_instance_of Expense, expense
  end

  def test_it_has_attributes
    d = Department.new("Parks and Recreation")
    bc = BudgetCategory.new("Appliances")
    expense = Expense.new(d, bc, "656.50")

    assert_equal d, expense.department
    assert_equal bc, expense.budget_category
    assert_equal 656.50, expense.amount
  end

  
end
