/*                                                                        */
/*              SampleDB.SQL - Creates the SampleDB database              */ 
/*                                                                        */
/*                                                                        */

SET NOCOUNT ON
GO

set nocount    on

USE master

declare @dttm VARCHAR(55)
select  @dttm=convert(VARCHAR,getdate(),102)
raiserror('SampleDB.SQL���� :  %s ',1,1,@dttm) with nowait

GO

if exists (select * from sysdatabases where name='SampleDB')
begin
  raiserror('������ �����ϴ� SampleDB�� �����ϴ� �� ....',0,1)
  DROP database SampleDB
end
GO

CHECKPOINT
go

raiserror('SampleDB database�� �����ϴ� ��....',0,1)
go

CREATE DATABASE SampleDB
GO

USE SampleDB
GO

if db_name() <> 'SampleDB'
   raiserror('SampleDB������..',0,1)

GO

-- 1. �������̺� ����
CREATE TABLE ����
(�й� CHAR(9) PRIMARY KEY,
 �̸� VARCHAR(20),
 ���� CHAR(2),
 ��   CHAR(10),
 ���� INT)    

INSERT INTO ���� VALUES('202101001','�ں���','��','A',90)
INSERT INTO ���� VALUES('202101002','������','��','A',75)
INSERT INTO ���� VALUES('202101003','�տ���','��','A',77)
INSERT INTO ���� VALUES('202101004','���ջ�','��','A',85)
INSERT INTO ���� VALUES('202101005','������','��','A',95)
INSERT INTO ���� VALUES('202101006','������','��','A',80)
INSERT INTO ���� VALUES('202101007','�ں���','��','A',95)
INSERT INTO ���� VALUES('202101008','��ȿ��','��','A',90)
INSERT INTO ���� VALUES('202101009','���߱�','��','A',83)
INSERT INTO ���� VALUES('202101010','�����','��','A',88)
INSERT INTO ���� VALUES('202101011','������','��','B',75)
INSERT INTO ���� VALUES('202101012','����ȣ','��','B',84)
INSERT INTO ���� VALUES('202101013','�ڽ���','��','B',80)
INSERT INTO ���� VALUES('202101014','������','��','B',94)
INSERT INTO ���� VALUES('202101015','�̽±�','��','B',78)
INSERT INTO ���� VALUES('202101016','�ڹο�','��','B',71)
INSERT INTO ���� VALUES('202101017','������','��','B',87)
INSERT INTO ���� VALUES('202101018','���¸�','��','B',90)
INSERT INTO ���� VALUES('202101019','������','��','B',94)
INSERT INTO ���� VALUES('202101020','������','��','B',78)

-- 2.���ǻ� ���̺� ����
 CREATE TABLE ���ǻ�
 (���ǻ��ڵ� CHAR(4) PRIMARY KEY,
  ���ǻ�� VARCHAR(30) NOT NULL,
  �ּ� VARCHAR(100),
  ��ȭ��ȣ CHAR(13))

  INSERT INTO ���ǻ� VALUES('P001','�����ǻ�','�λ�� ������','051-550-111')
  INSERT INTO ���ǻ� VALUES('P002','A&B���ǻ�','����� ���ϱ�','02-224-123')
  INSERT INTO ���ǻ� VALUES('P003','��������','����� ���α�','02-722-222')
  INSERT INTO ���ǻ� VALUES('P004','W���ǻ�','������ �߱�','042-112-333')
  INSERT INTO ���ǻ� VALUES('P005','Ǯ�����ǻ�','���� ���ֽ�','064-777-321')

-- 3.å ���̺� ����
CREATE TABLE å
(å�ڵ� CHAR(5) PRIMARY KEY,
 å���� VARCHAR(100) NOT NULL,
 �о� CHAR(10),
 ���ǻ��ڵ� CHAR(4) FOREIGN KEY REFERENCES ���ǻ�(���ǻ��ڵ�),
 ���� INT,
 �Ⱓ��¥ CHAR(7) NOT NULL)

