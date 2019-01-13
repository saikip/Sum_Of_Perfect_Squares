## **Perfect Square Solution - COP5615: Fall 2018**

## **Group Info**
Priyam Saikia (UFID **** ****)

## **Problem**
Find all k consecutive sequences in the range 1 to N for which: 
Sum of squares of k consecutive integers is itself a perfect square.

## **Algorithm used:**

    #Loop 1: 1->N to pass start of each sequence until N (in batches of X).

    For i -> 1 to N do

        # Loop 2: i -> (i+k) to determine sum of consecutive squares
    
        For j -> i to (i+k) do
    
            sum = sum + (j*j)
           
        End For
    
        # Validate if result is a perfect square
    
        if sqrt(sum) - floor(sqrt(sum)) == 0.0 return i
    
    End For 

## **Implementation:**

- Actor model implemented using **Elixir&#39;s Supervisor behaviour (Boss-Worker)**
- Boss will handle the Loop 1 in above algorithm and spawn X Workers concurrently
- Each worker will perform perfect square check
- Boss will spawn next batch of X workers (X = 1500 is our best performing case)

## **Installation and Run:** 

Elixir Mix project has been created to implement the Supervisor Actor model. 
Files of importance in the zipped folder (in order of call):

*Arguments.exs*   -> Commandline entry module

*Boss.ex*         -> Supervisor Module

*Worker.ex*       -> Worker Module

*Time.ex*         -> Module to measure execution time of functions using :timer.tc
                 (can do the same using "time" in commandline)

To run a test case, do:

1. Unzip contents to your desired elixir project folder.
2. Open cmd window from this project location.
3. Use "mix run arguments.exs < N > < k >" in commandline without quotes to run test case.
4. The results will include the Starting values of all valid sequences in the given range.
5. To see Real time and CPU time of our process, use "time mix run arguments.exs 
   < N > < k >" in commandline without quotes to run test case.

## **Significant Observations:**

1.  Work unit with best performance: The Supervisor model works best in our case when Boss spawns the worker in batches to send 
one sequence of k consecutive numbers at one go and Worker calculates if the sum of the squares 
of the k consecutive numbers is a perfect square. N is chunked into set of X batches and 
X workers are spawned with arguments: k and start value of each sequence. 
    Then, Worker performs the following tasks for each process: 
     1. Collect a sequence of k consecutive numbers from Boss
     2. Find squares of each number of the sequence
     3. Calculate sum of the squares
     4. Determine of the sum is itself a perfect square.

    **For X = 1500, Average CPU/Real Ratio for various N and k is 2.86, which is our best case.**

2.  The result of running your program for inputs: N=1000000, K=4 

    (No valid sequences exists)
    
        $ time mix run arguments.exs 1000000 4

        **real**    0m22.269s

        **user**    1m25.022s

        **sys**     0m0.973s


        **Ratio : 3.86**

3.  Ratio of CPU time to REAL TIME: 

    Dependencies:

        N = 1000000

        k = 24

        Ratio for X 100 = 3.88

        Ratio for X 1500 = 3.86

        Ratio for X 10000 = 3.88

    **Sample Chart of Ratio = CPU time / real time for X = 1500:**

        |     N      |      k = 24      |       k = 2     |    
        | ---------- |:----------------:| ---------------:|
        | 10000000  |      3.740       |      3.925       |
        | 1000000   |      3.860       |      3.980       |
        | 100000    |      3.477       |      3.630       |
        | 10000     |      2.395       |      2.398       |
        | 1000      |      1.797       |      1.750       |
        | 100       |      1.723       |      1.719       |

4.  The largest problem solved:

        $ mix run arguments.exs 100000000 4

        Ratio : 3.569

