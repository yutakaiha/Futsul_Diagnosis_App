class Calculation
  SPECIAL_POINT = 1.5

  def self.calcu_final_result(final_result, special_addition_list)
    grouping_final_result = grouping(final_result)
    rate_result = rate_calculation(grouping_final_result, final_result.length)
    grouping_special_addition_list = grouping(special_addition_list)
    addition_calculation_result = addition_calculation(grouping_special_addition_list)
    result_after_addition = alternative_merge(rate_result, addition_calculation_result)
    max_result = confirm_max(result_after_addition)
  end

  #グループ分けしてハッシュ形式に変換
  def self.grouping(result)
    result.group_by(&:itself).map{|key, value| [key, value.count]}.to_h
  end

  def self.rate_calculation(grouping_final_result, final_result_length)
    grouping_final_result.map{|key, value| [key, (value.to_f / final_result_length * 100).round(2)]}.to_h
  end

  def self.addition_calculation(list)
    list.map{|key, value| [key, value * SPECIAL_POINT]}.to_h
  end

  def self.alternative_merge(rate_result, addition_calculation_result)
    rate_result.merge(addition_calculation_result) do |key, old_value, new_value|
      old_value + new_value
    end
  end

  def self.confirm_max(result_after_addition)
    max_v = result_after_addition.values.max
    result_after_addition.select{|key, value| value == max_v}
  end

end