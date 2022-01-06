# Stack - The Case Study

A Case study to measure the performances of different data structures (Array and LinkedList), to implement a LIFO Stack.

After an excercise asked me during an interview (Implement a basic LIFO Stack with push(), pop() and isEmpty() methods), i developed an interest on the performances of data structures when you perform this kind of operations. In the test i've used an Array as data structure.

I've basically extended that test doing:
- A protocol called 'Stack' which asks to implement pop(), push() and isEmpty()
- An additional data structure using LinkedList.
- Transformation of these structures in Actors, relying on the async/await introuduced in Swift 5.5, to manage race conditions.
- A TestCase which measures the performances of some operations done on both the structures.

## Measurements

### CPU (Using Actors)

| Structure  | Time Avg | Time RSD | Instructions Retired Avg | Instructions Retired RSD | Cycles Avg | Cycles RSD |
|------------|----------|----------|--------------------------|--------------------------|------------|------------|
| Array      |   0.001  |  37.831% |         3921.478         |          24.657%         |  1279.858  |   39.064%  |
| LinkedList |   0.002  |  32.682% |         4937.027         |          28.072%         |  2837.316  |   27.178%  |


### Performance (Using Actors)

| Structure  | Time Avg | Time RSD |
|------------|----------|----------|
| Array      |   0.000  |  92.057% |
| LinkedList |   0.000  |  67.508% |


### CPU (Using Structs)

| Structure  | Time Avg | Time RSD | Instructions Retired Avg | Instructions Retired RSD | Cycles Avg | Cycles RSD |
|------------|----------|----------|--------------------------|--------------------------|------------|------------|
| Array      |   0.001  |  29.255% |         5640.389         |          44.703%         |  1875.364  |   41.127%  |
| LinkedList |   0.004  |  15.534% |         27746.136        |          0.584%          |  9717.316  |   8.351%   |


### Performance (Using Structs)

| Structure  | Time Avg | Time RSD |
|------------|----------|----------|
| Array      |   0.000  |  54.082% |
| LinkedList |   0.004  |  19.386% |


### Observations
- In general Arrays are a better solution compared to LinkedList, in terms of performances and CPU.
- With actors it can be observed a less usage of the CPU and a comparable performances considering the results with structs.
- RSD of the measurements it's better using Structs.
