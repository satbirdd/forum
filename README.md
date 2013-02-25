簡易論壇系統

開發一個簡易論壇系統。寫出 CRUD 介面，並且文章網址是使用 http://forum.local/forums/1/posts/2 這種表示。
使用 web-app-theme 套版
使用者必須能夠 註冊 / 登入，登入後才可以發表 Post，不然只能瀏覽。只有自己的 Post 才能進行修改與刪除。請使用 devise gem。
論壇的文章要能夠分頁，每一頁 20 筆，每一個論壇要秀出現在論壇裡有多少文章數量。請使用 kaminari gem。
可依照文章時間排序，請使用 Model 的 scope 功能。
每篇文章可以上傳附件。請使用 paperclip gem。
建立一個後台，讓管理員可以刪改所有文章，網址是 http://forum.local/admin/。只有身分是 admin 的人可以進後台。admin 的判別方是 column 裡加一個 boolean，判斷是否 admin。這個 attribute 必須用 attr_accessible 或 attr_protected 保護。
用 Rake 撰寫的產生假資料的步驟。執行 rake dev:fake 即會產生假文章與假論壇。