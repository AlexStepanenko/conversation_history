# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :name, presence: true

  enum status: { created: 0, in_progress: 1, accepted: 2, rejected: 3, }
end
