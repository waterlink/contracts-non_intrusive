require "contracts/non_intrusive/version"
require "contracts"

module Contracts
  class SimpleMethodReference < MethodReference
    attr_reader :raw_name
    def initialize(name, raw_name)
      @name = name
      @raw_name = raw_name
    end

    def set_method_once(value)
      @method ||= value
    end

    def send_to(this, *args, &blk)
      this.send(raw_name, *args, &blk)
    end
  end

  module NonIntrusive
    def self.included(base)
      base.send(:extend, self)
    end

    def Contract(*contracts)
      lambda do |method_map|
        name = method_map.first.first
        raw_name = method_map.first.last
        simple_method = SimpleMethodReference.new(name, raw_name)
        contract = nil

        define_method(name) do |*args, &blk|
          simple_method.set_method_once(method(raw_name))
          klass = self.class == Class ? self : self.class
          contract ||= Contract.new(klass, simple_method, *contracts)
          contract.call_with(self, *args, &blk)
        end
      end
    end
  end
end
