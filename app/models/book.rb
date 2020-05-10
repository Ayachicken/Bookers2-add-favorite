class Book < ApplicationRecord
	belongs_to :user
	has_many :book_comments
	has_many :favorites

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	#サーチメソッドの定義。if内でさらに検索条件による分岐
	def self.search(search, user_or_book, how_search)
		  if how_search == "1"
				  Book.where(['title LIKE ?', "#{search}"])
		  elsif how_search == "2"
				  Book.where(['title LIKE ?', "%#{search}%"])
		  elsif how_search == "3"
				  Book.where(['title LIKE ?', "#{search}%"])
		  else
				  Book.where(['title LIKE ?', "%#{search}"])
		  end
	end
end
