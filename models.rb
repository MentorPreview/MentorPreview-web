require 'bundler/setup'
Bundler.require

if development?
	ActiveRecord::Base.establish_connection("sqlite3:db/development.db")
end

class Mentor < ActiveRecord::Base
    has_many :courses ,through: :mentor_courses
    has_many :mentor_courses
    
    has_many :camps ,through: :mentor_camps
    has_many :mentor_camps
end

class Camp < ActiveRecord::Base
    has_many :mentors ,through: :mentor_camps
    has_many :mentor_camps
    
    has_many :courses ,through: :camp_courses
    has_many :camp_courses
end

class Course < ActiveRecord::Base
    has_many :mentors ,through: :mentor_courses
    has_many :mentor_courses
    
    has_many :camps ,through: :camp_courses
    has_many :camp_courses
end

class MentorCamp < ActiveRecord::Base
   belongs_to :camp
   belongs_to :mentor
end

class CampCourse < ActiveRecord::Base
   belongs_to :camp
   belongs_to :course
end

class MentorCourse < ActiveRecord::Base
    belongs_to :mentor
    belongs_to :course
end