require "./module/diagnosis"
class Player
  include Diagnosis
  attr_accessor :position

  def initialize(position: "")
    @position = position
  end

  def fit_position(result)
    @position = self.diagnosis(result)
    self.position_explanation
  end

  def position_explanation
    if @position .size >= 2
      puts "あなたに適性と思われるポジションが複数存在しました。"
      @position.each.with_index(1) do |position, i|
        puts "#{i}つ目は#{position}です"
      end
      puts <<~EOS
      このことにお気づきでしたか？
      あなたはマルチな才能をお持ちなんです。基本的にはどのポジションをしてもそつなくこなすことができるでしょう。
      フットサルは頻繁にポジション交代が可能なスポーツです。試合でのあらゆる局面であなたのスキルを発揮できれば、
      チームに絶大な貢献をもたらすことでしょう。
      また、「一つのポジションに絞りたいよ」って方は、今回の診断結果を参考ににして、実際にプレーしてみて自分が好きなポジションを選択してみてください。
      ポジション別の特徴は以下を参考にしてみてください。
      EOS
    else
      puts <<~EOS
      あなたの適性ポジションは#{@position}です。
      現時点で自身のポジションが#{@position}なら、それは天性と言っても過言ではありません。
      一つのポジションを極め、圧倒的なスペシャリストを目指しましょう。
      あなたの専門的なスキルがここぞというタイミングで発揮されれば、チームのピンチを何度も救うことになるでしょう。
      いや、私は#{@position}なんてやったことないよ〜という人でも、自身の知られざる才能を開花させる
      チャンスと思って、一度#{@position}にチャレンジしてみてはいかがでしょうか？
      ※各ポジション別の説明は下記を参考にしてみてください。
      EOS
    end
    puts <<~EOS
    ⬇️　　　　　⬇️　　　　　⬇️　　　　　⬇️　　　　　⬇️　　　　　⬇️　　　　　⬇️　　　　　⬇️　　　　　⬇️　　　　　⬇️　　　　　⬇️
    
    ■各ポジションの特徴一覧
    ******************************************************************************************************************************
    ★GOLEIRO(ゴレイロ)
    ゴレイロはサッカーでいうとゴールキーパーのことでゴールを守るのが1番の仕事。
    フットサルは至近距離からのシュートが多いので、ボールにビビらないメンタルも必要です。 
    また,DFの最終ラインの裏のボールのケア（カバーリング）や下からの適切なコーチング能力が求められます。
    他のポジションとは違う唯一の存在になりたい人におすすめ！
    ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
    ★FIXO（フィクソ）
    フィクソはサッカーのボランチやセンターバックと同じような役割のポジションです。
    オフェンスのときには正確なキックを武器に時にはゴールを狙ったり、パス回しの起点になったりして、チームを下からサポートします。
    ディフェンスのときには守備の要として相手の大柄なフィジカルが強靭なピヴォ（PIVO）をしっかりマークし封じする必要があるため
    自身にもそれ相応のフィジカルレベルが求められます。
    試合全体を見渡しながらゲームをコントロールしたい人におすすめ！
    ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
    ★ALA（アラ）
    アラはサッカーでいうとサイドハーフの役割で豊富な運動量とキレのある動きが必要になります。
    サイドからドリブルで仕掛けてゴールを狙ったり、
    ピヴォをサポートして攻撃に厚みを持たせたりとアラの動きが試合のカギになることも多いです。
    体力に自信があり、攻守に渡ってチームに貢献したい人におすすめ！
    ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
    ★PIVO(ピヴォ)
    ピヴォはサッカーで言うフォワードの役割で、得点を取ることが仕事です
    自分でゴールを決めるだけでなく、ボールをキープして味方が上がってくる時間を作ることが重要で、そのためにも
    強靭なフィジカルとボールキープ力が求められます。
    ピヴォが前線でキープして頑張ることができると味方に余裕が生まれてチームの攻撃の流れが良くなり、得点につながります。
    また、ディフェンスのときには1人目のディフェンダーとして相手にプレッシャーをかけるのも大事な仕事ととなります。
    フィジカルに自身のある人、ゴールを決めて活躍したい人におすすめ！
    ******************************************************************************************************************************
    EOS
  end
end

  




