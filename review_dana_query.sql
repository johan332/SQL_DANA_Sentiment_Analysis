create table review_dana(
User_name CHAR,
Score INT,
Content CHAR,
Sentimen CHAR,
Date date,
Month_name CHAR,
Year INT
);

alter table review_dana alter column user_name type VARCHAR (300);

alter table review_dana alter column content type VARCHAR (1000);

alter table review_dana alter column sentimen type VARCHAR (300);

alter table review_dana alter column month_name type VARCHAR (50);

--View all data
select
*
from review_dana;

--Counting how many reviewers in total
select
count(*) as count_user
from
review_dana;

--Counting how many user_name in every year
select
year,
count(*) as count_users
from
review_dana
group by 1;

--Finding for score percentage in 2024
select
score,
count(*) as count_users,
round(100*count(*)/sum(count(*)) over(),2) || '%' as percentage
from
review_dana
where year=2024
group by 1
order by 1 desc;

--Finding how many user and percentage in every sentimen and every year
select
year,
sentimen,
count(*) as count_users,
round(100*count(*)/sum(count(*)) over(),2) || '%' as percentage
from
review_dana
group by 1,2
order by 1,3 asc;