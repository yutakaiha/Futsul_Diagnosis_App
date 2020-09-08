module Judge
  def judge(each_result, each_object, final_results)
    judge_result =
    catch :done do
      if each_result.nil?
        puts <<-EOS
        不正の値のため回答を受け付けられませんでした。
        #{@title}に関する質問から診断を再開しますか？
        「Yes（再開）」→１、「No(診断終了)」→２
        EOS
        select_continue_or_stop = gets.chomp.to_i
        if select_continue_or_stop == 1
          puts "でわ、#{@title}の最初の質問からです"
          each_result = each_object.questions_start
          throw :done , "エラーが発生しました。強制終了します。" if each_result.nil?
          final_results << each_result
          final_results.flatten!
        elsif select_continue_or_stop == 2
          puts "またの利用をお待ちしております"
        else
          puts "不正な値です。診断を中止します。またのご利用をお待ちしております。"
        end
      else
        final_results << each_result
        final_results.flatten!
      end
    end
    puts judge_result
  end
end