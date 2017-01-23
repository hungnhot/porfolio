class PersonalController < ApplicationController

  def index
    file = File.read('db/data/general.json')
    content_file = JSON.parse(file)

    @personal_details = content_file['personal-details']
    @skills = content_file['skills-knowledge']["skills"]
    @knowledge = content_file['skills-knowledge']["knowledge"]
    @work_experience = content_file['work-experience']
    @educations = content_file['educations']
    @projects = content_file['projects']
  end

  def download_resume
    send_file Rails.root.join('file', 'Tran-Viet-Hung.pdf'), :type=>"application/pdf", :x_sendfile=>true
  end

  def say_hello
    content = {name: params['contact_name'], email: params['contact_email'], message: params['contact_message']}
    ApplicationMailer.contact_email('tvhung45@gmail.com', content).deliver

    render json: {}
  end
end
