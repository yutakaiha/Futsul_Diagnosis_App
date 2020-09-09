module Judge
  def judge(each_result, each_object, calucu_results, special_addition_list)
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
          if each_result.nil?
            puts "エラーが発生しました。強制終了します。"
            throw :done
          end
          calucu_results << each_result
          special_addition_list << each_result.select{ |e| e.length == 1 }
          calucu_results.flatten!
          special_addition_list.flatten!
        elsif select_continue_or_stop == 2
          puts "またの利用をお待ちしております"
        else
          puts "不正な値です。診断を中止します。またのご利用をお待ちしております。"
        end
      else
        calucu_results << each_result
        special_addition_list << each_result.select{ |e| e.length == 1 }
        calucu_results.flatten!
        special_addition_list.flatten!
      end
    end
  end
end