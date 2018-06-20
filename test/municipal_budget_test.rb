require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/department'
require './lib/budget_category'
require './lib/expense'
require './lib/municipal_budget'

class MunicipalBudgetTest < Minitest::Test
  def test_it_exists
    municipal_budget = MunicipalBudget.new

    assert_instance_of MunicipalBudget, municipal_budget
  end

  def test_it_has_expenses_attribute
    municipal_budget = MunicipalBudget.new

    assert_equal [], municipal_budget.expenses
  end

end
