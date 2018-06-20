require 'pry'

class Department

  attr_reader       :name
  attr_accessor     :expenses

  def initialize(department_name)
    @name = department_name
    @expenses = []
  end

end
