json.extract! task, :id, :name, :duration, :description, :content, :deadline, :created_at, :updated_at
json.url task_url(task, format: :json)
