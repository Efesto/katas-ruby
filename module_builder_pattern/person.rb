require_relative 'attributes_module'

class Person
  include Attributes.new('name', 'surname', 'middle_name')
end
