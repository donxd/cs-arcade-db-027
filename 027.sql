/*Please add ; after each select statement*/
CREATE PROCEDURE combinationLock()
BEGIN
    -- SELECT GROUP_CONCAT(LENGTH(characters) SEPARATOR ',') as combinations FROM discs;
    -- 
    -- SET @operations = 
    -- SET @query = SELECT CONCAT('SELECT (', ( SELECT GROUP_CONCAT(LENGTH(characters) SEPARATOR '*') as combinations FROM discs ) ,' ) as combinations');
    -- PREPARE stmt FROM @query;
    -- PREPARE stmt FROM 'SELECT CONCAT(\'SELECT (\', ( SELECT GROUP_CONCAT(LENGTH(characters) SEPARATOR \'*\') as combinations FROM discs ) ,' ) as combinations')';
    -- SELECT @operations := GROUP_CONCAT(LENGTH(characters) SEPARATOR '*') FROM discs;
    SET @operations := (SELECT GROUP_CONCAT(LENGTH(characters) SEPARATOR '*') FROM discs);
    -- SET @operations = '4*6';
    -- PREPARE stmt FROM 'SELECT (4*6) as combinations';
    -- PREPARE stmt FROM 'SELECT ? as combinations';
    SET @query = CONCAT('SELECT (', @operations, ') as combinations');
    PREPARE stmt FROM @query;
    -- EXECUTE stmt;
    EXECUTE stmt;
    -- SELECT @operations;
    -- SELECT 'fuuh';
END