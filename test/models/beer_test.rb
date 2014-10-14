require 'test_helper'

class BeerTest < ActiveSupport::TestCase
  def test_invalid_without_name
    b = Beer.new
    b.name = "lel"
    assert !b.valid?, "Name is not being validated"
  end
end
