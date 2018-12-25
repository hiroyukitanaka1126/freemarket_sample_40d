ladies, mens, kids, electronics, other = Category.create([{name: "レディース"}, {name: "メンズ"}, {name: "キッズ"}, {name: "電化製品"}, {name: "その他"}])

ladies_tops, ladies_outer, ladies_bottoms, ladies_shoes, ladies_bag, ladies_other = ladies.children.create([{name: "トップス"}, {name: "アウター"}, {name: "ボトムス"}, {name: "靴"}, {name: "カバン"}, {name: "その他"}])

ladies_tshirt, ladies_shirt, ladies_cutsew, ladies_other_tops = ladies_tops.children.create([{name: "Tシャツ"}, {name: "シャツ"}, {name: "カットソー"}, {name: "その他"}])

ladies_down, ladies_leather_jkt, ladies_tailored, ladies_denim_jkt, ladies_other_outer = ladies_outer.children.create([{name: "ダウン"}, {name: "レザー"}, {name: "テーラード"}, {name: "デニム"}, {name: "その他"}])

ladies_skirt, ladies_denim_btms, ladies_shorts, ladies_chino, ladies_other_btms = ladies_bottoms.children.create([{name: "スカート"}, {name: "デニム"}, {name: "短パン"}, {name: "チノ"}, {name: "その他"}])

ladies_sneaker, ladies_heel, ladies_leather_shoes, ladies_other_shoes = ladies_shoes.children.create([{name: "スニーカー"}, {name: "ハイヒール"}, {name: "レザー"}, {name: "その他"}])

ladies_backpack, ladies_other_bag = ladies_bag.children.create([{name: "バックパック"}, {name: "その他"}])

mens_tops, mens_outer, mens_bottoms, mens_shoes, mens_bag, mens_other = mens.children.create([{name: "トップス"}, {name: "アウター"}, {name: "ボトムス"}, {name: "靴"}, {name: "カバン"}, {name: "その他"}])

mens_tshirt, mens_shirt, mens_cutsew, mens_other_tops = mens_tops.children.create([{name: "Tシャツ"}, {name: "シャツ"}, {name: "カットソー"}, {name: "その他"}])

mens_down, mens_leather_jkt, mens_tailored, mens_denim_jkt, mens_other_outer = mens_other.children.create([{name: "ダウン"}, {name: "レザー"}, {name: "テーラード"}, {name: "デニム"}, {name: "その他"}])

mens_denim_btms, mens_chino, mens_shorts, mens_other_btms = mens_bottoms.children.create([{name: "デニム"}, {name: "チノ"}, {name: "短パン"}, {name: "その他"}])

mens_sneaker, mens_leather_shoes, mens_other_shoes = mens_shoes.children.create([{name: "スニーカー"}, {name: "レザー"}, {name: "その他"}])

mens_backpack, mens_other_bag = mens_bag.children.create([{name: "バックパック"}, {name: "その他"}])

boy, girl, toy, kids_other = kids.children.create([{name: "男の子"}, {name: "女の子"}, {name: "おもちゃ"}, {name: "その他"}])

pc, camera, house, game, electronics_other = electronics.children.create([{name: "PC"}, {name: "カメラ"}, {name: "家電"}, {name: "ゲーム"}, {name: "その他"}])

laptop, desktop, pc_other = pc.children.create([{name: "ラップトップ"}, {name: "デスクトップ"}, {name: "その他"}])

digital, film, camera_other = camera.children.create([{name: "デジタルカメラ"}, {name: "フィルムカメラ"}, {name: "その他"}])

fridge, tv, house_other = house.children.create([{name: "冷蔵庫"}, {name: "テレビ"}, {name: "その他"}])

console, soft = game.children.create([{name: "ゲーム機"}, {name: "ゲームソフト"}])


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
