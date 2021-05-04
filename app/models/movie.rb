class Movie < ApplicationRecord
  belongs_to :director
  include PgSearch: :Model

  pg_search_scope :search_by_title_and_synopsis,
    against: [:title, :synopsis],
    using: {
      tsearch: { prefix: true }
    }
end
