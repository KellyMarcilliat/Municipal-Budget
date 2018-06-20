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

  def test_it_has_attributes
    municipal_budget = MunicipalBudget.new

    assert_equal [], municipal_budget.expenses
    assert_equal [], municipal_budget.departments
    assert_equal [], municipal_budget.budget_categories
  end

  def test_it_can_add_expenses
    municipal_budget = MunicipalBudget.new
    department = Department.new("Parks and Recreation")
    budget_category = BudgetCategory.new("Appliances")

    expense_1 = Expense.new(department, budget_category, "656.50")
    municipal_budget.add_expense(expense_1)

    assert_equal Expense, municipal_budget.expenses[0].class
    assert_equal 1, municipal_budget.expenses.count
    assert_equal [expense_1], municipal_budget.expenses

    expense_2 = Expense.new(department, budget_category, "20.45")
    municipal_budget.add_expense(expense_2)

    assert_equal Expense, municipal_budget.expenses[1].class
    assert_equal 2, municipal_budget.expenses.count
    assert_equal [expense_1, expense_2], municipal_budget.expenses
  end

  def test_it_adds_expense_to_correct_department
    municipal_budget = MunicipalBudget.new
    department = Department.new("Parks and Recreation")
    budget_category = BudgetCategory.new("Appliances")

    expense_1 = Expense.new(department, budget_category, "656.50")
    municipal_budget.allocate_expense(expense_1)

    assert_equal [expense_1], department.expenses
  end

  def test_it_collects_departments_from_expenses
    municipal_budget = MunicipalBudget.new
    department = Department.new("Parks and Recreation")
    budget_category = BudgetCategory.new("Appliances")

    expense_1 = Expense.new(department, budget_category, "656.50")
    municipal_budget.allocate_expense(expense_1)

    assert_equal Department, municipal_budget.departments[0].class
    assert_equal 1, municipal_budget.departments.count

    expense_2 = Expense.new(department, budget_category, "20.45")
    municipal_budget.allocate_expense(expense_2)

    assert_equal Department, municipal_budget.departments[1].class
    assert_equal 2, municipal_budget.departments.count
  end

  def test_it_collects_budget_categories_from_expenses
    municipal_budget = MunicipalBudget.new
    department = Department.new("Parks and Recreation")
    budget_category = BudgetCategory.new("Appliances")

    expense_1 = Expense.new(department, budget_category, "656.50")
    municipal_budget.allocate_expense(expense_1)

    assert_equal BudgetCategory, municipal_budget.budget_categories[0].class
    assert_equal 1, municipal_budget.budget_categories.count
    assert_equal [expense_1. budget_category], municipal_budget.budget_categories

    expense_2 = Expense.new(department, budget_category, "20.45")
    municipal_budget.allocate_expense(expense_2)

    assert_equal BudgetCategory, municipal_budget.budget_categories[1].class
    assert_equal 2, municipal_budget.budget_categories.count
    assert_equal [expense_1. budget_category, expense_2.budget_category], municipal_budget.budget_categories
  end



end
