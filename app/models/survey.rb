class Survey < ActiveRecord::Base
	belongs_to :user
	has_many :questions

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

  def graph_report
    report_array = []
    self.questions.each do |question|
      question.choices.each do |choice|
        report_array << Hash["value", choice.answers.length, "choice", choice.name]
      end
    end
    report_array
  end

  def response_count
    count = 0
    self.questions.each {|question| question.choices.each {|choice| count += choice.users.length }}
    return count
  end


	def self.publish(user_id, params)
	  # name => best survey?
	  # q1 => {"q"=>"who da man?", "c1"=>"phillip"}
	  # q2 => {"q"=>"best language?", "c1"=>"ruby", "c2"=>"javascript"}

	  params.each do |form_field|
	  	case form_field.first
	  	when 'name'
	  		@survey = Survey.create(user_id: user_id, name: form_field.last)

	  	when /q/
	  		form_field.last.each do |question_or_choice, value|
	  			case question_or_choice
	  			when /q/
	  				@survey.questions << Question.create(name: value)
	  			when /c/
	  				@survey.questions.last.choices << Choice.create(name: value)
	  			end
				end	  	
			end
	  end
    return @survey
	end
end
