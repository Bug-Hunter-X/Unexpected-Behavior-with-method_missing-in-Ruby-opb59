```ruby
class MyClass
  def initialize(value)
    @value = value
  end

  def method_missing(method_name, *args, &block)
    # Check for method existence first
    if !respond_to?(method_name)
      raise NoMethodError, "undefined method '#{method_name}' for #<#{self.class}:0x#{object_id.to_s(16)}>"
    else
      # Handle method calls dynamically
      puts "Method '#{method_name}' called with args: #{args.inspect}"
    end
  end
end

object = MyClass.new(10)
begin
  object.nonexistent_method(1, 2, 3)
rescue NoMethodError => e
  puts "Exception caught: #{e.message}"
end
```