INSERT INTO å VALUES('C1034','�Ľ�Ÿ�丮','�丮','P004',7500,'2011/05')
INSERT INTO å VALUES('C1051','�����ؿ丮','�丮','P003',10000,'2012/05')
INSERT INTO å VALUES('I2021','�ü��','��ǻ��','P001',12000,'2014/12')
INSERT INTO å VALUES('I2157','�ڹ����α׷���','��ǻ��','P003',12000,'2014/03')
INSERT INTO å VALUES('I2205','�ڷᱸ��','��ǻ��','P005',11500,'2013/02')
INSERT INTO å VALUES('E3089','��ȸ�� ������ ����','����','P004',12000,'2010/08')
INSERT INTO å VALUES('E3111','������ ������ǥ','����','P001',13000,'2012/11')
INSERT INTO å VALUES('E3324','�����п���','����','P002',15000,'2015/01')
INSERT INTO å VALUES('P4077','�ൿ�ǽɸ���','�ɸ�','P005',11500,'2014/09')
INSERT INTO å VALUES('P4101','�ɸ����� ����','�ɸ�','P002',12000,'2015/01')

-- 4. �а� ���̺� ����
CREATE TABLE �а�
(�а��ڵ� CHAR(2) PRIMARY KEY,
 �а��� CHAR(30) NOT NULL,
 ��ȭ CHAR(13) ) 
 
 INSERT INTO �а� VALUES('11','���Ʊ���','02-123-771')
 INSERT INTO �а� VALUES('12','��ǻ�Ͱ���','02-123-772')
 INSERT INTO �а� VALUES('13','��ǰ����','02-123-773')
 INSERT INTO �а� VALUES('14','�濵','02-123-774')
 INSERT INTO �а� VALUES('15','�����','02-123-775')

--5. ���� ���̺� ����
CREATE TABLE ����
(�����ڵ� CHAR(3) PRIMARY KEY,
 ������ CHAR(20) NOT NULL,
 �а��ڵ� CHAR(2) NOT NULL FOREIGN KEY REFERENCES �а�(�а��ڵ�),
 ������ CHAR(20) )
 INSERT INTO ���� VALUES('P01','�ڿ���','11','���ƽɸ�')
 INSERT INTO ���� VALUES('P02','��ö��','12','�˰���')
 INSERT INTO ���� VALUES('P03','���ҿ�','11','�Ƶ�����')
 INSERT INTO ���� VALUES('P04','�����','14','�繫')
 INSERT INTO ���� VALUES('P05','�質��','12','���')
 INSERT INTO ���� VALUES('P06','������','15','������')
 INSERT INTO ���� VALUES('P07','�ּ���','15','����������')
 INSERT INTO ���� VALUES('P08','������','14','������')
 INSERT INTO ���� VALUES('P09','���¿�','13','��ǰ��')
 INSERT INTO ���� VALUES('P10','������','13','�ӻ󿵾�')
 
 --6. ������ ���̺� ����
 CREATE TABLE ������
(�����ڵ� CHAR(4) PRIMARY KEY,
 ����� CHAR(30) NOT NULL,
 ��米�� CHAR(3) ) 
 INSERT INTO ������ VALUES('A101','��ǰ�����','P09')
 INSERT INTO ������ VALUES('A102','��ǰ�̻�����','P10')
 INSERT INTO ������ VALUES('K201','���������','P05')
 INSERT INTO ������ VALUES('K202','�ڹ����α׷���','P02')
 INSERT INTO ������ VALUES('C401','�Ƶ�������','P03')
 INSERT INTO ������ VALUES('C402','�����ƹߴ���','P01')
 INSERT INTO ������ VALUES('M301','�����ÿ���','P08')
 INSERT INTO ������ VALUES('M302','ȸ�����','T01')
 INSERT INTO ������ VALUES('E501','�ʱ޿��۹�','P06')
 INSERT INTO ������ VALUES('E502','�����а���','P07')

-- 7. ��ǰ ���̺� ����

