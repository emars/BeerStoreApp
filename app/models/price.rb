class Price < ActiveRecord::Base
  belongs_to :beer

  def price_score
    (self.quantity * self.volume / self.price).round(2)
  end
end
