module Question
  def questions_start
    puts self.text
    list = []
    count = 0
    all_answer = [1, 2, 3]
    question_number = question_number(self.text)
    @questions.each.with_index(question_number) do |question, i|
      puts "Q#{i} #{question[0]}?"
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
      list << question[1] if answer == 1
    end
    puts <<~EOS

    お疲れ様です。これで「#{self.title}」に関する質問は終了です。

    EOS
    list
  end

  def question_number(text)
    case text
    when JointParty::JOINT_PARTY_TEXT
      1
    when Physical::PHYSICAL_TEXT
      10
    when PersonalSkill::PERSONALITY_SKILL_TEXT
      14
    end
  end
end