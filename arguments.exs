#---
# Title        : Assignment - 1,
# Subject      : Distributed And Operating Systems Principles
# Team Members : Priyam Saikia, Noopur R K
# File name    : arguments.exs
#---

[arg1,arg2] = Enum.map(System.argv,fn x -> String.to_integer(x) end)
#Comment below line when running time measuring functions to avoid redundancy
Boss.start_link([arg1,arg2]) 

#The following functions can be used to compute the total time taken to compute
# the results and the time taken by each worker thread to execute its task.
#Please uncomment to observe the timings. 

# ** Start uncommenting here **

#total_time = GetTime.measure(fn -> Boss.start_link([arg1,arg2]) end)
#IO.puts ("Boss time : #{total_time}")
#worker_time = GetTime.measure(fn -> Worker.perfect_sqaure_calc(1,arg2) end)
#IO.puts ("Worker time : #{worker_time}")
#ratio = (worker_time * arg1) / total_time
#IO.puts ("Ratio : #{ratio}")

