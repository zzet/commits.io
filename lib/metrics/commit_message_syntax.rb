class Metrics::CommitMessageSyntax < Metrics::CommitMetric
  def calculate(metrics)
    spelling = check @data[:message]

    metrics << {
      metric: :commit_message_syntax,
      data: {
        words: spelling[:all],
        wrong_words: spelling[:wrong],
        rate: 1 - (spelling[:wrong].count.to_f / spelling[:all].count)
      }
    }
  end

  private

  def check(text)
    speller = FFI::Aspell::Speller.new('en_US')
    words = split_words(text)
    wrong_words = []

    words.each { |word| wrong_words << word unless speller.correct? word }

    {
      all: words,
      wrong: wrong_words
    }
  end
end
