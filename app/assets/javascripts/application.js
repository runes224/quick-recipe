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
//= require_tree.
//= require jquery3
//= require popper
//= require bootstrap
//= require nested_form_fields

// $(function () {
//   // $(document).on('click', 'input[type=submit]', function () {
//   //   if ($('input[type=text]').val() == '') {
//   //     return false;
//   //   }
  //   // })

var user = '<%= "#{ @text }" %>'
$('#ajax-test1').text(user);

// $(function () {
//   $("#submit_button").click(function () { //送信ボタンを押すとイベントが発火します
//     var input = $("#meal_form").val(); // フォームの値を'input'という名前の変数に代入します
//     $.ajax({
//         type: 'GET', // リクエストのタイプはGETです
//         url: '/meals', // URLは"/meals"を指定します
//         data: {
//           keyword: input
//         }, // コントローラへフォームの値を送信します
//         dataType: 'json' // データの型はjsonで指定します
//       })
//       .done(function (data) {
//         // 通信に成功した場合の処理です
//         $('.meal_list').empty(); //前回の検索結果が残っている場合はそれを消します
//         data.forEach(function (meal) {
//           $('.meal_list').append(`<li>${meal.name} </li>`);
//         }) //データは配列形式でかえってくるので、forEachで繰り返し処理をします
//       })
//       .fail(function () {
//         // 通信に失敗した場合の処理です
//         alert('検索に失敗しました') // alertで検索失敗の旨を表示します
//       })
//   })
// })

//   // $(document).on('ajax:success', 'form', function (e) {
//   //   $('#recipe_name').val('');
//   //   $('.post_wrapper').prepend('<p>' + e.detail[0] + '</p>');
//   // })
//   $(document).on('ajax:success', 'form', function (e) {
//   $('#ringredient_relation_weight').val('');
//   $('#ringredient_relation_display_weight_name').val('');
//   $('#ringredient_relation_display_ingredient_name').val('');
//   $('.post_wrapper').prepend('<p>' + e.detail[0] + '</p>');
//   })
// })
