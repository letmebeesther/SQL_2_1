create table ����
(��ȣ int identity,
���� char(10) check(���� in ('�߽�','�н�','�ѽ�','���')),
���ĸ� char(20),
���� int)
insert ���� values('�߽�','¥���',6000),('�н�','������',5000),
('�н�','��ġ������',4500), 
('�ѽ�','��ġ�',7000),('�ѽ�','�����',7000),
('�ѽ�','���߶�����',6000),('�߽�','«��',6500),
('���','����',13000),('�н�','���',3000),
('���','�丶�佺�İ�Ƽ',8000)

create table ȸ��
(���̵�  char(10) primary key,
�̸� char(20) ,
�ּ� char(50))
insert ȸ�� values('jsk98','���ּ�','�ϻ�� ����'),('bird123','�ֿ���','����� ������'),
('angel','�̹ΰ�','����� ��������')

select * from ����

-- 1. '¥���' ���� ������ ����ϴ� ����
select * from ���� where ���ĸ� = '¥���'

-- 2. '�߽�' ���� ������ ����ϴ� ����
select * from ���� where ���� = '�߽�'

-- 3. '������' ���� ������ ����ϴ� ���� (���ϵ�ī��)
select * from ���� where ���ĸ� like '%������%'

-- 4. ���� ������ ���������� ���ĸ�� ������ ����ϴ� ����
select ����,min(����) �������� from ����
group by ����

-- 5. �߽� ���� ������ ���ݼ� ������������ �����Ͽ� ����ϴ� ����
select * from ���� where ���� = '�߽�'
order by ���� desc

-- 6. ¥���, «��, ���� ���� ������ ����ϴ� ����
select * from ���� where ���ĸ� in ('¥���','«��','����')

--7. ���̺� titles�� publishers�� �����Ͽ� title, pub_name, price�� ����Ͻÿ�. (pubs)
select * from titles
select * from publishers

select title,pub_name,price
from titles join publishers
on titles.pub_id = publishers.pub_id

--8. ���̺� å, ���ǻ縦 ������� �丮 �о��� å�� �����ϴ� ���ǻ� ���� ����Ͻÿ�.(��������, sampleDB)
select * from å
select * from ���ǻ�

select ���ǻ�� from ���ǻ� 
where ���ǻ��ڵ� in (select ���ǻ��ڵ� from å where �о� = '�丮')

-- 9. ���� ������ ������� ���̺� '#�л�'�� �����Ͻÿ�.
create table #�л�(��ȣ int, �̸� char(20), ���� char(30))
select * from #�л�

--10. ���̺� 'å'�� ������� ���纻 '#å'�� �����Ͻÿ�.