CREATE TABLE ��ǰ
 (
 ��ǰ��ȣ INT PRIMARY KEY,
 ��ǰ�� CHAR(20),
 ���� CHAR(20),
 ���� CHAR(10),
 ���� INT
 )

 INSERT INTO ��ǰ VALUES(1,'����Ʈ','��Ʈ','BLACK',150000)
 INSERT INTO ��ǰ VALUES(2,'������Ʈ','��Ʈ','RED',130000)
 INSERT INTO ��ǰ VALUES(3,'¤������','����','BROWN',55000)
 INSERT INTO ��ǰ VALUES(4,'�ĵ�����','����','YELLOW',63000)
 INSERT INTO ��ǰ VALUES(5,'��������','����','BLACK',82000)
 INSERT INTO ��ǰ VALUES(6,'�ָ���ĿƮ','��ĿƮ','WHITE',65000)
 INSERT INTO ��ǰ VALUES(7,'�����������','����','WHITE',15000)
 INSERT INTO ��ǰ VALUES(8,'���콺','����','PINK',35000)
 INSERT INTO ��ǰ VALUES(9,'���ǽ�','���ǽ�','BLUE',95000)
 INSERT INTO ��ǰ VALUES(10,'�ݹ���','����','WHITE',35000)
 INSERT INTO ��ǰ VALUES(11,'�尩','�м���ȭ','RED',NULL)
 INSERT INTO ��ǰ VALUES(12,'�񵵸�','�м���ȭ','BEIGE',NULL)

 -- 8. �Ǹ��̺� ����
 CREATE TABLE �Ǹ�
 (
 �ǸŹ�ȣ INT IDENTITY,
 ��ǰ��ȣ INT FOREIGN KEY REFERENCES ��ǰ(��ǰ��ȣ),
 �Ǹż��� INT,
 �Ǹų�¥ CHAR(10) 
 )
 
 INSERT INTO �Ǹ� VALUES(1,10,'2022/02/11')
 INSERT INTO �Ǹ� VALUES(2,12,'2022/02/11')
 INSERT INTO �Ǹ� VALUES(2,15,'2022/02/12')
 INSERT INTO �Ǹ� VALUES(4,21,'2022/02/13')
 INSERT INTO �Ǹ� VALUES(7,17,'2022/02/16')
 INSERT INTO �Ǹ� VALUES(4,11,'2022/02/16')
 INSERT INTO �Ǹ� VALUES(10,3,'2022/02/17')

-- merge ������ ��� ���̺�, �ҽ� ���̺� ����
 CREATE TABLE ���
 (��� INT PRIMARY KEY,
 �̸� VARCHAR(10) NOT NULL,
 ���� VARCHAR(10) NOT NULL,
 �μ� CHAR(20) NOT NULL)
 
 INSERT INTO ��� VALUES(1,'ȫ�浿','����','ȫ����')
 INSERT INTO ��� VALUES(2,'�輱��','����','�λ��')
 INSERT INTO ��� VALUES(3,'�̵���','����','ȫ����')
  
 CREATE TABLE �ҽ�
 (��� INT PRIMARY KEY,
 �̸� VARCHAR(10) NOT NULL,
 ���� VARCHAR(10) NOT NULL,
 �μ� CHAR(20) NOT NULL)
 
 INSERT INTO �ҽ� VALUES(1,'ȫ�浿','����','���������ú�')
 INSERT INTO �ҽ� VALUES(3,'�̵���','����','ȫ����')
 INSERT INTO �ҽ� VALUES(4,'������','����','������')

 -- ���� ��Ȳ ���̺� ����
  CREATE TABLE ������Ȳ 

(��� CHAR(5),
  ����� VARCHAR(20) NOT NULL,
  ���� VARCHAR(20),
  �μ� CHAR(3),
  ���� CHAR(5))
