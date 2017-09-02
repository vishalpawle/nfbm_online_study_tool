json.extract! exam, :id, :exam_name, :exam_date, :exam_discription, :exam_instructions, :level_id, :created_at, :updated_at
json.url exam_url(exam, format: :json)
