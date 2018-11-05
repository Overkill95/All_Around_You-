class Domande < ApplicationRecord
  attr_accessor :servizi_id # :vote_count, :likecount, :nolikecount
  belongs_to :user
  belongs_to :servizi
  has_many :rispostes, dependent: :destroy
  has_many :voti_ds, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :content, presence: true, length: { maximum: 250 }
end
