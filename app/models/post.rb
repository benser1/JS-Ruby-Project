class Post < ActiveRecord::Base


  belongs_to :user
  has_many :comments
  belongs_to :category

  accepts_nested_attributes_for :category, reject_if: proc { |attributes| attributes['name'].blank? }

  def category_name=(name)
    self.category = Category.find_or_create_by(name: name)
  end



end ## class end
