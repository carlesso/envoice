if Rails.env == 'production'
  PDFKit.configure do |config|       
    config.wkhtmltopdf = Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s
  end
end