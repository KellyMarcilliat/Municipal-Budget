require 'pry'

class BudgetCategory

  attr_reader       :name
  def initialize(category_name)
    @name = category_name
  end
end
