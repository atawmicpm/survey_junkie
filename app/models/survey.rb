class Survey < ActiveRecord::Base
	belongs_to :user
	has_many :questions

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
	end

end
