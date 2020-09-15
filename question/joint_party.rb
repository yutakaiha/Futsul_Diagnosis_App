require "pry"
require "./module/question_module"

class JointParty
  #モジュールをinclude
  include Judge

  # JOINT_PARTY_QUESTIONS = {:"合コンはとりあえずノリでしょ♪" => [3,4], :"タイプの子がいれば即ロックオンして１対１へ" => [3,4], :"もちろん夜のゴールまで狙うでしょ？普通？" => [3,4], :"夜のアシストに回ることもできちゃんだな〜" => [3],
  #             :"適度に満遍なく話すタイプだ" => [1,2], :"タイプではない子に対しても空気を読んで会話に入れていない子がいれば話しかけてあげるタイプだ" => [1,2],
  #             :"意図的に盛り上げ役に徹することができる" => [2], :"注文役に回ることが多い" => [1,2], :"どちらかというと合コンはでは消極的な方だ" => [1]}.freeze
  
  JOINT_PARTY_QUESTIONS = [["合コンはとりあえずノリでしょ♪", [3,4]], ["タイプの子がいれば即ロックオンして１対１へ", [3,4]], ["もちろん夜のゴールまで狙うでしょ？普通？", [3,4]], ["夜のアシストに回ることもできちゃんだな〜", [3]],
                          ["適度に満遍なく話すタイプだ", [1,2]], ["タイプではない子に対しても空気を読んで会話に入れていない子がいれば話しかけてあげるタイプだ", [1,2]],
                          ["意図的に盛り上げ役に徹することができる", [2]], ["注文役に回ることが多い", [1,2]], ["どちらかというと合コンはでは消極的な方だ", [1]]].map(&:freeze).freeze

  JOINT_PARTY_TEXT = <<-EOS
  *******************************************************************
  まずは４対４の合コンの状況を思い出してください。                             
  合コンの経験がない方は上記の状況を想像しながらお答えください。
  *******************************************************************
  ⬇️　　　　　⬇️　　　　　⬇️　　　　　⬇️　　　　　⬇️　　　　　⬇️　　　　　⬇️

  EOS

  def initialize(title: "合コン")
    @title = title
    @questions = JOINT_PARTY_QUESTIONS
  end

  def questions_start
    puts JOINT_PARTY_TEXT
    list = []
    count = 0
    all_answer = [1,2,3]
    @questions.each.with_index(1) do |question, i|
      puts "Q#{i} #{question[0]}?"
      puts "Yes => １、No => ２、どちらでもない => ３"
      answer = gets.chomp.to_i
      puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"

      count += 1
      if all_answer.all?{ |a| a != answer} && count < 2
        puts '「１」、「２」、「３」のいずれかで回答してください。'
        redo
      elsif all_answer.all?{|a| a != answer} && count >= 2
        return 
      end
      count = 0
      list << question[1] if answer == 1
    end
    puts "これで合コンに関する質問は終わりです。"
    list
  end
end




