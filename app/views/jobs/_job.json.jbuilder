json.extract! job, :id, :description, :hours, :project_id, :created_at, :updated_at
json.url job_url(job, format: :json)
