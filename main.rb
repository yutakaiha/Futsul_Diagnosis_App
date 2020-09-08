require "pry"
require_relative "player"
require_relative "position/goleiro"
require_relative "position/fixo"
require_relative "position/ala"
require_relative "position/pivo"
require "./question/joint_party"
require "./question/physical.rb"
require "./question/personality_and_skill.rb"

puts <<-EOS
______________________________________________________________________
今からフットサル適性診断を開始します。
3種類の質問に分けて質問していきます。
お気軽に答えてください。
質問の回答は方法は「Yes」→１、「No」→２、「どちらでもない」→３でお答えください。
______________________________________________________________________
EOS

#3種類の質問の結果を格納する配列を定義
final_results = []

jointpaty = JointParty.new(JointParty::JOINT_PARTY_QUESTIONS)
joint_party_result = jointpaty.questions_start
jointpaty.judge(joint_party_result, jointpaty, final_results)

# judge_result =
#   catch :done do
#     if joint_party_result.nil?
#       puts <<-EOS
#       不正の値のため回答を受け付けられませんでした。
#       最初から診断を行いますか？
#       「Yes」→１、「No」→２
#       EOS
#       select_continue_or_stop = gets.chomp.to_i
#       if select_continue_or_stop == 1
#         puts "でわ、最初の質問からです"
#         joint_party_result = jointpaty.questions_start
#         throw :done , "エラーが発生しました。強制終了します。" if joint_party_result.nil?
#         final_results << joint_party_result
#       elsif select_continue_or_stop == 2
#         puts "またの利用をお待ちしております"
#       else
#         puts "不正な値です。診断を中止します。またのご利用をお待ちしております。"
#       end
#     else
#       final_results << joint_party_result
#     end
#   end
# puts judge_result

p final_results

if final_results.any?
  physical = Physical.new(Physical::PHYSICAL_QUESTIONS)
  physical_result = physical.questions_start
  physical.judge(physical_result, physical, final_results)
end

p final_results





