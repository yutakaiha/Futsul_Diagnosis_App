require "pry"
require "./module/judge_module"
require "./module/question_module"

class Physical
  #モジュールをinclude
  include Judge
  include Question
  attr_accessor :title, :questions, :text

  PHYSICAL_QUESTIONS = [["フィジカルは強いほうだ", [2,4]],
                        ["細かな動きが得意だ", [3]],
                        ["体力には自信がある", [3]],
                        ["動体視力には自信あり", [1]]].map(&:freeze).freeze

  PHYSICAL_TEXT = <<~EOS
  **************************************************************
  次にフィジカル的な質問をしていきます。
  先程と同じように回答方法は下記の通りです。
  「Yes」→１、「No」→２、「どちらでもない」→３でお答えください。
  でわ、さっそくまいりましょう。
  **************************************************************
  ⬇️　　　　　⬇️　　　　　⬇️　　　　　⬇️　　　　　⬇️　　　　　⬇️
  
  EOS
  
  def initialize(title: "フィジカル")
    @title = title
    @questions = PHYSICAL_QUESTIONS
    @text = PHYSICAL_TEXT
  end
end

