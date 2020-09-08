require "pry"
require_relative "player"
require_relative "position/goleiro"
require_relative "position/fixo"
require_relative "position/ala"
require_relative "position/pivo"
require "./question/joint_party"


puts <<-EOS
______________________________________________________________________
今からフットサル適性診断を開始します。
3種類の質問に分けて質問していきます。
お気軽に答えてください。
質問の回答は方法は「Yes」→１、「No」→２、「どちらでもない」→３でお答えください。
まずは４対４の合コンの状況を思い出してください。
経験がない方は想像で自分だったらこうするだろうなー...と想像しながらお答えください。
______________________________________________________________________
EOS

jointpaty = JointParty.new(QUESTIONS)
result = jointpaty.questions_start
puts result 






