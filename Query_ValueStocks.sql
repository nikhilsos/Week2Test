select distinct on (company) company
  from ( select company, fiscal_year 
              , lead( fiscal_year,1) over( partition by company order by fiscal_year) nrow
              , lead( fiscal_year,2) over( partition by company order by fiscal_year) n2nrow               
           from dividend
       ) als
   where nrow-fiscal_year=10001  and n2nrow-nrow=10001
