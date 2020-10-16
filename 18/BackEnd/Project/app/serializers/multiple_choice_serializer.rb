class MultipleChoiceSerializer < ActiveModel::Serializer
  attributes :id, :content, :difficult, :choice_type, :wrong_answer
end
  