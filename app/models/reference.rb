class Reference < ApplicationRecord
  belongs_to :post

  validates :body, presence: true

  before_validation :generate_body
  BASE_DOI_URL = 'https://doi.org/'

  def doi_url
    "#{BASE_DOI_URL}#{doi}"
  end

  def generate_body
    self.url = doi_url if doi?
    if doi? || url?
      begin
        data = Scraper.new(url, doi: doi?).scrape
        self.body = data[:body] unless !doi? && self.body.present? #overwrites body for both doi and url
      rescue StandardError => error
        self.errors.add(:url, :not_valid, message: 'must be valid') unless doi?
        self.errors.add(:doi, :not_valid, message: 'must be valid') if doi?
      end
    else
      self.body
    end
  end

end
