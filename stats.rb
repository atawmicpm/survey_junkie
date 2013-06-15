
  def report
# returns an array of hashes, one array element per question
    report_hash = {}
    self.questions.each do | question |
      question_array = []
      question.choices.each do | choice |
        question_array << {choice.name.to_sym => choice.answers.length}
      end
      report_hash[question.name] = question_array
    end
  return report_hash
  end
