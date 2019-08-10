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


$(function () {
    $("#submit_button").click(function () { //送信ボタンを押すとイベントが発火します
        var input = $("#ingredient_form").val(); // フォームの値を'input'という名前の変数に代入します

        $.ajax({
            type: 'GET', // リクエストのタイプはGETです
            url: '/recipes', // URLは"/ingredients"を指定します
            data: {keyword: input}, // コントローラへフォームの値を送信します
            dataType: 'json' // データの型はjsonで指定します
        })
            .done(function (data) {
                // 通信に成功した場合の処理です
                $('#ingredient-search-results').empty(); //前回の検索結果が残っている場合はそれを消します
                for (var i = 0; i < data.length; i++) {
                    let op = document.createElement("li");
                    op.value = data[i].id;  //value値
                    op.append(data[i].name);
                    document.getElementById("ingredient-search-results").appendChild(op);
                }
                //データは配列形式でかえってくるので、forEachで繰り返し処理をします
            })
            .fail(function () {
                // 通信に失敗した場合の処理です
                alert('検索に失敗しました') // alertで検索失敗の旨を表示します
            })
    })

    //材料入力 初回読み込み時のフォーム削除
    $(function () {
        document.querySelector("#second-form > div:nth-child(1) > div:nth-child(6) > div > div > div:nth-child(6) > a").click();
    });

// 検索時の処理
    $(function () {
        $(document).on('click', '#submit_button', function () {
            $('#open_modal').click();
            $('#add_ingredient_field').click();
        });
    });
// 材料選択時の処理
    $(function () {
        $(document).on('click', '#ingredient-search-results li', function () {
            var val = $(this).val();
            var tex = $(this).text();
            $('#myModal').modal('hide');
            $('[id^="recipe_ingredient_relations_attributes_"][id*="_id"]').each(function () {
                if ($(this).val() == "") {
                    $(this).val(val);
                }
            });
            $('#ingredient_name').each(function () {
                if ($(this).text() == "") {
                    $(this).text(tex);
                }
            });
            $('[id^="recipe_ingredient_relations_attributes_"][id*="_display_ingredient_name"]').each(function () {
                if ($(this).val() == "") {
                    $(this).val(tex);
                }
            });
            $('#ingredient_form').val('');
        });
    });
});