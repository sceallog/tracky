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

demo_dev = User.create!(name: 'Demo Developer', email: 'demo.dev@example.com', password: 'trackydemo', password_confirmation: 'trackydemo', role_id: 1, locale_id: 2)
demo_manager = User.create!(name: 'John Smith', email: 'jsmith@example.com', password: 'trackydemo', password_confirmation: 'trackydemo', role_id: 2, locale_id: 1, admin: true)
user_1 = User.create!(name: 'Takeshi Yamada', email: 'tyamada@example.com', password: 'trackydemo', password_confirmation: 'trackydemo', role_id: 1, locale_id: 2)

demo_project = Project.create!(name: 'Tracky', description: 'A tracking web app for programming projects.', start_date: 8.days.ago, target_end_date: 4.weeks.from_now, user_id: demo_dev.id, created_at: 8.days.ago)

Ticket.create!([{
                 title: 'Implement users and projects',
                 description: 'Allow users to sign up, login, and edit their profiles',
                 date_identified: 8.days.ago,
                 submitted_by: demo_manager.name,
                 target_resolution_date: 7.days.ago,
                 actual_resolution_date: 7.days.ago,
                 user_id: demo_dev.id,
                 project_id: demo_project.id,
                 status_id: status_3.id,
                 priority_id: priority_4.id,
                 type_id: type_2.id,
                 created_at: 8.days.ago
               },
                {
                  title: 'Add tickets to projects',
                  description: 'Allow users to create tickets for projects',
                  date_identified: 8.days.ago,
                  submitted_by: demo_manager.name,
                  target_resolution_date: 7.days.ago,
                  actual_resolution_date: 7.days.ago,
                  user_id: demo_dev.id,
                  project_id: demo_project.id,
                  status_id: status_3.id,
                  priority_id: priority_4.id,
                  type_id: type_2.id,
                  created_at: 8.days.ago + 32.minutes
                },
                {
                  title: 'Add comments to tickets',
                  description: "Allow users to add comments to tickets and show them in the corresponding ticket's view",
                  date_identified: 8.days.ago,
                  submitted_by: demo_manager.name,
                  target_resolution_date: 7.days.ago,
                  actual_resolution_date: 7.days.ago,
                  user_id: demo_dev.id,
                  project_id: demo_project.id,
                  status_id: status_3.id,
                  priority_id: priority_4.id,
                  type_id: type_2.id,
                  created_at: 8.days.ago + 5.hours + 14.minutes
                },
                {
                  title: 'Create delete dependency between projects & tickets',
                  description: 'Have all tickets of a project deleted when that project gets deleted',
                  date_identified: 7.days.ago,
                  submitted_by: demo_dev.name,
                  target_resolution_date: 7.days.ago,
                  actual_resolution_date: 7.days.ago,
                  user_id: user_1.id,
                  project_id: demo_project.id,
                  status_id: status_3.id,
                  priority_id: priority_4.id,
                  type_id: type_3.id,
                  created_at: 7.days.ago
                },
                {
                  title: 'Create delete dependency between tickets & comments',
                  description: 'Have all comments on a ticket deleted when that ticket gets deleted',
                  date_identified: 7.days.ago,
                  submitted_by: demo_dev.name,
                  target_resolution_date: 7.days.ago,
                  actual_resolution_date: 7.days.ago,
                  user_id: user_1.id,
                  project_id: demo_project.id,
                  status_id: status_3.id,
                  priority_id: priority_4.id,
                  type_id: type_3.id,
                  created_at: 7.days.ago
                },
                {
                  title: 'Allow users to change ordering of table contents',
                  description: "Give users the option to select in which order they would like to see tables such as a project's tickets",
                  date_identified: 7.days.ago,
                  submitted_by: user_1.name,
                  target_resolution_date: 5.days.ago,
                  actual_resolution_date: 6.days.ago,
                  user_id: demo_dev.id,
                  project_id: demo_project.id,
                  status_id: status_3.id,
                  priority_id: priority_2.id,
                  type_id: type_3.id,
                  created_at: 7.days.ago + 2.hours - 3.minutes
                },
                {
                  title: 'Make everything look nice',
                  description: 'Give the site a nice layout',
                  date_identified: 7.days.ago,
                  submitted_by: demo_manager.name,
                  target_resolution_date: 6.days.ago,
                  actual_resolution_date: 7.days.ago,
                  user_id: user_1.id,
                  project_id: demo_project.id,
                  status_id: status_3.id,
                  priority_id: priority_2.id,
                  type_id: type_3.id,
                  created_at: 7.days.ago - 15.hours
                },
                {
                  title: 'Internationalisation',
                  description: "Add Japanese translations and change the app's code so that the website can be shown either in English or Japanese",
                  date_identified: 6.days.ago,
                  submitted_by: demo_manager.name,
                  target_resolution_date: 3.days.ago,
                  actual_resolution_date: 3.days.ago,
                  user_id: user_1.id,
                  project_id: demo_project.id,
                  status_id: status_3.id,
                  priority_id: priority_3.id,
                  type_id: type_3.id,
                  created_at: 6.days.ago + 2.hours + 57.minutes
                },
                {
                  title: 'Implement a dashboard view',
                  description: "Show info such as open tickets, the number of tickets for each priority, etc. for the logged-in user and make that view the site's root",
                  date_identified: 6.days.ago,
                  submitted_by: demo_manager.name,
                  target_resolution_date: 5.days.ago,
                  actual_resolution_date: 5.days.ago,
                  user_id: demo_dev.id,
                  project_id: demo_project.id,
                  status_id: status_3.id,
                  priority_id: priority_4.id,
                  type_id: type_3.id,
                  created_at: 6.days.ago + 35.minutes
                },
                {
                  title: 'Add pagination to all tables',
                  description: 'Have all tables paginate after a sensible amount of items',
                  date_identified: 6.days.ago,
                  submitted_by: user_1.name,
                  target_resolution_date: 5.days.ago,
                  actual_resolution_date: 4.days.ago,
                  user_id: demo_dev.id,
                  project_id: demo_project.id,
                  status_id: status_3.id,
                  priority_id: priority_1.id,
                  type_id: type_2.id,
                  created_at: 6.days.ago + 4.hours + 3.minutes
                },
                {
                  title: 'Add roles for users',
                  description: 'Implement different roles such as developer or manager for users and integrate selection fields for them in forms where necessary',
                  date_identified: 6.days.ago,
                  submitted_by: demo_manager.name,
                  target_resolution_date: 6.days.ago,
                  actual_resolution_date: 5.days.ago,
                  user_id: demo_dev.id,
                  project_id: demo_project.id,
                  status_id: status_3.id,
                  priority_id: priority_4.id,
                  type_id: type_2.id,
                  created_at: 6.days.ago + 7.hours - 8.minutes
                },
                {
                  title: 'Add status, priority, and type to tickets',
                  description: 'Give tickets a status on their progress, a priority on how urgent they need to be addressed, and types to divide them by;
                             integrate selection fields for them in forms and show them in corresponding views',
                  date_identified: 6.days.ago,
                  submitted_by: demo_manager.name,
                  target_resolution_date: 6.days.ago,
                  actual_resolution_date: 5.days.ago,
                  user_id: demo_dev.id,
                  project_id: demo_project.id,
                  status_id: status_3.id,
                  priority_id: priority_4.id,
                  type_id: type_2.id,
                  created_at: 6.days.ago + 7.hours + 42.minutes
                },
                {
                  title: "Display selection items in a user's language",
                  description: "Have selection menus like roles and language selection show their contents in the user's current language",
                  date_identified: 5.days.ago,
                  submitted_by: demo_dev.name,
                  target_resolution_date: 4.days.ago,
                  actual_resolution_date: 4.days.ago,
                  user_id: user_1.id,
                  project_id: demo_project.id,
                  status_id: status_3.id,
                  priority_id: priority_3.id,
                  type_id: type_3.id,
                  created_at: 5.days.ago + 4.hours + 51.minutes
                },
                {
                  title: 'Refactor code in the controllers and models',
                  description: 'Clean up the code in the controllers and move logic to models where feasible',
                  date_identified: 4.days.ago,
                  submitted_by: demo_dev.name,
                  target_resolution_date: 2.days.ago,
                  actual_resolution_date: '',
                  user_id: demo_dev.id,
                  project_id: demo_project.id,
                  status_id: status_2.id,
                  priority_id: priority_1.id,
                  type_id: type_3.id,
                  created_at: 4.days.ago + 1.hour + 17.minutes
                },
                {
                  title: "The charts on the dash aren't working",
                  description: "The charts on the dashboard aren't showing anymore!",
                  date_identified: 2.days.ago,
                  submitted_by: demo_manager.name,
                  target_resolution_date: 2.days.ago,
                  actual_resolution_date: 2.days.ago,
                  user_id: demo_dev.id,
                  project_id: demo_project.id,
                  status_id: status_4.id,
                  priority_id: priority_4.id,
                  type_id: type_1.id,
                  created_at: 2.days.ago
                },
                {
                  title: 'Add a demo user',
                  description: 'Add a demo user for potential users to try the app before signing up.',
                  date_identified: 1.day.ago,
                  submitted_by: demo_manager.name,
                  target_resolution_date: 2.days.from_now,
                  actual_resolution_date: '',
                  user_id: demo_dev.id,
                  project_id: demo_project.id,
                  status_id: status_1.id,
                  priority_id: priority_3.id,
                  type_id: type_2.id,
                  created_at: 1.day.ago + 7.hours - 34.minutes
                }])
