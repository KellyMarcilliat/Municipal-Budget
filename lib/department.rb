require 'pry'

class Department

  attr_reader       :name,
                    :expenses

  def initialize(department_name)
    @name = department_name
    @expenses = []
  end 

end
