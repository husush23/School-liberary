require_relative "base_decorator"

class Capitalize_decorator < Base_decorator
    def correct_name
        name = @nameable.correct_name
        name.capitalize
    end
end
