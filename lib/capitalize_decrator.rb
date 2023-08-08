require_relative 'base_decrator'

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
