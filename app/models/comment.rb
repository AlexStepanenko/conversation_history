# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :project, required: true
  belongs_to :user, required: true

  validates :text, presence: true
end
