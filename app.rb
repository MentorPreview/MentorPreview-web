require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'json'
require './models'

enable :sessions

# 各ページ読み込み時
get '/' do
	erb :mypage
end

get '/test' do
  erb :test
end

get '/preview' do
  @camps = Camp.all.order('id asc')
  @courses = Course.all.order('id asc')
  @mentors = Mentor.all.order('id asc')
  @campus = Campus.all.order('id asc')
	erb :preview
end

get '/data' do
  @camps = Camp.all.order('id asc')
  @courses = Course.all.order('id asc')
  @mentors = Mentor.all.order('id asc')
  @campus = Campus.all.order('id asc')
	erb :data
end

get '/gallary' do
  @albums = Album.all.order('id asc');
	erb :gallary
end

# 大まかなデータ提供用API
post '/camps' do
  camps = Camp.all.order('id asc')
  json = {
    "response": {
      "camps": []
    }
  }
  base_url = 'https://mentor-preview.herokuapp.com'
  camps.order('id asc').each do |camp|
    camp_data = {
      name: camp.name,
      start_date: camp.start_date,
      end_date: camp.end_date,
    }
    camp_img_url = camp.img_url
    camp_img_url.slice!(0)
    camp_data[:img_url] = base_url + camp_img_url
    camp_data[:campus] = Campus.find_by(id: camp.campus_id)
    json[:response][:camps] << camp_data
  end
  json.to_json
end

post '/mentors' do
  mentors = Mentor.all.order('id asc')
  json = {
    "response": {
      "mentors": []
    }
  }
  base_url = 'https://mentor-preview.herokuapp.com'
  mentors.order('id asc').each do |mentor|
    mentor_data = {
      id: mentor.id,
      name: mentor.name,
      courses: [],
    }
    mentor_img_url = mentor.img_url
    mentor_img_url.slice!(0)
    mentor_data[:img_url] = base_url + mentor_img_url
    mentor.courses.each do |course|
      mentor_data[:courses] << course.identifier
    end
    json[:response][:mentors] << mentor_data
  end
  json.to_json
end

post '/camps/create' do
  Camp.create(
    name: params[:name],
    img_url: "/assets/images/camp/summer2017.png"
    )
  redirect '/data#camp'
end

post '/mentors/create' do
  Mentor.create(
    name: params[:name]
    )
  redirect '/'
end

post '/camp/courses' do
  camp = Camp.find(params[:campId])
  html = ""
  camp.courses.order('id asc').each do |course|
    html += '<img class="ajax-course small-img" src="' + course.img_url.to_s + '">'
  end
  html
end

post '/camp/courses/edit' do
  courses = Course.all.order('id asc')
  camp_courses = Camp.find(params[:campId]).courses
  html = ""
  courses.each do |course|
    if camp_courses.find_by(id: course.id)
      html += '<img class="ajax-course-choose small-img on" value="' + course.id.to_s + '" src="' + course.img_url.to_s + '">'
    else
      html += '<img class="ajax-course-choose small-img off" value="' + course.id.to_s + '" src="' + course.img_url.to_s + '">'
    end
  end
  html
end

post '/camp/courses/update/on' do
  camp = Camp.find(params[:campId])
  course = Course.find(params[:courseId])
  camp.courses << course
  "success"
end

post '/camp/courses/update/off' do
  camp = Camp.find(params[:campId])
  course = Course.find(params[:courseId])
  camp.courses.delete(course)
  "success"
end


post '/campus/camps' do
  campus = Campus.find(params[:campusId])
  html = ""
  campus.camps.order('id asc').each do |camp|
    html += '<img class="ajax-camp small-img" data="' + camp.name + '" src="' + camp.img_url.to_s + '">'
  end
  html
end

post '/campus/camps/edit' do
  camps = Camp.all.order('id asc')
  campus_camps = Campus.find(params[:campusId]).camps
  html = ""
  camps.each do |camp|
    if campus_camps.find_by(id: camp.id)
      html += '<img class="ajax-camp-choose small-img on" value="' + camp.id.to_s + '" data="' + camp.name + '" src="' + camp.img_url.to_s + '">'
    else
      html += '<img class="ajax-camp-choose small-img off" value="' + camp.id.to_s + '" data="' + camp.name + '" src="' + camp.img_url.to_s + '">'
    end
  end
  html
