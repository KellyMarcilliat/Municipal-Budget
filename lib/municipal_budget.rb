require 'pry'

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

end