INSERT INTO ������Ȳ VALUES('1','������','��ǥ�̻�','D00',null)
INSERT INTO ������Ȳ VALUES('2','�����','�Ϲݵ����̳�','D02','7')
INSERT INTO ������Ȳ VALUES('3','������','���α׷���','D01','10')
INSERT INTO ������Ȳ VALUES('4','������','�����øŴ���','D03','1')
INSERT INTO ������Ȳ VALUES('5','��ƶ�','�Ϲݵ����̳�','D02','7')
INSERT INTO ������Ȳ VALUES('6','Ȳ����','����','D03','4')
INSERT INTO ������Ȳ VALUES('7','���ҹ�','���������̳�','D02','1')
INSERT INTO ������Ȳ VALUES('8','������','����','D03','4')
INSERT INTO ������Ȳ VALUES('9','�ڼ���','���α׷���','D01','10')
INSERT INTO ������Ȳ VALUES('10','������','���α׷�����','D01','1')


 
 -- ������� ���̺� ����
CREATE TABLE �������(
 ��� int IDENTITY(1,1) NOT NULL,
 �̸� VARCHAR(10),
 �ñ� int,
 ���� int,
 �Ǹż��� int,
 Ŀ�̼� int,
 ���� VARCHAR(50)
)

INSERT INTO �������(�̸�,�ñ�,����) VALUES('ȫ�浿',8500,'��������')
INSERT INTO �������(�̸�,�ñ�,����) VALUES('�輱��',9000,'��������')
INSERT INTO �������(�̸�,�ñ�,����) VALUES('������',9000,'�����')
INSERT INTO �������(�̸�,����,����) VALUES('���е�',35000000,'ȫ������')
INSERT INTO �������(�̸�,����,����) VALUES('��ö��',34000000,'��������')
INSERT INTO �������(�̸�,�Ǹż���,����) VALUES('�̹���',1950,'����')

-- ������ ���̺� ����
create table ������
(�й� varchar(9) primary key,
�̸� varchar(20) not null,
���� int,
���̸� varchar(20) 
)
insert into ������ values('202101001','�ں���',81,'����Ʈ')
insert into ������ values('202101002','������',88,'�б�¯')
insert into ������ values('202101003','�տ���',85,'���ѵ���')
insert into ������ values('202101004','���ջ�',86,'������')
insert into ������ values('202101005','������',78,'������')
insert into ������ values('202101006','������',84,'���ѵ���')
insert into ������ values('202101007','�ں���',90,'������')
insert into ������ values('202101008','��ȿ��',87,'���ѵ���')
insert into ������ values('202101009','���߱�',93,'�б�¯')
insert into ������ values('202101010','�����',80,'�б�¯')
insert into ������ values('202101011','������',78,'����Ʈ')
insert into ������ values('202101012','����ȣ',94,'������')
insert into ������ values('202101013','�ڽ���',83,'������')
insert into ������ values('202101014','������',75,'�б�¯')
insert into ������ values('202101015','�̽±�',85,'����Ʈ')
insert into ������ values('202101016','�ڹο�',79,'������')
insert into ������ values('202101017','������',91,'���ѵ���')
insert into ������ values('202101018','���¸�',89,'������')
insert into ������ values('202101019','������',90,'����Ʈ')
insert into ������ values('202101020','������',81,'������')
 

-- ���ǰ�� ���̺� ����
 CREATE TABLE ���ǰ��
 (�̸� VARCHAR(10),
  ���� CHAR(4),
  ���� INT)

-- ���ǰ�� ������ �Է�

 INSERT ���ǰ�� VALUES('ȫ�浿','����',80)
 INSERT ���ǰ�� VALUES('ȫ�浿','����',90)
 INSERT ���ǰ�� VALUES('ȫ�浿','����',85)
 INSERT ���ǰ�� VALUES('�輱��','����',100)
 INSERT ���ǰ�� VALUES('�輱��','����',95)
 INSERT ���ǰ�� VALUES('�輱��','����',80)
 INSERT ���ǰ�� VALUES('ȫ�浿','����',80)
 INSERT ���ǰ�� VALUES('ȫ�浿','����',100)
 INSERT ���ǰ�� VALUES('ȫ�浿','����',97)
 INSERT ���ǰ�� VALUES('�輱��','����',100)
 INSERT ���ǰ�� VALUES('�輱��','����',90)
 INSERT ���ǰ�� VALUES('�輱��','����',85)
 

 CREATE TABLE ��������
