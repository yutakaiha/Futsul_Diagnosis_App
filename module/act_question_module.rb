module ActQuestion

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
      puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
      count += 1
      
      if all_answer.all?{|a| a != answer} && count < 2
        puts <<~EOS
        回答内容が不正です。「１」、「２」、「３」のいずれかで回答してください❗️
        EOS
        redo
      elsif all_answer.all?{|a| a != answer} && count >= 2
        puts <<~EOS
        回答内容が不正により正確な診断ができませんでした❗️
        再度現在の質問から診断を再開しますか❓
        「Yes（再開）」→１、「No(診断終了)」→２
        EOS
        select_continue_or_stop = gets.chomp.to_i
        if select_continue_or_stop == 1
          puts <<~EOS
          ________________________________________________________________
          でわ、続きの質問からです❗️

          EOS
          redo
        elsif select_continue_or_stop == 2
          puts <<~EOS

          -----------------------------NOTICE----------------------------
          ご利用ありがとうございました🤗またの利用をお待ちしております❗️
          EOS
          exit
        else
          puts <<~EOS

          -----------------------------WARNING----------------------------
          不正な値が入力されました❗️
          診断を中止します❗️またのご利用をお待ちしております🤗
          EOS
          exit
        end
      end
      count = 0
      list << question[1] if answer == 1
    end
    puts "お疲れ様です。これで「#{self.title}」に関する質問は終了です。"
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