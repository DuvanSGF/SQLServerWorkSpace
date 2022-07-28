--Geometry
Begin tran
CREATE TABLE tblGeom(
id int CONSTRAINT PK_tblGeom primary Key Identity(1,1),
GXY geometry,
Description varchar(100)
)
INSERT INTO tblGeom
values(geometry::STGeomFromText('POINT (3 4)',0), 'FirstPoint'),(geometry::Point(4,6,0), 'SecondPoint'),(geometry::STGeomFromText('POLYGON ((4 1, 6 3, 8 3, 6 1, 4 1))', 0), 'Polygon')
Select * from tblGeom
Rollback tran

GO
