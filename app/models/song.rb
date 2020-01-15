class Song < ApplicationRecord
  # title validations
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released?
  validate :no_repeats
  validates :released, inclusion: { in: [true, false] }
  validate :not_in_future

  # custom validations
  def no_repeats
    Song.all.each do |song|
      if song.title == title && song.artist_name == artist_name && song.release_year == release_year
        errors[:title] << "Cannot add the same song twice in one year."
      end
    end
  end

  def not_in_future
    if release_year.present? && release_year > Date.today.year
      errors[:release_year] << "Release year cannot be in the future."
    end
  end
end
