
*set project path
	cap cd "/Users/s/Desktop/治理指数/文稿/国家治理指数和发展中国家现代化道路/replication" //home

	global root = "/Users/s/Desktop/治理指数/文稿/国家治理指数和发展中国家现代化道路/replication"
	global dofiles = "$root/dofiles"
	global raw_data = "$root/raw_data"
	global working_data = "$root/working_data"
	global temp_data = "$root/temp_data"
	global outputs = "$root/outputs"

* run replication files
do "$dofiles/figure2_tableA8.do"
do "$dofiles/figure3.do"
do "$dofiles/figure4.do"
do "$dofiles/figure5.do"
do "$dofiles/figure6.do"
do "$dofiles/figure7_8_A1_A2.do"
do "$dofiles/figure9A.do"
do "$dofiles/figure9B.do"
do "$dofiles/figureA3_tableA2_A3.do"
do "$dofiles/table1.do"
do "$dofiles/tableA6.do"
do "$dofiles/tableA7.do"
