json.projects do
  json.array!(@projects) do |project|
    json.resource_name project.model_name.human
    json.name project.name
    json.url project_path(project)
  end
end

json.tickets do
  json.array!(@tickets) do |ticket|
    json.resource_name ticket.model_name.human
    json.name ticket.title
    json.url ticket_path(ticket)
  end
end
