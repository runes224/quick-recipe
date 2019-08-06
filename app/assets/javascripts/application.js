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
//= require cocoon
//= require jquery-ui

$(function () {
    $('#myfile').change(function (e) {
        //ファイルオブジェクトを取得する
        var file = e.target.files[0];
        var reader = new FileReader();

        //画像でない場合は処理終了
        if (file.type.indexOf("image") < 0) {
            alert("画像ファイルを指定してください。");
            return false;
        }

        //アップロードした画像を設定する
        reader.onload = (function (file) {
            return function (e) {
                $("#img1").attr("src", e.target.result);
                $("#img1").attr("title", file.name);
            };
        })(file);
        reader.readAsDataURL(file);

    });
});

$(function () {
    $("#submit_button").click(function () { //送信ボタンを押すとイベントが発火します
        var input = $("#meal_form").val(); // フォームの値を'input'という名前の変数に代入します
        $.ajax({
            type: 'GET', // リクエストのタイプはGETです
            url: '/meals', // URLは"/meals"を指定します
            data: {keyword: input}, // コントローラへフォームの値を送信します
            dataType: 'json' // データの型はjsonで指定します
        })
            .done(function (data) {
                // 通信に成功した場合の処理です
                $('.meal_list').empty(); //前回の検索結果が残っている場合はそれを消します
                data.forEach(function (meal) {
                    $('.meal_list').append(`<li>${meal.name} </li>`);
                }) //データは配列形式でかえってくるので、forEachで繰り返し処理をします
            })
            .fail(function () {
                // 通信に失敗した場合の処理です
                alert('検索に失敗しました') // alertで検索失敗の旨を表示します
            })
    })
})

// レシピ登録フォーム 手順追加時の自動付番
$(function () {
    $('.js-direction')
        .on('cocoon:after-insert', function () {
            $('[id^="recipe_directions_attributes_"][id*="_number"]').each(function (i) {
                $(this).val(i + 1);
            })
        })
});

// レシピ登録フォーム 手順削除時の自動付番
$(function () {
    $('.js-direction')
        .on('cocoon:after-remove', function () {
            $('[id^="recipe_directions_attributes_"][id*="_number"]').each(function (i) {
                $(this).val(i + 1);
            })
        })
});

// レシピ登録フォーム 初期読み込み時の自動付番
$(function () {
    $('[id^="recipe_directions_attributes_"][id*="_number"]').each(function (i) {
        $(this).val(i + 1);
    })
});

// Sortable
$(function () {
    $(".sortable").sortable({});
});

$(function () {
    $(".sortable").disableSelection();
});

$(function () {
    $(".sortable").sortable({
        update: function (ev, ui) {
            $('[id^="recipe_directions_attributes_"][id*="_number"]').each(function (i) {
                $(this).val(i + 1);
            })
        }
    });
});