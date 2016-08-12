require 'rspec'

describe 'Including module' do
  it 'should change ancestors sorting based on inclusion order' do
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

    class IncludingB
      include ModuleA
      include ModuleB
      include ModuleA
    end

    class IncludingA
      include ModuleB
      include ModuleA
      include ModuleB
    end

    expect(IncludingB.new.say_my_name).to eq('B')
    expect(IncludingB.ancestors[0..3]).to eq([IncludingB, ModuleB, ModuleA, Object])

    expect(IncludingA.new.say_my_name).to eq('A')
    expect(IncludingA.ancestors[0..3]).to eq([IncludingA, ModuleA, ModuleB, Object])
  end
end

describe 'Extending module' do
  it 'extend should define a class method' do
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
      extend ModuleA
    end

    class ExtendingA
      extend ModuleB
      extend ModuleA
      extend ModuleB
      include ModuleB
    end

    expect(ExtendingB.say_my_name).to eq('B')
    expect{ExtendingB.new.say_my_name}.to raise_error NoMethodError
    expect(ExtendingB.ancestors).to eq([ExtendingB, Object, Kernel, BasicObject])

    expect(ExtendingA.say_my_name).to eq('A')
    expect(ExtendingA.new.say_my_name).to eq('B')
    expect(ExtendingA.ancestors).to eq([ExtendingA, ModuleB, Object, Kernel, BasicObject])
  end
end

describe 'Ways to extend an object' do
  describe 'class << metaclass' do
    it 'should define static methods' do
      class AKlass
      end

      expect{AKlass.new.say_my_name}.to raise_error NoMethodError
      expect{AKlass.say_my_name}.to raise_error NoMethodError

      class << AKlass
        def say_my_name
          'My name is Jeff'
        end
      end

      expect(AKlass.say_my_name).to eq('My name is Jeff')
      expect{AKlass.new.say_my_name}.to raise_error NoMethodError
    end
  end

  describe 'class eval' do
    it 'should define methods on class' do
      class BKlass
      end

      expect{BKlass.new.say_my_name}.to raise_error NoMethodError
      expect{BKlass.say_my_name}.to raise_error NoMethodError

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
    it 'should define methods on class instances' do
      class CKlass
        def initialize
          @secret_name = 'Instance'
        end
      end

      new_instance = CKlass.new
      expect {new_instance.say_my_name}.to raise_error NoMethodError

      new_instance.instance_eval do
        def say_my_name
          "My name is #{@secret_name}"
        end
      end

      expect(new_instance.say_my_name).to eq('My name is Instance')
    end
  end
end