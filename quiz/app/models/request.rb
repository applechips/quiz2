class Request < ApplicationRecord
  paginates_per 7
  # before_action :find_request, only: [:show, :edit, :update, :destroy]
  validates :name, presence: true
  validates :email, presence: true

  after_initialize do |request|
    request.completed ||= false
  end

  def self.search(query)
    if (query)
      where(["name LIKE ? OR email LIKE ? OR department LIKE ? OR message LIKE ? ", "%#{query}", "%#{query}", "%#{query}", "%#{query}"])
    else
      all
    end
  end


end
