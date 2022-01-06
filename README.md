# Stack - The Case Study

A Case study to measure the performances of different data structures (Array and LinkedList), to implement a LIFO Stack.

I've started implementing a basic exercise (Implement a basic LIFO Stack with push(), pop() and isEmpty() methods). 
Then i developed an interest on the performances of data structures when you perform this kind of operations. In the test i've used an Array as data structure.

I've basically extended that test doing:
- A protocol called 'Stack' which asks to implement pop(), push() and isEmpty()
- An additional data structure using LinkedList.
- Transformation of these structures in Actors, relying on the async/await introuduced in Swift 5.5, to manage race conditions.
- A TestCase which measures the performances of some operations done on both the structures.

### References
- A good comparison between LinkedList and Array: [Linked List vs Array](https://www.studytonight.com/data-structures/linked-list-vs-array)

## Measurements

### CPU (Using Actors)

| Structure  | Time Avg | Time RSD | Instructions Retired Avg | Instructions Retired RSD | Cycles Avg | Cycles RSD |
|------------|----------|----------|--------------------------|--------------------------|------------|------------|
| Array      |   0.001  |  30.489% |         4289.640         |          24.917%         |  1726.516  |   31.522%  |
| LinkedList |   0.001  |  10.825% |         3240.372         |          5.745%          |  1807.300  |   7.997%   |


### Performance (Using Actors)

| Structure  | Time Avg | Time RSD  |
|------------|----------|-----------|
| Array      |   0.000  |  86.587%  |
| LinkedList |   0.000  |  120.835% |


### CPU (Using Structs)

| Structure  | Time Avg | Time RSD | Instructions Retired Avg | Instructions Retired RSD | Cycles Avg | Cycles RSD |
|------------|----------|----------|--------------------------|--------------------------|------------|------------|
| Array      |   0.001  |  14.190% |         3859.277         |          2.647%          |  2017.832  |   22.181%  |
| LinkedList |   0.001  |  3.284%  |         8318.598         |          0.702%          |  2566.244  |   3.389%   |


### Performance (Using Structs)

| Structure  | Time Avg | Time RSD |
|------------|----------|----------|
| Array      |   0.000  |  35.923% |
| LinkedList |   0.001  |  25.225% |


### Observations
- In general Arrays are a simplier solution compared to LinkedList, with few differences in terms of CPU and performances.
- With actors it can be observed a less usage of the CPU and a comparable performances with a better RSD.
- RSD results much more precise using LinkedList except on performances using Actors.
- Since the Stack is a structure which can be affected by concurrency, the use of Actors is strongly recommended to resolve race conditions and for better CPU performances.


### Logs
```
Test Suite 'StackTest' started at 2022-01-06 11:44:43.933
Test Case '-[__lldb_expr_30.StackTest testArrayActorCPU]' started.
<unknown>:0: Test Case '-[__lldb_expr_30.StackTest testArrayActorCPU]' measured [CPU Time, s] average: 0.001, relative standard deviation: 30.489%, values: [0.000833, 0.000677, 0.000826, 0.000431, 0.000380], performanceMetricID:com.apple.dt.XCTMetric_CPU.time, baselineName: "", baselineAverage: , polarity: prefers smaller, maxPercentRegression: 10.000%, maxPercentRelativeStandardDeviation: 10.000%, maxRegression: 0.000, maxStandardDeviation: 0.000
<unknown>:0: Test Case '-[__lldb_expr_30.StackTest testArrayActorCPU]' measured [CPU Instructions Retired, kI] average: 4289.640, relative standard deviation: 24.917%, values: [5182.098000, 4443.346000, 5677.751000, 3036.597000, 3108.410000], performanceMetricID:com.apple.dt.XCTMetric_CPU.instructions_retired, baselineName: "", baselineAverage: , polarity: prefers smaller, maxPercentRegression: 10.000%, maxPercentRelativeStandardDeviation: 10.000%, maxRegression: 0.000, maxStandardDeviation: 0.000
<unknown>:0: Test Case '-[__lldb_expr_30.StackTest testArrayActorCPU]' measured [CPU Cycles, kC] average: 1726.516, relative standard deviation: 31.522%, values: [1962.053000, 2232.971000, 2289.100000, 1101.402000, 1047.055000], performanceMetricID:com.apple.dt.XCTMetric_CPU.cycles, baselineName: "", baselineAverage: , polarity: prefers smaller, maxPercentRegression: 10.000%, maxPercentRelativeStandardDeviation: 10.000%, maxRegression: 0.000, maxStandardDeviation: 0.000
Test Case '-[__lldb_expr_30.StackTest testArrayActorCPU]' passed (0.050 seconds).
Test Case '-[__lldb_expr_30.StackTest testArrayActorPerformance]' started.
<unknown>:0: Test Case '-[__lldb_expr_30.StackTest testArrayActorPerformance]' measured [Time, seconds] average: 0.000, relative standard deviation: 58.933%, values: [0.000198, 0.000065, 0.000093, 0.000060, 0.000053, 0.000052, 0.000064, 0.000052, 0.000049, 0.000049], performanceMetricID:com.apple.XCTPerformanceMetric_WallClockTime, baselineName: "", baselineAverage: , polarity: prefers smaller, maxPercentRegression: 10.000%, maxPercentRelativeStandardDeviation: 10.000%, maxRegression: 0.100, maxStandardDeviation: 0.100
Test Case '-[__lldb_expr_30.StackTest testArrayActorPerformance]' passed (0.253 seconds).
Test Case '-[__lldb_expr_30.StackTest testArrayStructCPU]' started.
<unknown>:0: Test Case '-[__lldb_expr_30.StackTest testArrayStructCPU]' measured [CPU Time, s] average: 0.001, relative standard deviation: 14.190%, values: [0.001379, 0.001136, 0.000966, 0.000949, 0.001061], performanceMetricID:com.apple.dt.XCTMetric_CPU.time, baselineName: "", baselineAverage: , polarity: prefers smaller, maxPercentRegression: 10.000%, maxPercentRelativeStandardDeviation: 10.000%, maxRegression: 0.000, maxStandardDeviation: 0.000
<unknown>:0: Test Case '-[__lldb_expr_30.StackTest testArrayStructCPU]' measured [CPU Instructions Retired, kI] average: 3859.277, relative standard deviation: 2.647%, values: [4007.905000, 3802.408000, 3841.921000, 3931.095000, 3713.057000], performanceMetricID:com.apple.dt.XCTMetric_CPU.instructions_retired, baselineName: "", baselineAverage: , polarity: prefers smaller, maxPercentRegression: 10.000%, maxPercentRelativeStandardDeviation: 10.000%, maxRegression: 0.000, maxStandardDeviation: 0.000
<unknown>:0: Test Case '-[__lldb_expr_30.StackTest testArrayStructCPU]' measured [CPU Cycles, kC] average: 2017.832, relative standard deviation: 22.181%, values: [2892.510000, 1851.213000, 1682.858000, 1715.082000, 1947.496000], performanceMetricID:com.apple.dt.XCTMetric_CPU.cycles, baselineName: "", baselineAverage: , polarity: prefers smaller, maxPercentRegression: 10.000%, maxPercentRelativeStandardDeviation: 10.000%, maxRegression: 0.000, maxStandardDeviation: 0.000
Test Case '-[__lldb_expr_30.StackTest testArrayStructCPU]' passed (0.019 seconds).
Test Case '-[__lldb_expr_30.StackTest testArrayStructPerformance]' started.
<unknown>:0: Test Case '-[__lldb_expr_30.StackTest testArrayStructPerformance]' measured [Time, seconds] average: 0.000, relative standard deviation: 35.923%, values: [0.000456, 0.000224, 0.000215, 0.000233, 0.000187, 0.000177, 0.000186, 0.000178, 0.000185, 0.000187], performanceMetricID:com.apple.XCTPerformanceMetric_WallClockTime, baselineName: "", baselineAverage: , polarity: prefers smaller, maxPercentRegression: 10.000%, maxPercentRelativeStandardDeviation: 10.000%, maxRegression: 0.100, maxStandardDeviation: 0.100
Test Case '-[__lldb_expr_30.StackTest testArrayStructPerformance]' passed (0.254 seconds).
Test Case '-[__lldb_expr_30.StackTest testLinkedListActorCPU]' started.
<unknown>:0: Test Case '-[__lldb_expr_30.StackTest testLinkedListActorCPU]' measured [CPU Time, s] average: 0.001, relative standard deviation: 10.825%, values: [0.001109, 0.001549, 0.001358, 0.001337, 0.001458], performanceMetricID:com.apple.dt.XCTMetric_CPU.time, baselineName: "", baselineAverage: , polarity: prefers smaller, maxPercentRegression: 10.000%, maxPercentRelativeStandardDeviation: 10.000%, maxRegression: 0.000, maxStandardDeviation: 0.000
<unknown>:0: Test Case '-[__lldb_expr_30.StackTest testLinkedListActorCPU]' measured [CPU Instructions Retired, kI] average: 3240.372, relative standard deviation: 5.745%, values: [2953.531000, 3179.167000, 3452.755000, 3179.858000, 3436.550000], performanceMetricID:com.apple.dt.XCTMetric_CPU.instructions_retired, baselineName: "", baselineAverage: , polarity: prefers smaller, maxPercentRegression: 10.000%, maxPercentRelativeStandardDeviation: 10.000%, maxRegression: 0.000, maxStandardDeviation: 0.000
<unknown>:0: Test Case '-[__lldb_expr_30.StackTest testLinkedListActorCPU]' measured [CPU Cycles, kC] average: 1807.300, relative standard deviation: 7.997%, values: [1891.665000, 1946.630000, 1635.913000, 1627.585000, 1934.707000], performanceMetricID:com.apple.dt.XCTMetric_CPU.cycles, baselineName: "", baselineAverage: , polarity: prefers smaller, maxPercentRegression: 10.000%, maxPercentRelativeStandardDeviation: 10.000%, maxRegression: 0.000, maxStandardDeviation: 0.000
Test Case '-[__lldb_expr_30.StackTest testLinkedListActorCPU]' passed (0.016 seconds).
Test Case '-[__lldb_expr_30.StackTest testLinkedListActorPerformance]' started.
<unknown>:0: Test Case '-[__lldb_expr_30.StackTest testLinkedListActorPerformance]' measured [Time, seconds] average: 0.000, relative standard deviation: 120.835%, values: [0.000157, 0.000030, 0.000022, 0.000020, 0.000019, 0.000018, 0.000019, 0.000018, 0.000018, 0.000019], performanceMetricID:com.apple.XCTPerformanceMetric_WallClockTime, baselineName: "", baselineAverage: , polarity: prefers smaller, maxPercentRegression: 10.000%, maxPercentRelativeStandardDeviation: 10.000%, maxRegression: 0.100, maxStandardDeviation: 0.100
Test Case '-[__lldb_expr_30.StackTest testLinkedListActorPerformance]' passed (0.252 seconds).
Test Case '-[__lldb_expr_30.StackTest testLinkedListStructCPU]' started.
<unknown>:0: Test Case '-[__lldb_expr_30.StackTest testLinkedListStructCPU]' measured [CPU Time, s] average: 0.001, relative standard deviation: 3.284%, values: [0.001335, 0.001335, 0.001236, 0.001308, 0.001249], performanceMetricID:com.apple.dt.XCTMetric_CPU.time, baselineName: "", baselineAverage: , polarity: prefers smaller, maxPercentRegression: 10.000%, maxPercentRelativeStandardDeviation: 10.000%, maxRegression: 0.000, maxStandardDeviation: 0.000
<unknown>:0: Test Case '-[__lldb_expr_30.StackTest testLinkedListStructCPU]' measured [CPU Instructions Retired, kI] average: 8318.598, relative standard deviation: 0.702%, values: [8343.128000, 8326.428000, 8215.807000, 8394.788000, 8312.838000], performanceMetricID:com.apple.dt.XCTMetric_CPU.instructions_retired, baselineName: "", baselineAverage: , polarity: prefers smaller, maxPercentRegression: 10.000%, maxPercentRelativeStandardDeviation: 10.000%, maxRegression: 0.000, maxStandardDeviation: 0.000
<unknown>:0: Test Case '-[__lldb_expr_30.StackTest testLinkedListStructCPU]' measured [CPU Cycles, kC] average: 2566.244, relative standard deviation: 3.389%, values: [2657.614000, 2644.244000, 2442.483000, 2602.768000, 2484.111000], performanceMetricID:com.apple.dt.XCTMetric_CPU.cycles, baselineName: "", baselineAverage: , polarity: prefers smaller, maxPercentRegression: 10.000%, maxPercentRelativeStandardDeviation: 10.000%, maxRegression: 0.000, maxStandardDeviation: 0.000
Test Case '-[__lldb_expr_30.StackTest testLinkedListStructCPU]' passed (1.240 seconds).
Test Case '-[__lldb_expr_30.StackTest testLinkedListStructPerformance]' started.
<unknown>:0: Test Case '-[__lldb_expr_30.StackTest testLinkedListStructPerformance]' measured [Time, seconds] average: 0.001, relative standard deviation: 25.225%, values: [0.001091, 0.001242, 0.001203, 0.001216, 0.001607, 0.001275, 0.001268, 0.000748, 0.000723, 0.000705], performanceMetricID:com.apple.XCTPerformanceMetric_WallClockTime, baselineName: "", baselineAverage: , polarity: prefers smaller, maxPercentRegression: 10.000%, maxPercentRelativeStandardDeviation: 10.000%, maxRegression: 0.100, maxStandardDeviation: 0.100
Test Case '-[__lldb_expr_30.StackTest testLinkedListStructPerformance]' passed (0.263 seconds).
Test Case '-[__lldb_expr_30.StackTest testMemoryAllocationArray]' started.
<unknown>:0: Test Case '-[__lldb_expr_30.StackTest testMemoryAllocationArray]' measured [Time, seconds] average: 0.000, relative standard deviation: 114.354%, values: [0.000260, 0.000038, 0.000044, 0.000039, 0.000031, 0.000031, 0.000030, 0.000046, 0.000039, 0.000031], performanceMetricID:com.apple.XCTPerformanceMetric_WallClockTime, baselineName: "", baselineAverage: , polarity: prefers smaller, maxPercentRegression: 10.000%, maxPercentRelativeStandardDeviation: 10.000%, maxRegression: 0.100, maxStandardDeviation: 0.100
Test Case '-[__lldb_expr_30.StackTest testMemoryAllocationArray]' passed (0.253 seconds).
Test Case '-[__lldb_expr_30.StackTest testMemoryAllocationLinkedList]' started.
<unknown>:0: Test Case '-[__lldb_expr_30.StackTest testMemoryAllocationLinkedList]' measured [Time, seconds] average: 0.000, relative standard deviation: 154.144%, values: [0.000311, 0.000045, 0.000027, 0.000025, 0.000025, 0.000024, 0.000024, 0.000024, 0.000024, 0.000024], performanceMetricID:com.apple.XCTPerformanceMetric_WallClockTime, baselineName: "", baselineAverage: , polarity: prefers smaller, maxPercentRegression: 10.000%, maxPercentRelativeStandardDeviation: 10.000%, maxRegression: 0.100, maxStandardDeviation: 0.100
Test Case '-[__lldb_expr_30.StackTest testMemoryAllocationLinkedList]' passed (0.253 seconds).
Test Suite 'StackTest' passed at 2022-01-06 11:44:46.806.
     Executed 10 tests, with 0 failures (0 unexpected) in 2.853 (2.873) seconds

```
