require 'rspec'

describe 'Including module' do
  module ModuleA
    def say_my_name
      'A'
    end
  end

  module ModuleB
    def say_my_name
      'B'
    end
  end

  describe 'with include method' do
    it 'should change ancestors sorting based on inclusion order' do
      class IncludingB
        include ModuleA # overwritten
        include ModuleB
        include ModuleA # ignored
      end

      class IncludingA
        include ModuleB # overwritten
        include ModuleA
        include ModuleB # ignored
      end

      expect(IncludingB.new.say_my_name).to eq('B')
      expect(IncludingB.ancestors[0..3]).to eq([IncludingB, ModuleB, ModuleA, Object])

      expect(IncludingA.new.say_my_name).to eq('A')
      expect(IncludingA.ancestors[0..3]).to eq([IncludingA, ModuleA, ModuleB, Object])
    end

    it 'should not overwrite including class method' do
      class IncludingAWithMethod
        include ModuleA

        def say_my_name
          "My name is #{self.class}"
        end
      end

      expect(IncludingAWithMethod.new.say_my_name).to eq('My name is IncludingAWithMethod')
    end
  end

  describe 'with prepend method' do
    it 'should be descendant if included' do
      class PrependingA
        prepend ModuleB # overwritten
        prepend ModuleA
      end

      expect(PrependingA.new.say_my_name).to eq('A')
      expect(PrependingA.ancestors[0..2]).to eq([ModuleA, ModuleB, PrependingA])
    end

    it 'should overwrite prepending class methods' do
      class PrependingAWithMethod
        prepend ModuleA

        def say_my_name
          "My name is #{self.class}"
        end
      end

      expect(PrependingAWithMethod.new.say_my_name).to eq('A')
    end
  end
end

describe 'Extending module' do
  it 'should define a class methods' do
    module ModuleA
      def say_my_name
        'A'
      end
    end

    module ModuleB
      def say_my_name
        'B'
      end
    end

    class ExtendingB
      extend ModuleA
      extend ModuleB
      extend ModuleA # Ignored
    end

    class ExtendingA
      extend ModuleB
      extend ModuleA
      extend ModuleB # Ignored
      include ModuleB
    end

    expect(ExtendingB.say_my_name).to eq('B')
    expect { ExtendingB.new.say_my_name }.to raise_error NoMethodError
    expect(ExtendingB.ancestors[0..1]).to eq([ExtendingB, Object])

    expect(ExtendingA.say_my_name).to eq('A')
    expect(ExtendingA.new.say_my_name).to eq('B')
    expect(ExtendingA.ancestors[0..2]).to eq([ExtendingA, ModuleB, Object])
  end
end

describe 'Ways to extend an object' do
  describe 'class << metaclass' do
    it 'should define class behaviours' do
      class AKlass
      end

      expect { AKlass.new.say_my_name }.to raise_error NoMethodError
      expect { AKlass.say_my_name }.to raise_error NoMethodError

      class << AKlass
        def say_my_name
          'My name is Jeff'
        end
      end

      expect(AKlass.say_my_name).to eq('My name is Jeff')
      expect { AKlass.new.say_my_name }.to raise_error NoMethodError
    end
  end

  describe 'class eval' do
    it 'should define behaviours on class' do
      class BKlass
      end

      expect { BKlass.new.say_my_name }.to raise_error NoMethodError
      expect { BKlass.say_my_name }.to raise_error NoMethodError

      BKlass.class_eval do
        def say_my_name
          'My name is Instance'
        end

        def self.say_my_name
          'My name is Class'
        end
      end

      expect(BKlass.say_my_name).to eq('My name is Class')
      expect(BKlass.new.say_my_name).to eq('My name is Instance')
    end
  end

  describe 'instance eval' do
    it 'should define behaviours on class instances' do
      class CKlass
        def initialize
          @secret_name = 'Instance'
        end
      end

      new_instance = CKlass.new
      expect { new_instance.say_my_name }.to raise_error NoMethodError

      new_instance.instance_eval do
        def say_my_name
          "My name is #{@secret_name}"
        end
      end

      expect(new_instance.say_my_name).to eq('My name is Instance')
    end
  end
end
