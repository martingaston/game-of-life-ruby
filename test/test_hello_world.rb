require "minitest/autorun"
require "hello_world"

class TestHelloWorld < Minitest::Test
  def test_setup
    assert_equal(1+1, 2)
  end

  def test_says_hello_world
    assert_equal(HelloWorld.new.hello, "Hello World!")
  end
end
