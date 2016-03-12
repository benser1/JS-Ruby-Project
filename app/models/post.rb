class Post < ActiveRecord::Base


  belongs_to :user
  has_many :comments
  # belongs_to :category
  has_many :categories

  accepts_nested_attributes_for :categories, reject_if: proc { |attributes| attributes['name'].blank? }

  #   def category_name 
  #   self.category.name
  # end



  # def category_name=(name)
  #   self.category = Category.find_or_create_by_name(name) unless category.name.blank?
  #   self.category.save!
  # end



end ## class end
