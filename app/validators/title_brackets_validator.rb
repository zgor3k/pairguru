class TitleBracketsValidator < ActiveModel::Validator
  def validate(record)
    if empty_brackets?(record.title)
      record.errors.add(:title, "brackets are empty")
    end

    if not_closed_brackets?(record.title)
      record.errors.add(:title, "brackets are not closed")
    end
  end

  private

  def empty_brackets?(title)
    empty_brackets = %w[() [] {}]
    empty_brackets.any? { |bracket| title.include?(bracket) }
  end

  def not_closed_brackets?(title)
    [].tap do |temp|
      title.each_char do |char|
        next unless char.in?(%w[( ) { } [ ]])

        temp << char if array_brackets.has_key?(char)

        if array_brackets.has_value?(char)
          return true if temp.empty?

          temp.pop
        end
      end
    end.any?
  end

  def array_brackets
    {
      "(" => ")",
      "[" => "]",
      "{" => "}"
    }
  end
end
