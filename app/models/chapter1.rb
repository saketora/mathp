class Chapter1 < ApplicationRecord
     belongs_to :user
    
 validates :user_id, presence: true , uniqueness: { scope: [ :course_id, :chapter_id , :section_id]  }
end
