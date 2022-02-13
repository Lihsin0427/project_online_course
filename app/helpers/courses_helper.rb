module CoursesHelper

  def display_course_currency(c)
    case c
      when "TWD"
        "新台幣(TWD)"
      when "USD"
        "美元(USD)"
      when "JPY"
        "日幣(JPY)"
      when "GBP"
        "英鎊(GBP)"
      when "EUR"
        "歐元(EUR)"
      when "AUD"
        "澳幣(AUD)"
      when "HKD"
        "港幣(HKD)"
      when "MOP"
        "澳門幣(MOP)"
      when "MYR"
        "馬來西亞林吉特 (MYR)"
      when "BEF"
        "比利時法郎(BEF)"
      when "CAD"
        "加幣(CAD)"
      when "FRF"
        "法國法郎(FRF)"
      when "ITL"
        "義大利里拉(ITL)"
      when "PHP"
        "菲律賓比索(PHP)"
      when "DEM"
        "德國馬克(DEM)"
      when "CHF"
        "瑞士法郎(CHF)"
      when "SEK"
        "瑞典克郎(SEK)"
      when "NZD"
        "紐西蘭幣(NZD)"
      when "SGD"
        "新加坡幣(SGD)"
      when "ESP"
        "西班牙比塞塔(ESP)"
      when "DKK"
        "丹麥克郎(DKK)"
      when "INR"
        "印度盧比(INR)"
      when "NOK"
        "挪威克郎(NOK)"
      when "NLG"
        "荷蘭盾(NLG)"
      when "FIM"
        "芬蘭馬克(FIM)"
      when "SAR"
        "沙烏地里亞爾(SAR)"
      when "THB"
        "銖(THB)"
      when "IDR"
        "印尼盧比(IDR)"
      when "ZAR"
        "蘭特(ZAR)"
      when "ATS"
        "先令(ATS)"
      when "IEP"
        "愛爾蘭鎊(IEP)"
      when "MXN"
        "墨西哥比索(MXN)"
      when "PLN"
        "茲羅提(PLN)"
      when "CZK"
        "捷克克郎(CZK)"
      when "TRY"
        "新土耳其里拉(TRY)"
      when "HUF"
        "富林特(HUF)"
      when "VND"
        "越南盾(VND)"
      else "CNY"
        "元人民幣(CNY)"
    end
  end

end