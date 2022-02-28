USE AUDI_GO

SELECT *
FROM model;

INSERT INTO AUDI_GO.dbo.model(name, url, deleted, created, last_modified, base64_file_content, [order])
VALUES (
    'A8 L TFSI e',
    'https://www.audi.pl/pl/web/pl/modele/a8/a8-l-tfsi-e.html',
    0,
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    'base64_file_content',
    203
)
