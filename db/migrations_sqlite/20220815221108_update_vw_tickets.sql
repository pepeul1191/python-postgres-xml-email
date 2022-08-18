-- migrate:up

DROP VIEW vw_tickets;
CREATE VIEW vw_tickets AS 
  SELECT 
    T.id, T.resume, 
      strftime(T.created,'%Y/%m/%d') AS created, strftime(T.edited,'%Y/%m/%d') AS edited, 
      T.worker_id, (W.last_names || ', ' || W.names) AS worker_name, 
      T.priority_id, P.name AS priority_name,
      T.state_id, S.name AS state_name, 
      T.ticket_type_id, TT.name AS ticket_type_name, 
      T.branch_id, (BT.name || ', ' ||B.name) AS branch_name
  FROM tickets T 
  JOIN workers W ON W.id = T.worker_id
  JOIN priorities P ON P.id = T.priority_id
  JOIN states S ON S.id = T.state_id
  JOIN branches B ON B.id = T.branch_id 
  JOIN ticket_types TT ON TT.id = T.ticket_type_id 
  JOIN branch_types BT ON B.branch_type_id = BT.id
  ORDER BY T.created;

-- migrate:down

DROP VIEW vw_tickets;
CREATE VIEW vw_tickets AS 
  SELECT 
    T.id, T.resume, 
      strftime(T.created,'%Y/%m/%d') AS created, strftime(T.edited,'%Y/%m/%d') AS edited, 
      T.worker_id, CONCAT(W.last_names, ', ',W.names) AS worker_name, 
      T.priority_id, P.name AS priority_name,
      T.state_id, S.name AS state_name, 
      T.ticket_type_id, TT.name AS ticket_type_name, 
      T.branch_id, CONCAT(BT.name, ', ',B.name) AS branch_name
  FROM tickets T 
  JOIN workers W ON W.id = T.worker_id
  JOIN priorities P ON P.id = T.priority_id
  JOIN states S ON S.id = T.state_id
  JOIN branches B ON B.id = T.branch_id 
  JOIN ticket_types TT ON TT.id = T.ticket_type_id 
  JOIN branch_types BT ON B.branch_type_id = BT.id
  ORDER BY T.created;