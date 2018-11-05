class VotiD < ApplicationRecord
  attr_accessor :user_id, :domande_id
  belongs_to :user
  belongs_to :domande
end
