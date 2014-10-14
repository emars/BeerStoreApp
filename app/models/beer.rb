class Beer < ActiveRecord::Base
  has_many :prices

  def best_value
    sort_price_score[-1]
  end

  def worst_value
    sort_price_score[0]
  end

  def popular
    self.where(:name => "Budweiser")
  end

  private
  def alc_to_float(val)
    val.tr('%','').to_f
  end

  def sort_price_score
    self.prices.sort_by do |val|
      val.price_score
    end
  end
end
