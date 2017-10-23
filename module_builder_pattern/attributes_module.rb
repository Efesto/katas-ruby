class Attributes < Module
  def initialize(*args)
    args.each do |arg|
      define_method arg do
        arg
      end
    end
  end
end
