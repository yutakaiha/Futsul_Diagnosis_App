require "pry"

class JointParty
  def initialize(**params)
    @questions = params
  end

  def questions_start
    list = []
    count = 0
    all_answer = [1,2,3]
    @questions.each do |key, value|
      puts "#{key}?"
      puts "「Yes」→１、「No」→２、「どちらでもない」→３"
      answer = gets.chomp.to_i
      puts "__________________________________________"

      count += 1
      if all_answer.any?{|a| a != answer} && count < 2
        puts '「１」、「２」、「３」のいずれかで回答してください。'
        redo
      elsif all_answer.any?{|a| a != answer} && count >= 2
        return "値が不正です。もう一度最初から回答してください"
      end
      count = 0
      list << value if answer == 1
    end
    list
  end
end

QUESTIONS = {:"とりあえずイケイケ" => [3,4], :"タイプの子がいれば１対１に持ち込みがち" => [3,4], :"もちろん夜のゴールまで狙っている" => [3,4], :"夜のアシストに回ることもできる" => [3],
              :"適度に満遍なく話すタイプだ" => [1,2], :"タイプではないが空気を読んで会話に入れていない子に話しかけてあげるタイプだ" => [1,2],
              :"意図的に盛り上げ役に徹することができる" => 2, :"注文役に回ることが多い" => [1,2], :"どちらかというと合コンはでは消極的な方だ" => 1}

