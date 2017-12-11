json.extract! email, :id, :sender_id, :recipient_id, :subject, :body, :status, :created_at, :updated_at
json.url email_url(email, format: :json)
