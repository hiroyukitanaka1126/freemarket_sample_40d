// トップページのスライドショー起動
$(document).on('turbolinks:load', function(){
      $('.bxslider').bxSlider({
        auto: true, // 自動でスライドさせる
        pause: 7000,// 7秒ごとに次のスライドに移る
      });
    });
