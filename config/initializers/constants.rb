case Rails.env
when 'production'
  WKHTMLTOPDF_BIN = Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s
when 'development'
  WKHTMLTOPDF_BIN = '/usr/local/bin/wkhtmltopdf'
end