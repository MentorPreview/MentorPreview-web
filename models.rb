require 'bundler/setup'
Bundler.require

if development?
	ActiveRecord::Base.establish_connection("sqlite3:db/development.db")
end

class Mentor < ActiveRecord::Base
    has_many :mentor_courses
    has_many :courses ,through: :mentor_courses
    
    has_many :mentor_camps
    has_many :camps ,through: :mentor_camps
end

class Camp < ActiveRecord::Base
    has_many :mentor_camps
    has_many :mentors ,through: :mentor_camps
    
    has_many :camp_courses
    has_many :courses ,through: :camp_courses
    
    belongs_to :campus
end

class CampCourse < ActiveRecord::Base
   belongs_to :camp
   belongs_to :course
end

class Course < ActiveRecord::Base
    has_many :mentor_courses
    has_many :mentors ,through: :mentor_courses
    
    has_many :camp_courses
    has_many :camps ,through: :camp_courses
    
    has_many :course_types
end

class Campus < ActiveRecord::Base
   has_many :camps
end

class CourseType < ActiveRecord::Base
   belongs_to :course 
end

class MentorCamp < ActiveRecord::Base
   belongs_to :camp
   belongs_to :mentor
end

class MentorCourse < ActiveRecord::Base
    belongs_to :mentor
    belongs_to :course
end