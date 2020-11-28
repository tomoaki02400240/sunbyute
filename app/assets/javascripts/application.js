// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .


$(document).on('turbolinks:load', function(){
    $(function() {
        var height = $('#header').height();
        $('body').css('margin-top', height)
    })
})

$(document).on('turbolinks:load', function(){
    let prefVal = $('#shop_prefecture_id').val();
    //一度目に検索した内容がセレクトボックスに残っている時用のif文
    if (prefVal !== "") {
     let selectedTemplate = $(`#city_of_prefecture${prefVal}`);
     $('#shop_city_id').remove();
     $('#shop_prefecture_id').after(selectedTemplate.html());
    };
   let defaultCitySelect = `<select name="shop_city_id" id="shop_city_id">
   <option value>市町村を選択してください</option>
   </select>`
   console.log(defaultCitySelect)
   $(document).on('change', '#shop_prefecture_id', function(){
       let prefVal = $('#shop_prefecture_id').val()
       console.log(prefVal);
     //親要素のセレクトボックスが変更されてvalueに値が入ったときの処理
     if(prefVal !== "") {
         let selectedTemplate = $(`#city_of_prefecture${prefVal}`);
         $('#shop_city_id').remove();
         $('#shop_prefecture_id').after(selectedTemplate.html());
     } else {
         //親要素のセレクトボックスがinclude_blankの場合
         $('#shop_city_id').remove();
         $('#shop_prefecture_id').after(defaultCitySelect);
     };
   });
});

window.setTimeout(function() {
  $('.alert').slideUp();
}, 3000)
