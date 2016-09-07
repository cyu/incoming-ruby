require 'json'

module Incoming

  class InstructionSetLoader
    def initialize
      @tasks = []
    end

    def method_missing(name, args)
      raise InvalidArgumentError, "Arguments should be named" unless args.kind_of?(Hash)
      task = {name: name, options: args}
      if block_given?
        l = InstructionSetLoader.new
        l.instance_exec(&Proc.new)
        task[:tasks] = l.to_arr
      end
      @tasks << task
    end

    def to_arr
      @tasks.dup
    end
  end

  class InstructionSetConverter

    def self.to_arr(fn)
      l = InstructionSetLoader.new
      l.instance_eval(File.read(fn), fn)
      l.to_arr
    end

    def self.to_json(fn)
      JSON.pretty_generate(to_arr(fn))
    end

  end

end
