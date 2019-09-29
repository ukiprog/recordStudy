class Subject < ApplicationRecord
 has_many :records
 has_many :questions
end
