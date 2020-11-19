class Chapter1 < ApplicationRecord
     belongs_to :user
     validates :course_id, presence: true
　　 validates :chapter_id, presence: true
　　 validates :section_id, presence: true
     validates :user_id, presence: true , uniqueness: { scope: [ :course_id, :chapter_id , :section_id]  }
end
