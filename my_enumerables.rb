module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    size.times do |item|
      yield(self[item])
    end
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    size.times do |item|
      yield(self[item], item)
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    size.times do |_item|
      new_ar = []
      my_each do |item|
        new_ar << item if yield(item)
      end
      return new_ar
    end
  end

  def my_all?
    return to_enum(:my_all) unless block_given?

    result = true
    size.times do |item|
      result = yield(self[item])
      return result if result == false
    end
    result
  end

  def my_any?
    return to_enum(:my_any) unless block_given?

    result = false
    size.times do |item|
      result = yield(self[item])
      return result if result == true
    end
    result
  end

  def my_none?
    return to_enum(:my_none) unless block_given?

    result = true
    size.times do |item|
      result = yield(self[item])
      return false if result == true
    end
    true
  end

  def my_count(items = 0)
    total = 0
    size.times do |item|
      case items
      when 0
        return size
      when self[item]
        total += 1
      end
    end
    total
  end

  def my_inject
    return to_enum(:my_inject) unless block_given?

    total = self[0]
    (size - 1).times do |item|
      total = yield(total, self[item + 1])
    end
    total
  end

  def my_map(proc_call = nil)
    new_ar = []
    case proc_call

    when nil
      return to_enum(:my_map) unless block_given?

      size.times do |item|
        new_ar << yield(self[item])
      end
    else

      size.times do |item|
        new_ar << proc_call.call(self[item])
      end
    end

    new_ar
  end
end

def multiply_els(array)
  array.my_inject do |new_st, friend|
    new_st * friend
  end
end
