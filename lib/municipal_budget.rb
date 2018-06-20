require 'pry'
require './lib/budget_category'

class MunicipalBudget

  attr_reader       :expenses,
                    :departments,
                    :budget_categories

  def initialize
    @expenses = []
    @departments = []
    @budget_categories = []
  end

  def add_expense(expense)
    @expenses << expense
  end

  def allocate_expense(expense)
    add_expense(expense)
    expense.department.expenses << expense
    @departments << expense.department
    @budget_categories << expense.budget_category
  end

  def total_expenses
    @total = 0
    @expenses.each do |expense|
      @total += expense.amount
    end
    return @total
  end

  def alphabetical_budget_categories
    @budget_category_names = @budget_categories.map do |object|
      object.name
    end
    @budget_category_names.sort#_by {|each| each.name}
  end

end