end

post '/campus/camps/update/on' do
  campus = Campus.find(params[:campusId])
  camp = Camp.find(params[:campId])
  campus.camps << camp
  "success"
end

post '/campus/camps/update/off' do
  campus = Campus.find(params[:campusId])
  camp = Camp.find(params[:campId])
  campus.camps.delete(camp)
  "success"
end

post '/campus/edit/location' do
  campus = Campus.find(params[:campusId])
  campus.update(lat: params[:lat],lng: params[:lng])
  "success"
end

post '/camp/mentors' do
  camp = Camp.find(params[:campId])
  html = ""
  camp.mentors.order('id asc').each do |mentor|
    html += '<img class="ajax-mentor small-img" src="' + mentor.img_url.to_s + '">'
  end
  html
end

post '/mentor/courses' do
  mentor = Mentor.find(params[:mentorId])
  html = ""
  mentor.courses.order('id asc').each do |course|
    html += '<img class="ajax-course small-img" src="' + course.img_url.to_s + '">'
  end
  html
end

post '/course/mentors' do
  course = Course.find_by(id: params[:courseId])
  if Course.find_by(identifier: params[:identifier]) != nil
    course = Course.find_by(identifier: params[:identifier])
  end
  json = {
    "response": {
      "course": course.name,
      "mentors": []
    }
  }
  base_url = 'https://mentor-preview.herokuapp.com'
  course.mentors.order('id asc').each do |mentor|
    mentor_data = {
      id: mentor.id,
      name: mentor.name,
    }
    mentor_img_url = mentor.img_url
    mentor_img_url.slice!(0)
    mentor_data[:img_url] = base_url + mentor_img_url
    json[:response][:mentors] << mentor_data
  end
  json.to_json
end

post '/campus/camps' do
  campus = Campus.find(params[:campusId])
  html = ""
  campus.camps.order('id asc').each do |camp|
    # html += '<p class="ajax-camp" hidden>' + camp.name.to_s + '</p>'
    html += '<img class="ajax-camp small-img" src="' + camp.img_url.to_s + '">'
  end
  html
end

post '/camp/mentors/edit' do
  mentors = Mentor.all.order('id asc')
  camp_mentors = Camp.find(params[:campId]).mentors
  html = ""
  mentors.each do |mentor|
    if camp_mentors.find_by(id: mentor.id)
      html += '<img class="ajax-mentor-choose small-img on" value="' + mentor.id.to_s + '" data="' + mentor.name + '" src="' + mentor.img_url.to_s + '">'
    else
      html += '<img class="ajax-mentor-choose small-img off" value="' + mentor.id.to_s + '" data="' + mentor.name + '" src="' + mentor.img_url.to_s + '">'
    end
  end
  html
end

post '/camp/mentors/update/on' do
  camp = Camp.find(params[:campId])
  mentor = Mentor.find(params[:mentorId])
  camp.mentors << mentor
  "success"
end

post '/camp/mentors/update/off' do
  camp = Camp.find(params[:campId])
  mentor = Mentor.find(params[:mentorId])
  camp.mentors.delete(mentor)
  "success"
end

# メンターのコース情報の編集
post '/mentor/courses/edit' do
  courses = Course.all.order('id asc')
  mentor_courses = Mentor.find(params[:mentorId]).courses.order('id asc')
  html = ""
  courses.each do |course|
    if mentor_courses.find_by(id: course.id)
      html += '<img class="ajax-course-choose small-img on" value="' + course.id.to_s + '" data="' + course.name + '" src="' + course.img_url.to_s + '">'
    else
      html += '<img class="ajax-course-choose small-img off" value="' + course.id.to_s + '" data="' + course.name + '" src="' + course.img_url.to_s + '">'
    end
  end
  html
end

post '/mentor/courses/update/on' do
  mentor = Mentor.find(params[:mentorId])
  course = Course.find(params[:courseId])
  mentor.courses << course
  "success"
end

post '/mentor/courses/update/off' do
  mentor = Mentor.find(params[:mentorId])
  course = Course.find(params[:courseId])
  mentor.courses.delete(course)
  "success"
end

post '/albums/create' do
  Album.create(
    url: params[:name],
  )
  redirect '/gallary'
end
