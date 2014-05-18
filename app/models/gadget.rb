class Gadget < ActiveRecord::Base
  belongs_to :user
  has_many :images

  validates :name, presence: true

  private
    # NOTE: Allows to search for both `name` and `description` fields.
    def prepare_search_text
      self.search = (name + ' ' + description).downcase
    end
    before_save :prepare_search_text
end
