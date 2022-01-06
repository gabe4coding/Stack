# Stack - The Case Study

A Case study to measure the performances of different data structures (Array and LinkedList), to implement a LIFO Stack.

After an excercise asked me during an interview (Implement a basic LIFO Stack with push(), pop() and isEmpty() methods), i developed an interest on the performances of data structures when you perform this kind of operations. In the test i've used an Array as data structure.

I've basically extended that test doing:
- A protocol called 'Stack' which asks to implement pop(), push() and isEmpty()
- An additional data structure using LinkedList.
- Transformation of these structures in Actors, relying on the async/await introuduced in Swift 5.5, to manage race conditions.
- A TestCase which measures the performances of some operations done on both the structures.

## Measurements

### CPU

| Structure  | Time Avg | Time RSD | Instructions Retired Avg | Instructions Retired RSD | Cycles Avg | Cycles RSD |
|------------|----------|----------|--------------------------|--------------------------|------------|------------|
| Array      |   0.001  |  37.831% |         3921.478         |          24.657%         |  1279.858  |   39.064%  |
| LinkedList |   0.002  |  32.682% |         4937.027         |          28.072%         |  2837.316  |   27.178%  |


### Performance (seconds)

| Structure  | Time Avg | Time RSD |
|------------|----------|----------|
| Array      |   0.000  |  92,057% |
| LinkedList |   0.000  |  67.508% |
