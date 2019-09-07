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
//= require jquery3
//= require activestorage
//= require_tree.
//= require popper
//= require bootstrap
//= require nested_form_fields
//= require cocoon
//= require jquery-ui
//= require rails-ujs

// レシピ作成画面 画像クリック時にファイル選択
$(function () {
    $(document).on('click', '#image_tag', function () {
        document.querySelector("#recipe_image").click();
    });
});

// 画像
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

        //既存の画像を非表示にして、追加した画像を表示する
        if ($('#img1').hasClass('hide')) {
            $('#img1').removeClass('hide') // #img1を削除
            $('#image_tag').addClass('hide') // #image_tagを削除
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

$(function() {
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                console.log('e.target.result');
                $('#img1').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    $("#myfile").change(function(){
        console.log('test');
        if ($('#img1').hasClass('hide')) {
            $('#img1').removeClass('hide') // #img1を削除
            $('#image_tag').addClass('hide') // #image_tagを削除
        }
        readURL(this);
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
    $(".sortable").sortable({items: '> div:not(.unsortable)' });
});

// 手順入れ替え時の自動付番
$(function () {
    $(".sortable").sortable({
        update: function (ev, ui) {
            $('[id^="recipe_directions_attributes_"][id*="_number"]').each(function (i) {
                $(this).val(i + 1);
            })
        }
    });
});

// 先頭の手順欄削除時に、スペースが空くのを防ぐ
$(function () {
    $(document).on('click', '#second-form > div.col-md-6.js-direction.sortable.ui-sortable > div.field.ui-sortable-handle > div > div > div:nth-child(3) > a', function () {
        $('.ui-sortable-handle').hide();
    });
});

// 材料検索時の処理
$(function () {
    $("#submit_button").click(function () { //送信ボタンを押すとイベントが発火します
        var input = $("#ingredient_form").val(); // フォームの値を'input'という名前の変数に代入します

        $.ajax({
            type: 'GET', // リクエストのタイプはGETです
            url: '/recipes',
            data: {keyword: input}, // コントローラへフォームの値を送信します
            dataType: 'json' // データの型はjsonで指定します
        })
            .done(function (data) {

                // 通信に成功した場合の処理です
                $('#loading').hide();
                $('#ingredient-search-results').empty(); //前回の検索結果が残っている場合はそれを消します
                for (var i = 0; i < data.length; i++) {
                    let op = document.createElement("li");
                    op.value = data[i].id;  //value値
                    op.append(data[i].name);
                    document.getElementById("ingredient-search-results").appendChild(op);
                }
                if (i == 0) {
                    let op = document.createElement("p");
                    op.append("検索条件に一致するデータが見つかりませんでした");
                    document.getElementById("ingredient-search-results").appendChild(op);
                }
                //データは配列形式でかえってくるので、forEachで繰り返し処理をします
            })
            .fail(function () {
                // 通信に失敗した場合の処理です
                $('#loading').hide();
                $('#ingredient-search-results').empty(); //前回の検索結果が残っている場合はそれを消します
                let op = document.createElement("p");
                op.append("検索に失敗しました");
                document.getElementById("ingredient-search-results").appendChild(op);
            })
    })

    //材料入力 初回読み込み時のフォーム削除（レシピ作成画面のみ）
    $(function(){
        if(document.URL.match(/new/)) {
            document.querySelector("#second-form > div:nth-child(1) > div:nth-child(5) > div > div.card-header.py-0 > div:nth-child(3) > a").click();
        }
    });

    var n = 0
// 検索時の処理
    $(function () {
        $(document).on('click', '#submit_button', function () {
            $('#open_modal').click();
        });
    });
// 材料選択時の処理
    $(function () {
        $(document).on('click', '#ingredient-search-results li', function () {
            $('#add_ingredient_field').click();
            var val = $(this).val();
            var tex = $(this).text();
            $('#myModal').modal('hide');
            $('[id^="recipe_ingredient_relations_attributes_"][id*="_ingredient_id"]').each(function () {
                if ($(this).val() == "") {
                    $(this).val(val);
                }
            });
            $('.ingredient_name').each(function () {
                if ($(this).text() == "") {
                    $(this).text(tex);
                }
            });
            $('[id^="recipe_ingredient_relations_attributes_"][id*="_display_ingredient_name"]').each(function () {
                if ($(this).val() == "") {
                    var array = tex;
                    var str = array.split('・');
                    $(this).val(str[0]);
                }
            });
            $('#ingredient_form').val('');
        });
    });
});

// 検索フォーム入力時のenterでsubmitしない
$(function(){
    $("input"). keydown(function(e) {
        if ((e.which && e.which === 13) || (e.keyCode && e.keyCode === 13)) {
            return false;
        } else {
            return true;
        }
    });
});

// 手順の入力でnullの場合、submitしない
$(function () {
    $(document).on('click', '.submit_recipe', function () {
        var result = 0;
        $('[id^="recipe_directions_attributes_"]').each(function () {
            if ($(this).val() == "") {
                result++;
                console.log(result);
            }
        });
        if (result == 0) {
            return true;    //送信ボタン本来の動作を実行します
        }else{
            alert("手順を入力してください");    //エラーメッセージを出力
            return false;
        }
    });
});