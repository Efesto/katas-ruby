require_relative 'person'

describe Person do
  %w(name surname middle_name).each do |attribute|
    context "defines method for attribute #{attribute}" do
      it do
        expect(described_class.new.public_send(attribute)).to eq attribute
      end
    end
  end
end
