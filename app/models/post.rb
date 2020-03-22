class Post < ApplicationRecord
  belongs_to :poster, class_name: 'User'
  belongs_to :postee, class_name: 'User'
end
