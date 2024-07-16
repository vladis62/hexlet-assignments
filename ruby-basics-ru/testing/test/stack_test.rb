# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def setup
    @stack = Stack.new
  end

  def test_push
    @stack.push!(1)
    @stack.push!(2)
    assert { @stack.to_a == [1, 2] }
  end

  def test_pop
    @stack.push!(1)
    @stack.push!(2)
    element = @stack.pop!
    assert { element == 2 }
    assert { @stack.to_a == [1] }
  end

  def test_clear
    @stack.push!(1)
    @stack.push!(2)
    @stack.clear!
    assert { @stack.empty? }
  end

  def test_empty
    assert { @stack.empty? }
    @stack.push!(1)
    refute { @stack.empty? }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
