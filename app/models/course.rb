class Course < ApplicationRecord
  belongs_to :category, :optional => true

  # validation
  validates :topic, :category, :content, presence: true

  validates :price, presence: true, numericality: {
    greater_than_or_equal_to: 0
  }
  validate :price_is_valid_decimal_precision
  
  CURRENCY = %w(TWD USD JPY GBP EUR AUD HKD MOP MYR BEF CAD FRF ITL PHP DEM CHF SEK NZD SGD ESP DKK INR NOK NLG FIM SAR THB IDR ZAR ATS IEP MXN PLN CZK TRY HUF VND CNY)
  validates :currency, presence: true, inclusion: { in: CURRENCY }

  validates :validity_period, presence: true, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 31,
    only_integer: true
  }
  validates :is_available, inclusion: { in: [true, false] }, exclusion: { in: [nil] }

  validates :url, presence: true, uniqueness: true, format: {    
    with: /\A[a-z0-9\-]+\z/,
    message: "限小寫英數字及橫線" 
  }

  def to_param
    url
  end

  private
  
  def price_is_valid_decimal_precision 
    if price.to_f != price.to_f.round(2) 
     errors.add(:price, " should only be two digits at most after the decimal point.") 
    end 
  end 

end




