require "pry"
require_relative "player"
require "./question/joint_party"
require "./question/physical"
require "./question/personal_skill"
require_relative "calculation"
require "./module/loop_question"

puts <<~EOS
__________________________________________________________________________
今からフットサル適性診断を開始します。
3種類の質問に分けて質問していきます。
お気軽に答えてください。
質問の回答は方法は「Yes」→１、「No」→２、「どちらでもない」→３でお答えください。
__________________________________________________________________________
⬇️　　　⬇️　　　⬇️　　　⬇️　　　⬇️　　　⬇️　　　⬇️　　　⬇️　　　⬇️　　　⬇️　　　⬇️

EOS

#3種類の質問の結果を格納する配列を定義
calucu_results = []

#該当するポジション一つにしか当てはまらない回答結果（そのポジション固有の質問に該当した場合）の場合、最後の集計結果の際に特別加算する
# つまり、「はい」を洗濯した結果のvalueのlengthが１になるものだけを格納していく。
special_addition_list = []

LoopQuestion.loop_each_question(calucu_results, special_addition_list)

#特別加算リスト（）
special_addition_list.sort!
#通常の最終集計結果
final_result = calucu_results.sort
final_result_length = final_result.length


unless final_result.nil?
  #最終集計結果からポジション項目番号別の割合を算出する(グループごとにハッシュ化されている)
  grouping_final_result = Calculation.grouping(final_result)
  rate_result = Calculation.rate_calculation(grouping_final_result, final_result_length)
  
  #特別加算リストをグループ化（ハッシュ形式)
  grouping_special_addition_list = Calculation.grouping(special_addition_list)
  addition_calculation_result = Calculation.addition_calculation(grouping_special_addition_list)
  
  
  #算出した項目ごとの割合に、特別加算を項目ごとに足す（merge）
  #この段階では割合は上位を算出する一つの基準にすぎないので、割合＝数値として捉え、そのまま特別加算点数を加える
  result_after_addition = Calculation.alternative_merge(rate_result, addition_calculation_result)
  
  ##valueが最大のものを抽出する
  max_result = Calculation.confirm_max(result_after_addition)
  
  #プレイヤーに診断結果を提示する。
  player = Player.new
  player.fit_position(max_result)
end

