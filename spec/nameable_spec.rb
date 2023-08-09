require "nameable"

describe Nameable do
    describe "Correct name" do
    it("It should raise an error, not miplementedyet") do
        nameable = Nameable.new
        expect{nameable.correct_name}.to raise_error(NotImplementedError)
        end
    end
end