(
��ǰ�� VARCHAR(20) NOT NULL, 
��  INT NOT NULL,
�Ǹŷ� INT NOT NULL)
INSERT INTO �������� VALUES('û����',1,15)
INSERT INTO �������� VALUES('�����������',1,10)
INSERT INTO �������� VALUES('��������',1,6)
INSERT INTO �������� VALUES('û����',2,22)
INSERT INTO �������� VALUES('�ĵ�����',2,11)
INSERT INTO �������� VALUES('�����������',2,8)
INSERT INTO �������� VALUES('û����',3,28)
INSERT INTO �������� VALUES('��������',3,7)
INSERT INTO �������� VALUES('�����������',3,17)

CREATE TABLE �б����
(�⵵ CHAR(4),
 �б� CHAR(10),
 �ݾ� INT)

INSERT INTO �б���� VALUES('2021','1�б�',100)
INSERT INTO �б���� VALUES('2021','2�б�',150)
INSERT INTO �б���� VALUES('2021','3�б�',200)
INSERT INTO �б���� VALUES('2021','4�б�',300)
INSERT INTO �б���� VALUES('2022','1�б�',150)
INSERT INTO �б���� VALUES('2022','2�б�',250)
INSERT INTO �б���� VALUES('2022','3�б�',200)
INSERT INTO �б���� VALUES('2022','4�б�',400)

  -- ��ǰ ���̺� ����
 CREATE TABLE ��ǰ
 (��ǰ�ڵ� CHAR(3) PRIMARY KEY,
  ��ǰ��   VARCHAR(15) NOT NULL,
  ����     INT NOT NULL,
  ������ INT DEFAULT 0)

-- �԰� ���̺� ����
 CREATE TABLE �԰�
 (�԰��ȣ INT IDENTITY,
  ��ǰ�ڵ� CHAR(3) FOREIGN KEY REFERENCES ��ǰ(��ǰ�ڵ�),
  �԰�¥ CHAR(10),
  �԰���� INT NOT NULL)

-- ��ǰ ���̺� ��ǰ ������ �߰�
 INSERT INTO ��ǰ VALUES('P01','��Ʈ��',980000,0)
 INSERT INTO ��ǰ VALUES('P02','������',180000,0)
 

CREATE TABLE ��������
(��ȣ INT IDENTITY,
 ��ǰ�ڵ� CHAR(3),
 ������ CHAR(10),
 �������� INT)

CREATE TABLE ��ǰ
(��ǰ�ڵ� CHAR(3),
 ��ǰ�� CHAR(20),
 ���� INT)

INSERT �������� VALUES('p01','ȫ�浿',10)
INSERT �������� VALUES('p02','������',5)
INSERT �������� VALUES('p01','�輱��',10)

INSERT ��ǰ VALUES('p01','�尩',20)
INSERT ��ǰ VALUES('p02','����',5)

CREATE TABLE ��
(��id CHAR(10) UNIQUE NOT NULL,
 ���� CHAR(20) NOT NULL,
 ����ó	CHAR(13) NOT NULL,
 ���ϸ��� INT,
 �������� CHAR(1))

  -- �����̺� ���÷��ڵ� �Է�
INSERT �� VALUES('111','��̰�','010-23-5645', 500, 0)
INSERT �� VALUES('222','ä���','010-73-1234' ,860, 0)

CREATE TABLE ��������
(��id CHAR(10) UNIQUE NOT NULL,
 ���� CHAR(20) NOT NULL,
 ����ó CHAR(13) NOT NULL) 



USE master

declare @dttm VARCHAR(55)
select  @dttm=convert(VARCHAR,getdate(),102)
raiserror('SampleDB.SQL�Ϸ� :  %s ',1,1,@dttm) with nowait

GO
