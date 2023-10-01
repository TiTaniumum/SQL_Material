use myDB;
-- Data types
-- MySQL  - SQL/PSM
create table DataType(
	_bool bool,
    _bit bit,
    _tinyint tinyint, -- 0 - 255
    _smallint smallint, -- 
    _int int,
    _bigint bigint,
    _char char(100), -- 1 - 8000
    _varchar varchar(100), -- 1 - 8000 - max in mc sql (2GB)
    _nchar nchar(100), -- Unicode 1 - 4000
    _nvarchar nvarchar(100), -- Unicode 1 - 4000 - max in mc sql (2GB)
    _text text,
    -- _ntext ntext,
    _float float(53), -- default 53 - 8 byte
    _real real, -- like float(24)
    _datetime datetime, -- from 1 january 1753y to 31 december 9999y (2017-12-28 15:20:35693)
	-- _datetime2  datetime2 -- from 1 january 0001y to 31 december 9999y (2017-12-28 15:20:35 6930000)
    -- _datetimeoffset datetimeoffset  -- from 1 january 0001y to 31 december 9999y (2017-12-28 15:20:35 6930000 +00:00)
    -- _smalldatetime smalldatetime -- from 1 january 1900y to 6 june 2079y (2017-12-28 15:20:00)
    _date date, -- from 1 january 0001y to 31 december 9999y (2017-12-28)
    _time time, -- 00:00:00 0000000 - 23:59:59 9999999 (15:20:35 6930000)
    _decimal decimal(5,2), -- –10^38+1 to 10^38–1
    _numeric numeric(5,2), -- left (1-38) default=18; right (0-left)
    -- _money money -- from –922 337 203 685 477.5808 to 922 337203 685 477.5807
    -- _samllmoney smallmoney -- from –214 748.3648 to 214 748.3647      
	-- _binary binary(100), -- from 1 to 8000 
    _varbinary varbinary(100),  -- same
    _geometry geometry
    -- _geography geography
    -- _xml xml,
);

insert into DataType values
(true, 1, 124,32500, 200000, 2394895, 'hello', 'hello world', 'hello world', 'hello world', 'hello wold', 3.1415, 22, '2000-01-02', '2000-01-02', '15:20:35', 224.34, 224.34, 'skdjfkj',ST_GeomFromText('POINT(1 1)'));

select * from DataType;