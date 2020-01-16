class Song < ApplicationRecord
    validates :title, presence: true
    validate :same_same
    with_options if: :released do |option|
        option.validates :release_year, presence: true
        option.validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}
      end
    validates :genre, presence: true

    def same_same
        if Song.find_by(artist_name: artist_name, release_year: release_year, title: title)
            errors.add(:title, "already exists")
        end
    end
end
