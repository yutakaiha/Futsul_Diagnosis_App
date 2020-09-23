require_relative "act_question_module"

module LoopQuestion
  include ActQuestion

  def loop_each_question(calucu_results, special_addition_list)
    class_list = [JointParty, Physical, PersonalSkill]
    question_start_num = 1
    class_list.each do |each_class|
      obj = each_class.new
      obj_result = obj.questions_start(question_start_num)
      obj.add_list(obj_result, calucu_results, special_addition_list)
      question_start_num += obj.questions.length
    end
  end

  def add_list(obj_result, calucu_results, special_addition_list)
    calucu_results << obj_result
    special_addition_list << obj_result.select{ |e| e.length == 1 }
    calucu_results.flatten!
    special_addition_list.flatten!
  end

  module_function :loop_each_question
end