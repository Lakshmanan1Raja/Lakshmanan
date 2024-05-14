
  create table aa(id int)
  insert into aa values(1),(2),(2),(null),(null),(3),(4),(5)
   create table bb(id int)
     insert into bb values (8)(2),(3),(3),(null),(4),(5)
	 --- union -- (it combines the two tables )
	 select * from aa
	 union
	 select * from bb
	 
	 select * from aa
	 union all
	 select * from bb

	 
	 select * from aa
	 intersect
	 select * from bb

	 
	 select * from aa
	 except
	 select * from bb

	 