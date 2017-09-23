class ReportsController < ApplicationController


  def index
    @reports = Report.all.order(id: 'asc')
    ap @reports
  end

  def new
    @report = Report.new
  end

  # def create
  #   @report = Report.new(params[:report].permit(:name, :subject, :level, :credits))
  #   if @report.save
  #     redirect_to reports_path
  #   else
  #     render 'new'
  #   end
  # end


  def create
    name = params[:name]
    yrmnth = params[:yrmnth]
    link = params[:link]
    file = params[:file]
    if !file.blank?
      orig = file.original_filename
      token = SecureRandom.hex(64)
      path = "#{Rails.root}/uploads/#{token}"
      FileUtils.cp file.path, path
      UploadImagesJob.perform_later(name, orig, token, path, file.content_type, link, approval, comment)
    else
      Report.create!(name: name, yrmnth: yrmnth, link: link, approval: approval, comment: comment)
    end

    
    # redirect_to sections_klass_path(klass)
  end

 

end