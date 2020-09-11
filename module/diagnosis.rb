module Diagnosis

  def diagnosis(result)
    list = []
    position_numbers = result.keys
    position_numbers.each do |num|
      list <<
      case num
      when 1
        "GOLEIRO"
      when 2
        "FIXO"
      when 3
        "ALA"
      when 4
        "PIVO"
      else
        "不正な値が検出されました。診断エラー！！"
      end
    end
    list
  end
end