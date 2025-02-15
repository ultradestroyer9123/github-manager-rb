class DuckDuckGoSearch < ApplicationRecord
  has_many :duck_duck_go_results, dependent: :destroy
end
