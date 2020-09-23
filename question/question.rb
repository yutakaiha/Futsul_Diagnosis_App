# require "./module/act_question_module"
require "./module/loop_question"
class Question
  include LoopQuestion
  attr_reader :title, :questions, :text

  # def start_question(calucu_results, special_addition_list)
  #   obj_result = self.questions_start
  #   self.add_list(obj_result, calucu_results, special_addition_list)
  # end

  # def add_list(obj_result, calucu_results, special_addition_list)
  #   calucu_results << obj_result
  #   special_addition_list << obj_result.select{ |e| e.length == 1 }
  #   calucu_results.flatten!
  #   special_addition_list.flatten!
  # end
end 