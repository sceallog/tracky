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
locale_1.language_ja = '英語'
locale_1.save

locale_2 = Locale.second
locale_2.language_en = 'Japanese'
locale_2.language_ja = '日本語'
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

demo_dev = User.create!(name: 'Demo Developer', email: 'demo.dev@example.com', password: 'trackydemo', password_confirmation: 'trackydemo', role_id: 1, locale_id: 1)
demo_manager = User.create!(name: 'John Smith', email: 'jsmith@example.com', password: 'trackydemo', password_confirmation: 'trackydemo', role_id: 2, locale_id: 1)
user_1 = User.create!(name: 'Takeshi Yamada', email: 'tyamada@example.com', password: 'trackydemo', password_confirmation: 'trackydemo', role_id: 1, locale_id: 2)


demo_project = Project.create!(name: 'Tracky', description: 'A tracking web app for programming projects.', start_date: 8.days.ago, target_end_date: 4.weeks.from_now, user_id: demo_manager.id)

Ticket.create!([{
                title: 'Implement users and projects', 
                description: 'Allow users to sign up, login, and edit their profiles', 
                date_identified: 8.days.ago , 
                submitted_by: demo_manager.name, 
                target_resolution_date: 7.days.ago, 
                actual_resolution_date: 7.days.ago, 
                user_id: demo_dev.id, 
                project_id: demo_project.id, 
                status_id: status_3.id, 
                priority_id: priority_4.id, 
                type_id: type_2.id
                },
                {
                title: 'Add tickets to projects', 
                description: 'Allow users to create tickets for projects', 
                date_identified: 8.days.ago , 
                submitted_by: demo_manager.name, 
                target_resolution_date: 7.days.ago, 
                actual_resolution_date: 7.days.ago, 
                user_id: demo_dev.id, 
                project_id: demo_project.id, 
                status_id: status_3.id, 
                priority_id: priority_4.id, 
                type_id: type_2.id
                },
                {
                title: 'Add comments to tickets', 
                description: "Allow users to add comments to tickets and show them in the corresponding ticket's view", 
                date_identified: 8.days.ago , 
                submitted_by: demo_manager.name, 
                target_resolution_date: 7.days.ago, 
                actual_resolution_date: 7.days.ago, 
                user_id: demo_dev.id, 
                project_id: demo_project.id, 
                status_id: status_3.id, 
                priority_id: priority_4.id, 
                type_id: type_2.id
                },
                {
                title: 'Create delete dependency between projects & tickets', 
                description: 'Have all tickets of a project deleted when that project gets deleted', 
                date_identified: 7.days.ago , 
                submitted_by: demo_dev.name, 
                target_resolution_date: 7.days.ago, 
                actual_resolution_date: 7.days.ago, 
                user_id: user_1.id, 
                project_id: demo_project.id, 
                status_id: status_3.id, 
                priority_id: priority_4.id, 
                type_id: type_3.id
                },
                {
                title: 'Create delete dependency between tickets & comments', 
                description: 'Have all comments on a ticket deleted when that ticket gets deleted', 
                date_identified: 7.days.ago , 
                submitted_by: demo_dev.name, 
                target_resolution_date: 7.days.ago, 
                actual_resolution_date: 7.days.ago, 
                user_id: user_1.id, 
                project_id: demo_project.id, 
                status_id: status_3.id, 
                priority_id: priority_4.id, 
                type_id: type_3.id
                },
                {
                title: 'Allow users to change ordering of table contents', 
                description: "Give users the option to select in which order they would like to see tables such as a project's tickets", 
                date_identified: 7.days.ago , 
                submitted_by: user_1.name, 
                target_resolution_date: 5.days.ago, 
                actual_resolution_date: 6.days.ago, 
                user_id: demo_dev.id, 
                project_id: demo_project.id, 
                status_id: status_3.id, 
                priority_id: priority_2.id, 
                type_id: type_3.id
                },
                {
                title: 'Make everything look nice', 
                description: 'Give the site a nice layout', 
                date_identified: 7.days.ago , 
                submitted_by: demo_manager.name, 
                target_resolution_date: 6.days.ago, 
                actual_resolution_date: 7.days.ago, 
                user_id: user_1.id, 
                project_id: demo_project.id, 
                status_id: status_3.id, 
                priority_id: priority_2.id, 
                type_id: type_3.id
                },
                {
                title: 'Internationalisation', 
                description: "Add Japanese translations and change the app's code so that the website can be shown either in English or Japanese", 
                date_identified: 6.days.ago , 
                submitted_by: demo_manager.name, 
                target_resolution_date: 3.days.ago, 
                actual_resolution_date: 3.days.ago, 
                user_id: user_1.id, 
                project_id: demo_project.id, 
                status_id: status_3.id, 
                priority_id: priority_3.id, 
                type_id: type_3.id
                },
                {
                title: 'Implement a dashboard view', 
                description: "Show info such as open tickets, the number of tickets for each priority, etc. for the logged-in user and make that view the site's root", 
                date_identified: 6.days.ago , 
                submitted_by: demo_manager.name, 
                target_resolution_date: 5.days.ago, 
                actual_resolution_date: 5.days.ago, 
                user_id: demo_dev.id, 
                project_id: demo_project.id, 
                status_id: status_3.id, 
                priority_id: priority_4.id, 
                type_id: type_3.id
                },
                {
                title: 'Add pagination to all tables', 
                description: 'Have all tables paginate after a sensible amount of items', 
                date_identified: 6.days.ago , 
                submitted_by: user_1.name, 
                target_resolution_date: 5.days.ago, 
                actual_resolution_date: 4.days.ago, 
                user_id: demo_dev.id, 
                project_id: demo_project.id, 
                status_id: status_3.id, 
                priority_id: priority_1.id, 
                type_id: type_2.id
                },
                {
                title: 'Add roles for users', 
                description: 'Implement different roles such as developer or manager for users and integrate selection fields for them in forms where necessary', 
                date_identified: 6.days.ago , 
                submitted_by: demo_manager.name, 
                target_resolution_date: 6.days.ago, 
                actual_resolution_date: 5.days.ago, 
                user_id: demo_dev.id, 
                project_id: demo_project.id, 
                status_id: status_3.id, 
                priority_id: priority_4.id, 
                type_id: type_2.id
                },
                {
                title: 'Add status, priority, and type to tickets', 
                description: 'Give tickets a status on their progress, a priority on how urgent they need to be addressed, and types to divide them by;
                             integrate selection fields for them in forms and show them in corresponding views', 
                date_identified: 6.days.ago , 
                submitted_by: demo_manager.name, 
                target_resolution_date: 6.days.ago, 
                actual_resolution_date: 5.days.ago, 
                user_id: demo_dev.id, 
                project_id: demo_project.id, 
                status_id: status_3.id, 
                priority_id: priority_4.id, 
                type_id: type_2.id
                },
                {
                title: "Display selections in a user's language", 
                description: "Have selection menus like roles and language selection display their contents in the user's current language", 
                date_identified: 5.days.ago , 
                submitted_by: demo_dev.name, 
                target_resolution_date: 4.days.ago, 
                actual_resolution_date: 4.days.ago, 
                user_id: user_1.id, 
                project_id: demo_project.id, 
                status_id: status_3.id, 
                priority_id: priority_3.id, 
                type_id: type_3.id
                },
                {
                title: 'Refactor code in the controllers and models', 
                description: 'Clean up the code in the controllers and move logic to models where feasible', 
                date_identified: 4.days.ago , 
                submitted_by: demo_dev.name, 
                target_resolution_date: 2.days.ago, 
                actual_resolution_date: '', 
                user_id: demo_dev.id, 
                project_id: demo_project.id, 
                status_id: status_2.id, 
                priority_id: priority_1.id, 
                type_id: type_3.id
                },
                {
                title: "The charts on the dash aren't working", 
                description: "The charts on the dashboard aren't showing anymore!", 
                date_identified: 2.days.ago , 
                submitted_by: user_1.name, 
                target_resolution_date: 2.days.ago, 
                actual_resolution_date: 2.days.ago, 
                user_id: demo_dev.id, 
                project_id: demo_project.id, 
                status_id: status_3.id, 
                priority_id: priority_4.id, 
                type_id: type_1.id
                },
              )
