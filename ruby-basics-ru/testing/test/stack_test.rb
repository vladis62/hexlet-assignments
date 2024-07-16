# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def test_push!
    stack = Stack.new

    stack.push! 1
    assert_equal stack.to_a.length, 1

    stack.push! 2
    assert_equal stack.to_a.length, 2

    assert_equal stack.pop!, 2
  end

  def test_pop!
    stack = Stack.new

    stack.push! 2
    assert_equal stack.pop!, 2

    stack.push! 1
    assert_equal stack.pop!, 1
  end

  def test_clear!
    stack = Stack.new

    stack.push! 1
    stack.push! 2

    stack.clear!

    assert stack.empty? == true
  end

  def test_empty!
    stack = Stack.new

    stack.push! 1
    stack.push! 2

    stack.clear!

    assert stack.empty? == true
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
