json.extract! report, :id, :name, :yrmnth, :file, :link, :approval, :comment, :created_at, :updated_at
json.url report_url(report, format: :json)
