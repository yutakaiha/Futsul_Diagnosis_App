require "pry"
require "./module/judge_module"
require "./module/question_module"

class PersonalSkill
  #モジュールをinclude
  include Judge
  include Question
  attr_accessor :title, :questions, :text

  PERSONALITY_QUESTIONS = [["ボールに対する恐怖はないか", [1]], ["状況判断は得意なほうだ", [1,4]], ["コーチングは得意なほうだ", [1]], ["人のカバーをするのが得意なほうだ", [1,2,3]],
                          ["先を読んで行動するのが得意だ", [2]], ["俯瞰的に物事を捉えるのが得意だ", [2]], ["キック精度と言えば俺だろ", [2]], ["キープ力には自信しかない", [2,4]],
                          ["責任感の塊りだ", [3]], ["苦労はいとわない", [3]], ["マルチプレイヤーの自負がある", [3]], ["ドリブルには絶対的な自信がある", [3]], ["ゴールを決めてなんぼでしょ？", [2]],
                          ["時には強引さも必要だ", [2]], ["野生的・本能的と自分で思う", [4]]].map(&:freeze).freeze

  PERSONALITY_SKILL_TEXT = <<-EOS
  *******************************************************************
  最終質問は性格や実スキルを合わせた問題です。                                  
  あまり考えすぎずに直感的に答えていきましょう。                                
  *******************************************************************
  ⬇️　　　　　⬇️　　　　　⬇️　　　　　⬇️　　　　　⬇️　　　　　⬇️　　　　　⬇️
  
  EOS

  def initialize(title: "性格、スキル")
    @title = title
    @questions = PERSONALITY_QUESTIONS
    @text = PERSONALITY_SKILL_TEXT
  end
end