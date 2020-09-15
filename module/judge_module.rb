module Judge
  def judge(each_result, each_object, calucu_results, special_addition_list)
    if each_result.nil?
      puts <<~EOS
      不正の値のため回答を受け付けられませんでした。
      #{each_object.title}に関する質問から診断を再開しますか？
      「Yes（再開）」→１、「No(診断終了)」→２
      EOS
      select_continue_or_stop = gets.chomp.to_i
      if select_continue_or_stop == 1
        puts <<~EOS
        ________________________________________________________________
        でわ、#{each_object.title}の最初の質問からです

        EOS
        each_result = questions_start
        if each_result.nil?
          puts "エラーが発生しました。強制終了します。"
          exit
        end
        add_process(each_result, calucu_results, special_addition_list)
      elsif select_continue_or_stop == 2
        puts "またの利用をお待ちしております"
        exit
      else
        puts "不正な値です。診断を中止します。またのご利用をお待ちしております。"
        exit
      end
    else
      add_process(each_result, calucu_results, special_addition_list)
    end
  end

  def add_process(each_result, calucu_results, special_addition_list)
    calucu_results << each_result
    special_addition_list << each_result.select{ |e| e.length == 1 }
    calucu_results.flatten!
    special_addition_list.flatten!
  end
end