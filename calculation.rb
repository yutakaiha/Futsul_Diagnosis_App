class Calculation
  
  #グループ分けしてハッシュ形式に変換
  def self.grouping(final_result)
    final_result.group_by(&:itself).map{|key, value| [key, value.count]}.to_h
  end

  def self.rate_calculation(grouping_result, final_result_length)
    grouping_result.map{|key, value| [key, (value.to_f / final_result_length * 100).round(2)]}
  end
end