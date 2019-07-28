header
nav.navbar.navbar-expand-lg
= link_to "ホーム", root_path, id: "logo", class: "navbar-brand text-white"
- if user_signed_in?
    button.navbar-toggler.mr-2[type="button" data-toggle="collapse" data-target="#navbarNav4" aria-controls="navbarNav4" aria-expanded="false" aria-label="Toggle navigation"]
    span.navbar-toggler-icon
    ul#navbarNav4.nav.navbar-nav.collapse.navbar-collapse.justify-content-end
    li.mr-3
    = link_to "マイレシピ", '#', class: "text-white"
    li.mr-3
    = link_to "レシピの作成", new_recipe_path, class: "text-white"
    li.nav-item.dropdown
    a#navbarDropdown.nav-link.dropdown-toggle aria-expanded="false" aria-haspopup="true" data-toggle="dropdown" href="#" role="button"
    | 会社情報
        .dropdown-menu aria-labelledby="navbarDropdown"
    li
    = link_to "ユーザ設定", '#', class: "text-white dropdown-item"
    li
    = link_to "登録情報", '#', class: "text-white dropdown-item"
                                    .dropdown-divider
    li
    = link_to "ログアウト", destroy_user_session_path, method: :delete, class: "text-white dropdown-item"
    / button.navbar-toggler.mr-2[type="button" data-toggle="collapse" data-target="#navbarNav4" aria-controls="navbarNav4" aria-expanded="false" aria-label="Toggle navigation"]
      /   span.navbar-toggler-icon
    / ul#navbarNav4.nav.navbar-nav.collapse.navbar-collapse.justify-content-end
      /   li.mr-3
    /     = link_to "Home", root_path, class: "text-white"
      /       li.mr-3
    /         = link_to "Users", '#', class: "text-white"
      /       li.mr-3
    /         = link_to "Create Recipe", new_recipe_path, class: "text-white"
      /       li.dropdown.open
    /         .dropdown-toggle.text-white[href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"]
      /         Account
    /         ul.dropdown-menu
      /           li
    /             = link_to "Setting", '#', class: "text-white dropdown-item"
      /         .dropdown-divider
    /       li
      /         = link_to "Log out", destroy_user_session_path, method: :delete, class: "text-white dropdown-item"
    /       li
      /         = link_to "Log in", new_user_session_path, class: "text-white dropdown-item"
    - else
        ul#navbarNav4.nav.navbar-nav.collapse.navbar-collapse.justify-content-end
        li
        = link_to "ログイン", new_user_session_path, class: "text-white dropdown-item"
        li
        = link_to "新規登録", new_user_registration_path, class: "text-white dropdown-item"

