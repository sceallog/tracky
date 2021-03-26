json.projects do
  json.array!(@projects) do |project|
    json.name project.name
    json.url project_path(project)
  end
end

json.tickets do
  json.array!(@tickets) do |ticket|
    json.name ticket.title
    json.url ticket_path(ticket)
  end
end
