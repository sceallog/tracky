# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

roles = Role.create([{ title: 'Developer' }, { title: 'Manager' }])

statuses = Status.create([{ name: 'Open' }, { name: 'In Progress' }, { name: 'Resolved' }, { name: 'Additional Info Required' }])

priorities = Priority.create([{ name: 'None' }, { name: 'Low' }, { name: 'Medium' }, { name: 'High' }])

locales = Locale.create([{ language: 'English', locale: 'en' }, { language: 'Japanese', locale: 'ja' }])

types = Type.create([{ name: 'Bugs/Errors' }, { name: 'Feature Requests' }, { name: 'Other' }])

locale_1 = Locale.first
locale_1.language_en = 'English'
locale_1.locale_en = 'en'
locale_1.language_ja = '英語'
locale_1.locale_ja = 'ja'
locale_1.save

locale_2 = Locale.second
locale_2.language_en = 'Japanese'
locale_2.locale_en = 'en'
locale_2.language_ja = '日本語'
locale_2.locale_ja = 'ja'
locale_2.save

role_1 = Role.first
role_1.title_en = 'Developer'
role_1.title_ja = '開発者'
role_1.save

role_2 = Role.second
role_2.title_en = 'Manager'
role_2.title_ja = 'マネージャー'
role_2.save

status_1 = Status.first
status_1.name_en = 'Open'
status_1.name_ja = '未解決'
status_1.save

status_2 = Status.second
status_2.name_en = 'In Progress'
status_2.name_ja = '進行中'
status_2.save

status_3 = Status.third
status_3.name_en = 'Resolved'
status_3.name_ja = '解決済'
status_3.save

status_4 = Status.fourth
status_4.name_en = 'More Info Required'
status_4.name_ja = '情報必要'
status_4.save

priority_1 = Priority.first
priority_1.name_en = 'None'
priority_1.name_ja = 'なし'
priority_1.save

priority_2 = Priority.second
priority_2.name_en = 'Low'
priority_2.name_ja = '低'
priority_2.save

priority_3 = Priority.third
priority_3.name_en = 'Medium'
priority_3.name_ja = '中'
priority_3.save

priority_4 = Priority.fourth
priority_4.name_en = 'High'
priority_4.name_ja = '高'
priority_4.save

type_1 = Type.first
type_1.name_en = 'Bugs/Errors'
type_1.name_ja = 'バグ・エラー'
type_1.save

type_2 = Type.second
type_2.name_en = 'Feature Requests'
type_2.name_ja = '機能追加'
type_2.save

type_3 = Type.third
type_3.name_en = 'Other'
type_3.name_ja = 'その他'
type_3.save
