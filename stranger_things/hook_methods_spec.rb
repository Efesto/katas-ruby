require 'rspec'

describe 'hook methods' do
  describe 'should be called when' do
    it 'a class is inherited' do
      class String
        def self.inherited(subclass)
          puts "I'v been inherited by #{subclass.describe}"
        end

        def self.method_added(method)
          puts "Added method #{method}"
        end
      end

      class InheritingClass < String
      end
    end
  end
end
