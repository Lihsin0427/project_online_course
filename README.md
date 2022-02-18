# 線上課程平台
https://hidden-reef-83151.herokuapp.com

題目要求
-------
一個簡單的線上課程平台，該平台提供的線上課程都是有時效性，一但過了時效性，使用者就必須重新購買，以再次取用該課程內容。<br> 
1. 需要有一個後台可以讓管理者管理教育課程。<br> 
>>1. 可以執行CRUD基本操作<br> 
>>2. 若使用者不是管理員，則不允許操作<br> 
>>3. 可以設定課程主題<br> 
>>4. 可以設定課程價格，幣別<br> 
>>5. 可以設定課程類型<br> 
>>6. 可以設定課程上下架<br> 
>>7. 可以設定課程URL，以及描述<br> 
>>8. 可以設定課程效期 1天 ~ 1個月<br> 

2. 這個平台可以讓用戶用API購買教育課程。<br> 
>>1. 購買後須建立購買紀錄<br> 
>>2. 若課程已下架，則不能進行購買<br> 
>>3. 若使用者已購買過該課程，且目前還可以取用，則不允許重複購買<br> 

3. 用戶可以用API瀏覽他所有購買過的課程<br> 
>>1. 回傳結果要包含課程基本資料<br> 
>>2. 回傳結果要包含所有跟該課程相關的付款資料<br> 
>>3. 可以用過濾方式找出特定類型的課程<br> 
>>4. 可以用過濾方式找出目前還可以上的課程<br> 

需求：<br> 
>>1. 需使用 Grape & Grape entity gem<br> 
>>2. code 需上 Github，並按照 Github flow。<br> 
>>3. 不用串金流<br> 



技術
---
Ruby 2.7.4<br> 
Rails 6.1.4<br> 
資料庫｜PostgreSQL<br> 
部署｜Heroku<br> 
版本控制：Git / GitHub<br> 
前端：Bootstrap<br> 

內容說明
----
### 一. 課程操作及使用者權限 (第1題）

- 使用 Devise gem 製作會員系統<br> 
- 以欄位 admin 來記錄是否為管理員身份<br> 
- 管理員才能進行對課程的操作
   >> - 可以執行 CRUD 基本操作
   >> - 設定課程主題、價格、幣別、類型、上下架、URL、描述、效期
   >> - 操作後有提示訊息
   >> - 設定的URL即為可以瀏覽該堂課資訊的路徑
- 管理員還可以新增、修改、刪除類型（刪除前會有訊息提醒）
- 顯示清單的排序方式
  >> - 課程清單以更新時間為序，最新更新的在最上面
  >> - 類型清單以建立時間為序，最後建立的在最上面

備註
>>- 考量到幣別大致上不太需要增加或修改，
>>- 因此規劃上幣別用欄位跟課程直接記載在同一個資料表(table)內。
>>- 課程的類型則使用另一張資料表(table)處理，管理員可以增加修改刪除類別。

* 為使用方便，另外設計頁面讓登入後的使用者可以修改權限成為管理員（或取消管理員身份），
>> 想法為改變路徑為一般使用者無法輕易猜到
https://hidden-reef-83151.herokuapp.com/427liHsinPractice


### 二. 後端 API (第2,3題的API,未做前端）

<img width="858" alt="截圖 2022-02-17 下午3 11 47" src="https://user-images.githubusercontent.com/92938134/154646552-74eaa727-76f3-4595-8df3-4f645ef75824.png">

- 購買課程的API路徑 post | /api/v1/purchase_records
```
key: url
value: 該課程伺服器之後的網址
```
- 取得購買課程的 API get | /api/v1/purchase_records
```
- 不輸入key&Value -> 得到該用戶所有購買資料

- key: category 
  value: 該類型中文字串 -> 篩選某類型課 - 程的購買資料

- key: valid 
  value: true -> 篩選還可以上的課程

- 同時輸入以上兩種 key -> 篩選某類型且還可以上的課程
```


- 使用 gem
>> - Grape （題目規定） - 實現 API
>> - Grape-Entity（題目規定）- 管理輸出格式
>> - Grape On Rails Routes - 可視化API路由

#### API 請求無效說明

- 若用戶未登入 -> 回傳 Unauthorized 訊息
- 若此課已下架- > 回傳 The course is not available 訊息
- 若已購買此課程且還可以取用 -> 回傳 You still have this course that has not expired 訊息
- 亂打沒有的value -> 回傳 Couldn't find Course 訊息




其他
---
礙於時間關係，先符合題目的功能要求。
前端僅做與第一大題相關部分，版面基本處理。

目前還沒做，下一步想先處理的地方：
- 使用 i18n 將訊息中文化
- 目前僅做show頁面顯示單個課程的基本資訊，還想要有頁面是使用者有購買並且有效期才能瀏覽的頁面
- 使用 Rspec 撰寫測試



