json.extract! question, :id, :question_name, :question_discription, :paper_id, :subject_id, :created_at, :updated_at
json.url question_url(question, format: :json)
