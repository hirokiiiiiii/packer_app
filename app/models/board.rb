class Board < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :delete_all 
    has_many :board_tag_relations, dependent: :delete_all
    has_many :tags, through: :board_tag_relations
    validates :title, presence: true
end
