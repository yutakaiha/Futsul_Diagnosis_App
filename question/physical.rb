require "pry"
require "./module/question_module"

class Physical
  #モジュールをinclude
  include Judge

  PHYSICAL_QUESTIONS = {:"フィジカルは強いほうだ" => [2,4], :"細かな動きが得意だ" => [3],
                        :"体力には自信がある" => [3], :"動体視力には自信あり" => [1] }.freeze

  PHYSICAL_TEXT = <<-EOS
  *****************************************************************
  次にフィジカル的な質問をしていきます。
  先程と同じように回答方法は下記の通りです。
  「Yes」→１、「No」→２、「どちらでもない」→３でお答えください。
  でわ、さっそくまいりましょう。
  *****************************************************************
  ⬇️　　　　　⬇️　　　　　⬇️　　　　　⬇️　　　　　⬇️　　　　　⬇️　　　　　⬇️
  EOS
  
  def initialize(title: "フィジカル", **params)
    @title = title
    @questions = params
  end

  def questions_start
    puts PHYSICAL_TEXT
    list = []
    count = 0
    all_answer = [1,2,3]
    @questions.each.with_index(10) do |(key, value), i|
      puts "Q#{i} #{key}?"
      puts "Yes => １、No => ２、どちらでもない => ３"
      answer = gets.chomp.to_i
      puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
      count += 1
      if all_answer.all?{|a| a != answer} && count < 2
        puts '「１」、「２」、「３」のいずれかで回答してください。'
        redo
      elsif all_answer.all?{|a| a != answer} && count >= 2
        return
      end
      count = 0
      list << value if answer == 1
    end
    puts "お疲れ様です。これでフィジカル面の質問は終了です。"
    list
  end
end

