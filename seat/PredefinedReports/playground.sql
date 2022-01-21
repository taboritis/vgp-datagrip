SELECT r2.id, r2.name, ar.id, ar.name
FROM access_rights_roles arr
INNER JOIN access_right ar ON ar.id = arr.access_right_id
INNER JOIN role r2 ON r2.id = arr.role_id


SELECT *
FROM access_rights_roles;