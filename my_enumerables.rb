# rubocop:disable Metrics/ModuleLength
module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    size.times { |item| yield(self[item]) }
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    arr = to_a
    new_ar = []
    size.times { |item| new_ar << yield(arr[item], item) }
    new_ar
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    size.times do |_item|
      new_ar = []
      my_each { |item| new_ar << item if yield(item) }
      return new_ar
    end
  end

  def my_all?(arg = nil)
    result = true
    case arg
    when nil
      return to_enum(:my_all) unless block_given?

      size.times do |item|
        result = yield(self[item])
        return result if result == false
      end
    else
      size.times do |item|
        result = self[item] == arg
        return result if result == false
      end
    end
    result
  end

  def my_any?(arg = nil)
    result = false
    case arg
    when nil
      return to_enum(:my_any) unless block_given?

      size.times do |item|
        result = yield(self[item])
        return result if result == true
      end
    else
      size.times do |item|
        result = self[item] == arg
        return result if result == true
      end
    end
    result
  end

  def my_none?(arg = nil)
    result = true
    case arg
    when nil
      return to_enum(:my_none) unless block_given?

      size.times do |item|
        result = yield(self[item])
        return false if result == true
      end
    else
      size.times do |item|
        result = self[item] == arg
        return false if result == true
      end
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

  def my_inject(num = nil, symb = nil)
    arr = to_a
    total = arr[0]
    case num
    when nil
      return to_enum(:my_inject) unless block_given?

      (size - 1).times { |item| total = yield(total, arr[item + 1]) }
    when Integer
      total = num
      size.times do |item|
        case symb
        when nil
          block_given? ? total = yield(total, arr[item]) : total += arr[item]
        else
          total = total.send symb, arr[item]
        end
      end
    else
      (size - 1).times { |item| total = total.send num, arr[item + 1] }
    end
    total
  end

  def my_map(proc_call = nil)
    new_ar = []
    case proc_call
    when nil
      return to_enum(:my_map) unless block_given?

      size.times { |item| new_ar << yield(self[item]) }
    else
      size.times { |item| new_ar << proc_call.call(self[item]) }
    end
    new_ar
  end
end

def multiply_els(array)
  array.my_inject { |new_st, friend| new_st * friend }
end

# rubocop:enable Metrics/ModuleLength
