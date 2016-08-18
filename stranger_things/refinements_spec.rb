require 'rspec'

describe 'Refinements' do
  it 'should work inside class scope' do
    expect(ToRefineKlass.new.power).to eq('Kirilin')

    class ToRefineKlass
      def power
        'Kirilin'
      end
    end

    module RefinementsModule
      refine ToRefineKlass do
        def power
          'Over 9000!!'
        end
      end
    end

    class Refinator
      using RefinementsModule #<-- using is a module's method
      def self.say_power
        ToRefineKlass.new.power
      end
    end

    expect(Refinator.say_power).to eq('Over 9000!!')
    expect(ToRefineKlass.new.power).to eq('Kirilin')
  end
end
