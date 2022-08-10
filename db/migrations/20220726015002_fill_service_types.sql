-- migrate:up

INSERT INTO service_types (id, name) VALUES
  (1,'AIRE ACONDICIONADO'), 
  (2,'CHAPAS Y CERRAJERÍA'), 
  (3,'CORTINAS / ROLLERS'), 
  (4,'ELECTRICIDAD'), 
  (5,'GASFITERÍA'), 
  (6,'LUMINARIAS'), 
  (7,'MOBILIARIO'), 
  (8,'PINTURA Y ACABADOS'), 
  (9,'PUERTAS Y ACCESORIOS'), 
  (10,'REMODELACIÓN'), 
  (11,'SERVICIOS HIGIÉNICOS'), 
  (12,'SILLAS / BANCAS'), 
  (13,'VENTILACIÓN / EXTRACCIÓN'), 
  (14,'VIDRERÍA / ACRILÍCOS'), 
  (15,'OTROS');

-- migrate:down

TRUNCATE service_types;