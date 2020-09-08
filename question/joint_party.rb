require "pry"
require "./module/question_module"

class JointParty
  #モジュールをinclude
  include Judge

  JOINT_PARTY_QUESTIONS = {:"とりあえずイケイケ" => [3,4], :"タイプの子がいれば１対１に持ち込みがち" => [3,4], :"もちろん夜のゴールまで狙っている" => [3,4], :"夜のアシストに回ることもできる" => [3],
              :"適度に満遍なく話すタイプだ" => [1,2], :"タイプではないが空気を読んで会話に入れていない子に話しかけてあげるタイプだ" => [1,2],
              :"意図的に盛り上げ役に徹することができる" => 2, :"注文役に回ることが多い" => [1,2], :"どちらかというと合コンはでは消極的な方だ" => 1}.freeze

  JOINT_PARTY_TEXT = <<-EOS
  ************************************************************************
  まずは４対４の合コンの状況を思い出してください。                             
  経験がない方は想像で自分だったらこうするだろうなー..と想像しながらお答えください。
  ***********************************************************************
  EOS

  def initialize(title: "合コン", **params)
    @title = title
    @questions = params
  end

  def questions_start
    puts JOINT_PARTY_TEXT
    list = []
    count = 0
    all_answer = [1,2,3]
    @questions.each do |key, value|
      puts "#{key}?"
      puts "「Yes」→１、「No」→２、「どちらでもない」→３"
      answer = gets.chomp.to_i
      puts "__________________________________________"
      

      count += 1
      if all_answer.all?{ |a| a != answer} && count < 2
        puts '「１」、「２」、「３」のいずれかで回答してください。'
        redo
      elsif all_answer.all?{|a| a != answer} && count >= 2
        return 
      end
      count = 0
      list << value if answer == 1
    end
    puts "これで合コンに関する質問は終わりです。"
    list
  end
end




