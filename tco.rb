# Tails call optimization ruby

require 'benchmark'

NUMBER_OF_CALLS = 10000000

method_string = <<-RUBY
  def x(arg)
    arg > #{NUMBER_OF_CALLS} ? arg : x(arg + 1)
  end

  x(0)
RUBY

# TCO = false
begin
  RubyVM::InstructionSequence.compile_option = {
    tailcall_optimization: false,
    trace_instruction: true
  }

  RubyVM::InstructionSequence.new(method_string).eval
  STDOUT.puts "finished (tailcall_optimization: false, num_of_calls: #{NUMBER_OF_CALLS})"
rescue SystemStackError
  STDOUT.puts "Stack level too deep (tailcall_optimization: false, num_of_calls: #{NUMBER_OF_CALLS})"
end


# TCO = true
RubyVM::InstructionSequence.compile_option = {
  tailcall_optimization: true,
  trace_instruction: false
}

RubyVM::InstructionSequence.new(method_string).eval
STDOUT.puts "finished (tailcall_optimization: true, num_of_calls: #{NUMBER_OF_CALLS})"
