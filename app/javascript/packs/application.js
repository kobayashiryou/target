import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"


Rails.start()
Turbolinks.start()
ActiveStorage.start()

// 作成したファイルをwebpackerに読み込ませます。
import "../stylesheets/application"
import "../js/hoge.js"

//= require jquery