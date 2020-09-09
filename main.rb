require "pry"
require_relative "player"
require_relative "position/goleiro"
require_relative "position/fixo"
require_relative "position/ala"
require_relative "position/pivo"
require "./question/joint_party"
require "./question/physical"
require "./question/personal_skill"
require_relative "calculation"

puts <<-EOS
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

#合コンに関する質問による診断結果
jointpaty = JointParty.new(JointParty::JOINT_PARTY_QUESTIONS)
joint_party_result = jointpaty.questions_start
jointpaty.judge(joint_party_result, jointpaty, calucu_results, special_addition_list)

puts "\n"
#フィジカルに関する質問による診断結果
if calucu_results .any?
  physical = Physical.new(Physical::PHYSICAL_QUESTIONS)
  physical_result = physical.questions_start
  physical.judge(physical_result, physical, calucu_results, special_addition_list)
end

#性格や実スキルに関する質問による診断結果
if calucu_results .any?
  personal_skill = PersonalSkill.new(PersonalSkill::PERSONALITY_QUESTIONS)
  personal_skill_result = personal_skill.questions_start
  personal_skill.judge(personal_skill_result, personal_skill, calucu_results, special_addition_list)
end


#特別加算リスト（）
special_addition_list.sort!

#通常の最終集計結果
final_result = calucu_results.sort
final_result_length = final_result.length

#最終集計結果からポジション項目番号別の割合を算出する(グループごとにハッシュ化されている)
grouping_final_result = Calculation.grouping(final_result)
rate_result = Calculation.rate_calculation(grouping_final_result, final_result_length)

#特別加算リストをグループ化（ハッシュ形式)
grouping_special_addition_list = Calculation.grouping(special_addition_list)
addition_calculation_result = Calculation.addition_calculation(grouping_special_addition_list)


p rate_result
p "特別加算", addition_calculation_result


