
# module LoopQuestion
#   include Judge
#   include Question
#   def loop_each_question(calucu_results, special_addition_list)
#     class_list = [JointParty, Physical, PersonalSkill]
#     count = 1
#     class_list.each do |each_class|
#       if count == 1
#         obj = each_class.new
#         obj_result = obj.questions_start
#         obj.judge(obj_result, obj, calucu_results, special_addition_list)
#       elsif count > 1 && count <= class_list.length
#         # if calucu_results.any?
#           obj = each_class.new
#           obj_result = obj.questions_start
#           obj.judge(obj_result, obj, calucu_results, special_addition_list)
#         # end
#       end
#       count += 1
#     end
#   end

#   module_function :loop_each_question
# end