lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "contracts/non_intrusive"
C = Contracts

class Example
  class << self
    include Contracts::NonIntrusive

    Contract(C::Num, C::Num => C::Num)[:add => :add__raw]
    def add__raw(a, b)
      a + b
    end
  end
end

puts Example.add(3, 2)
# => 5

puts Example.add(2, "foo")
#: Contract violation for argument 2 of 2: (ParamContractError)
#        Expected: Num,
#        Actual: "foo"
#        Value guarded in: Example::add
#        With Contract: Num, Num => Num
#        At: examples/singleton_add.rb:12
