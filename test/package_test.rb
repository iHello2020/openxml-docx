require 'test_helper'

class PackageTest < Test::Unit::TestCase
  attr_reader :package

  context "when starting a new package" do
    setup do
      @package = Rocx::Package.new
    end

    should "create the core part" do
      assert_is_a Rocx::Parts::Core, package.core
    end
  end

end