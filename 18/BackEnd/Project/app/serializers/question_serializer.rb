class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :content, :difficult, :question_type
end
