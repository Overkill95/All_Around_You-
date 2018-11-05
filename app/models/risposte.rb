class Risposte < ApplicationRecord
  belongs_to :user
  belongs_to :domande
  has_many :voti_rs, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :content, presence: true, length: { maximum: 250 }
end
