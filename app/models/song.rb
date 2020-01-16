class Song < ApplicationRecord
    validates :title, presence: true 
    validates :title, :release_year, uniqueness: true
    validates :released, inclusion: { in: [true, false]}
    validates :artist_name, presence: true

    # validates :release_year,xxx  # Optional if released is false
    with_options if: :released? do |song|
        song.validates :release_year, presence: true   # Must not be blank if released is true
        song.validates :release_year, numericality: {  # Less than or equal to the current year
          less_than_or_equal_to: Date.today.year
        }
      end
end