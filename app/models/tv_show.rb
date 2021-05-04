class TvShow < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_title_and_synopsis,
    against: [ title: 'A', synopsis: 'C' ],
    using: {
      tsearch: { prefix: true }
    }
end
