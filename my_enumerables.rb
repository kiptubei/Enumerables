module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    size.times do |item|
      yield(self[item])
    end
  end
end
