require "pry"
require_relative "player"
require "./question/joint_party"
require "./question/physical"
require "./question/personal_skill"
require "./module/loop_question"
require "./module/calculation_module"

puts <<~EOS
__________________________________________________________________________
今からフットサル適性診断を開始します。
3種類の質問に分けて質問していきます。
お気軽に答えてください。
質問の回答は方法は「Yes」→１、「No」→２、「どちらでもない」→３でお答えください。
__________________________________________________________________________
⬇️　　　⬇️　　　⬇️　　　⬇️　　　⬇️　　　⬇️　　　⬇️　　　⬇️　　　⬇️　　　⬇️　　　⬇️

EOS

calucu_results = []
special_addition_list = []

LoopQuestion.loop_each_question(calucu_results, special_addition_list)

special_addition_list.sort!
final_result = calucu_results.sort
final_result_length = final_result.length

unless final_result.nil?
  max_result = Calculation.calcu_final_result(final_result, final_result_length, special_addition_list)
  player = Player.new
  player.fit_position(max_result)
end