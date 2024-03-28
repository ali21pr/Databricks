-- Databricks notebook source
SELECT * FROM default.wa_fn_use_c_hr_employee_attrition


-- COMMAND ----------

SELECT SUM(EmployeeCount) FROM default.wa_fn_use_c_hr_employee_attrition

-- COMMAND ----------

-- MAGIC %md
-- MAGIC FIND OUT ATTRITION DIVISION 
-- MAGIC

-- COMMAND ----------

SELECT SUM(EmployeeCount), attrition from wa_fn_use_c_hr_employee_attrition
group by 2

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Age Analisys

-- COMMAND ----------

SELECT SUM(EmployeeCount), 
CASE WHEN Age BETWEEN 18 AND 24 THEN '18-24' WHEN Age BETWEEN 25 and 31 then '25-31' WHEN Age BETWEEN 32 AND 38 THEN '32-38' WHEN Age between 39 and 45 then '39-45' when Age between 46 and 52 then '46-52' else '52+' end age_group
from wa_fn_use_c_hr_employee_attrition
WHERE attrition='Yes'
GROUP BY 2

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #Most of people leave the organization between 25-31

-- COMMAND ----------

-- MAGIC %md
-- MAGIC FIND OUT Attrition by Department 

-- COMMAND ----------

SELECT SUM(EmployeeCount), Department from wa_fn_use_c_hr_employee_attrition
Where attrition = 'Yes'
GROUP BY Department

-- COMMAND ----------

SELECT SUM(EmployeeCount), Department from wa_fn_use_c_hr_employee_attrition
where attrition = 'No'
GROUP BY Department


-- COMMAND ----------

SELECT SUM(EmployeeCount), 
case when Education=1 then 'below degree' when Education=2 then 'college' when Education=3 then 'bachelor' when Education=4 then 'master' else "doctor" end
Education from wa_fn_use_c_hr_employee_attrition
where attrition = 'Yes'
GROUP BY Education
ORDER BY SUM(EmployeeCount) DESC

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Attrition by Environemment Satisfaction

-- COMMAND ----------

select sum(EmployeeCount),
case when EnvironmentSatisfaction = 1 then 'Low' when EnvironmentSatisfaction = 2 then 'Medieum' when EnvironmentSatisfaction = 3 then 'High' else 'Highly Satisfied' end
EnvironmentSatisfaction, Department from wa_fn_use_c_hr_employee_attrition
Where attrition = 'Yes'
group by EnvironmentSatisfaction, Department
order by Department  DESC 

-- COMMAND ----------

select sum(EmployeeCount),EnvironmentSatisfaction 
from wa_fn_use_c_hr_employee_attrition
Where attrition = 'Yes'
group by 2

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Attrition By Business Travel 

-- COMMAND ----------

select sum(EmployeeCount), BusinessTravel
from wa_fn_use_c_hr_employee_attrition
Where attrition = 'Yes'
group by 2

-- COMMAND ----------


