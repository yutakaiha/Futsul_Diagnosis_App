require "pry"
require_relative "player"
require "./question/joint_party"
require "./question/physical"
require "./question/personal_skill"
require_relative "calculation"
require "./module/loop_question"

puts <<~EOS

---------------------------------------------
|                                            |
|               フットサル適性診断           |
|                                            |
---------------------------------------------

--------------------START-------------------- 

--------------------回答方法--------------------
今からフットサル適性診断を開始します。
3種類の質問に分けて質問していきます。
お気軽に答えてください。
質問の回答は方法は下記の通りです
「Yes」→１、「No」→２、「どちらでもない」→３
-----------------------------------------------
⬇️　　　⬇️　　　⬇️　　　⬇️　　　⬇️　　　⬇️　　　⬇️　　　

EOS

calucu_results = []
special_addition_list = []

# joint_party = JointParty.new
# joint_party.start_question(calucu_results, special_addition_list)

# physical = Physical.new
# physical.start_question(calucu_results, special_addition_list)

# personal_skill = PersonalSkill.new
# personal_skill.start_question(calucu_results, special_addition_list)


LoopQuestion.loop_each_question(calucu_results, special_addition_list)

special_addition_list.sort!
final_result = calucu_results.sort
# final_result_length = final_result.length
p final_result
p special_addition_list

if final_result.any?
  max_result = Calculation.calcu_final_result(final_result, special_addition_list)
  Player.fit_position(max_result)
else
  puts <<~EOS

  ------------------------診断エラー---------------------------
  回答いただいた内容では正確な診断ができませんので、診断を終了します❗️
  ※少なくとも１回は回答番号「１」を選択する必要があります❗️
  ------------------------------------------------------------

  EOS
end