class Person < ActiveRecord::Base
  validates :id, :name, presence: true, uniqueness: true

  belongs_to :house,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: :House
end
