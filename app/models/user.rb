# frozen_string_literal: true

class User < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :name, presence: true
end
