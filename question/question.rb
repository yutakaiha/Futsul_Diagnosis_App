require "./module/loop_question"
class Question
  include LoopQuestion
  attr_reader :title, :questions, :text
end 