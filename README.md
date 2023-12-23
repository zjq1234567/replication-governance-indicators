# replication-governance-indicators
本项目为 "国家治理指数和发展中国家现代化 ——基于历史沿革、理论逻辑和构建方法的考察"一文的结果复刻文件


***************************Working Environment*******************************************
1. dofiles: stata do files that contain code for replication
- Each do file, except for 00_main.do, in this can replicate the figures and tables in its name.
- 00_main.do is used to set the project path and run the replication do files.
2. raw_data: raw data files
3. working_data: temporary data files
4. outputs: replicated results. Each figure and table is named by its number in the main article
data_WGI_only_expert: process to generate the expert component of WGI. See “readme” in the folder for more details.

**********************Replication Process*******************************************
Step 1: Open dofiles/00_main.do 
Step 2: Set the project path on your computer
Step 2: Run the code line corresponding to figures and tables. 

For example, if you want to replicate Figure 3. (1) Open “dofiles/00_main.do”. (2) Change the project path in it. (3) Select the line do "$dofiles/figure3.do" and run it.



 

