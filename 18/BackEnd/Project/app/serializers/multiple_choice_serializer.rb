class MultipleChoiceSerializer < ActiveModel::Serializer
  attributes :id, :content, :difficult, :choice_type, :answer

  def answer
    (object.wrong_answer << object.right_answer).shuffle
  end
end
  