require_relative 'base_decrator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    trimmed_name = @nameable.correct_name.strip
    trimmed_name.slice(0, 10)
  end
end
