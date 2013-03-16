class Metrics::CommitMessageProfanity < Metrics::CommitMetric
  def calculate(metrics)
    profanity = check @data["message"]

    metrics << {
      metric: :commit_message_profanity,
      data: {
        words: profanity[:all],
        wrong_words: profanity[:wrong],
        rate: 1 - (profanity[:wrong].count.to_f / profanity[:all].count)
      }
    }
  end

  private

  def check(text)
    {
      all: split_words(text),
      wrong: Obscenity.offensive(text)
    }
  end

end
