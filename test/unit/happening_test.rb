require 'test_helper'

class HappeningTest < ActiveSupport::TestCase
	test "that a happening requires content" do
		happening = Happening.new
		assert !happening.save
		assert !happening.errors[:content].empty?
	end

	test "that a happening's content is at least 2 letters" do 
		happening = Happening.new
		happening.content = "H"
		assert !happening.save
		assert !happening.errors[:content].empty?
	end

	test "that a happening has a user id" do 
		happening = Happening.new
		happening.content = "Hello"
		assert !happening.save
		assert !happening.errors[:user_id].empty?
	end

end
