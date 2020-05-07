use Demo;
-- tao chi muc index_id 
CREATE UNIQUE INDEX index_id
ON Demo.Products (id); 
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index indexName_Price 
on Demo.Products(productName,productPrice);
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
-- So sánh câu truy vấn trước và sau khi tạo index
explain select * from Demo.Products
where id > 5;
explain select * from Demo.Products
where productName =  'trung';
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.

-- Tiến hành xoá view
use Demo;
CREATE VIEW VIEW_PRIDUCTS as
select Products.productCode,Products.productName,Products.productPrice,Products.productStatus
from Products;
select * from VIEW_PRIDUCTS;
-- Tiến hành sửa đổi view
update VIEW_PRIDUCTS
set productName = 'thit cho'
where productCode = 'msp1';
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure getInfoProduct(in ID_product int)
begin
select * from Products where id > ID_product;
end //
delimiter ;
call getInfoProduct(0);
-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure addProduct(in id int,msp varchar(50),gia float,ghi_chu varchar(50),status bit)
begin
insert into Products values (7,'msp7','thit lon',80000,15,'thit lon an rat ngon',0);
insert into Products values (8,'msp8','thit baba',200000,6,'thit baba an rat ngon',1);
insert into Products values (9,'msp9','tom hum',800000,7,'tom hum an cuc ki ngon',1);
end //
delimiter ;
call addProduct();
-- Tạo store procedure sửa thông tin sản phẩm theo name
delimiter //
create procedure editProduct()
begin
update Products
set id = 10 where productName = 'tom hum'; 
end //
delimiter ;
call editProduct();
-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure removeProduct(in id_product int)
begin
delete from Products where id = id_product;
end //
delimiter ;
call removeProduct(8);