Comment.create!([{
                  commenter: demo_dev.name,
                  message: 'User login and signup work',
                  ticket_id: Ticket.find_by(title: 'Implement users and projects').id,
                  created_at: 8.days.ago + 40.minutes
                },
                 {
                   commenter: user_1.name,
                   message: 'Projects are in, too',
                   ticket_id: Ticket.find_by(title: 'Implement users and projects').id,
                   created_at: 8.days.ago + 1.hour + 20.minutes
                 },
                 {
                   commenter: demo_dev.name,
                   message: 'Added the profile edit page',
                   ticket_id: Ticket.find_by(title: 'Implement users and projects').id,
                   created_at: 7.days.ago - 5.minutes
                 },
                 {
                   commenter: demo_dev.name,
                   message: 'Added Ticket model and migrated the database',
                   ticket_id: Ticket.find_by(title: 'Add tickets to projects').id,
                   created_at: 7.days.ago - 6.hours
                 },
                 {
                   commenter: user_1.name,
                   message: 'Added new and edit views',
                   ticket_id: Ticket.find_by(title: 'Add tickets to projects').id,
                   created_at: 7.days.ago - 5.hours + 24.minutes
                 },
                 {
                   commenter: user_1.name,
                   message: "Added overview of a project's tickets to that project's show page",
                   ticket_id: Ticket.find_by(title: 'Add tickets to projects').id,
                   created_at: 7.days.ago - 2.hours - 54.minutes
                 },
                 {
                   commenter: demo_dev.name,
                   message: 'Added the Comment model and migrated the database',
                   ticket_id: Ticket.find_by(title: 'Add comments to tickets').id,
                   created_at: 7.days.ago - 4.hours - 10.minutes
                 },
                 {
                   commenter: demo_dev.name,
                   message: 'Added a form for new comments and a table with all comments of a ticket to the ticket show page',
                   ticket_id: Ticket.find_by(title: 'Add comments to tickets').id,
                   created_at: 7.days.ago - 1.hour
                 },
                 {
                   commenter: demo_dev.name,
                   message: 'Added necessary JavaScript for all tables',
                   ticket_id: Ticket.find_by(title: 'Allow users to change ordering of table contents').id,
                   created_at: 6.days.ago - 12.minutes
                 },
                 {
                   commenter: demo_dev.name,
                   message: "Completely overhauled the site's layout and structure",
                   ticket_id: Ticket.find_by(title: 'Make everything look nice').id,
                   created_at: 7.days.ago - 12.hours
                 },
                 {
                   commenter: demo_manager.name,
                   message: "Let's make the prominent colour some kind of teal",
                   ticket_id: Ticket.find_by(title: 'Make everything look nice').id,
                   created_at: 7.days.ago - 3.hours - 43.minutes
                 },
                 {
                   commenter: demo_dev.name,
                   message: 'Changed the colour, plus all tables look nicer. The rows are clickable, too.',
                   ticket_id: Ticket.find_by(title: 'Make everything look nice').id,
                   created_at: 7.days.ago - 2.hours + 2.minutes
                 },
                 {
                   commenter: demo_manager.name,
                   message: 'Looks good, but the buttons are odd. Please fix them.',
                   ticket_id: Ticket.find_by(title: 'Make everything look nice').id,
                   created_at: 7.days.ago - 1.hour
                 },
                 {
                   commenter: user_1.name,
                   message: 'Fixed the buttons.',
                   ticket_id: Ticket.find_by(title: 'Make everything look nice').id,
                   created_at: 7.days.ago - 24.minutes
                 },
                 {
                   commenter: user_1.name,
                   message: 'All strings are localised.',
                   ticket_id: Ticket.find_by(title: 'Internationalisation').id,
                   created_at: 4.days.ago - 3.hours + 4.minutes
                 },
                 {
                   commenter: demo_dev.name,
                   message: "The locale change logic works, but switching the language doesn't yet.",
                   ticket_id: Ticket.find_by(title: 'Internationalisation').id,
                   created_at: 4.days.ago - 3.hours + 20.minutes
                 },
                 {
                   commenter: demo_dev.name,
                   message: 'Switching the language works now.',
                   ticket_id: Ticket.find_by(title: 'Internationalisation').id,
                   created_at: 4.days.ago - 2.hours + 32.minutes
                 },
                 {
                   commenter: user_1.name,
                   message: "Fixed a problem with flash messages' translations not showing correctly.",
                   ticket_id: Ticket .find_by(title: 'Internationalisation').id,
                   created_at: 3.days.ago - 3.hours + 47.minutes
                 },
                 {
                   commenter: demo_dev.name,
                   message: 'All tables paginate, the amount of items shown at once depends on the page.',
                   ticket_id: Ticket.find_by(title: 'Add pagination to all tables').id,
                   created_at: 4.days.ago - 2.hours + 30.minutes
                 },
                 {
                   commenter: user_1.name,
                   message: 'Role and language selectors show in the correct language.',
                   ticket_id: Ticket.find_by(title: "Display selection items in a user's language").id,
                   created_at: 5.days.ago + 8.hours
                 },
                 {
                   commenter: user_1.name,
                   message: 'Importance, type, and status of tickets now also show in the correct language.',
                   ticket_id: Ticket.find_by(title: "Display selection items in a user's language").id,
                   created_at: 4.days.ago - 3.hours + 34.minutes
                 },
                 {
                   commenter: demo_dev.name,
                   message: 'Added tables with info on recently added projects and tickets.',
                   ticket_id: Ticket.find_by(title: 'Implement a dashboard view').id,
                   created_at: 6.days.ago + 3.hours + 8.minutes
                 },
                 {
                   commenter: demo_manager.name,
                   message: 'Can I get some charts showing the numbers of tickets according to status etc., please?',
                   ticket_id: Ticket.find_by(title: 'Implement a dashboard view').id,
                   created_at: 6.days.ago + 4.hours - 13.minutes
                 },
                 {
                   commenter: demo_dev.name,
                   message: 'Done.',
                   ticket_id: Ticket.find_by(title: 'Implement a dashboard view').id,
                   created_at: 5.days.ago - 5.hours + 43.minutes
                 },
                 {
                   commenter: demo_manager.name,
                   message: 'Thanks. Could you change the colours so they look a little more vibrant?',
                   ticket_id: Ticket.find_by(title: 'Implement a dashboard view').id,
                   created_at: 5.days.ago - 2.hours - 31.minutes
                 },
                 {
                   commenter: demo_dev.name,
                   message: 'Moved most of the logic in the pages controller to the according models.',
                   ticket_id: Ticket.find_by(title: 'Refactor code in the controllers and models').id,
                   created_at: 4.days.ago + 7.hours - 24.minutes
                 },
                 {
                   commenter: demo_dev.name,
                   message: "Refactored logic to find a project's open tickets from the view(!!!) into the Project model.",
                   ticket_id: Ticket.find_by(title: 'Refactor code in the controllers and models').id,
                   created_at: 3.days.ago + 8.hours - 53.minutes
                 },
                 {
                   commenter: demo_manager.name,
                   message: "Since the refactoring, the charts arent't working anymore. Can someone please fix this asap?",
                   ticket_id: Ticket.find_by(title: "The charts on the dash aren't working").id,
                   created_at: 2.days.ago + 3.minutes
                 },
                 {
                   commenter: user_1.name,
                   message: "Fixed it. The values weren't returned correctly because of the move.",
                   ticket_id: Ticket.find_by(title: "The charts on the dash aren't working").id,
                   created_at: 2.days.ago + 2.hours + 4.minutes
                 }])
