# littleman
simple VM and assembler for it. (both in lua)

To use assembler put code in 'tocomp.txt' (yes the name is wrong I will change it later) and run 'assembler/main.lua' the results are put in 'write.txt'

To use VM put results from assembler (copy from 'write.txt') into 'torun.txt' and run 'interpriter/main.lua'.

# How to write code for assembler
each line consists of an instruction and a parameter separated by a ':' e.g. 'put:place'
(note: don’t use spaces, it will probably cause problems. also don’t leave empty lines.)

the current instruction list is:

lab:[word] - create a label named [word] that points to the next line in the program.

var:[word]=[number] - creates a variable which points to a location in memory and sets it to the number specified by [number].

get:[variable] - sets the accumulator to the value stored in the location specified by [variable].

add:[variable] - adds the value stored in the location specified by [variable] to the accumulator.

min:[variable] - takes away the value stored in the location specified by [variable] from the accumulator.

put:[variable] - sets the value of the location specified by [variable] to the current value of the accumulator.

print: - prints the current value of the accumulator.

goto:[label] - jump to the instruction specified by [label].

if:[variable] - if the value of the location specified by [variable] is equal to the accumulator skip the next instruction.

KEY

[word] means any series of characters e.g. 'lary' 'foo' 'bar'

[number] means an integer e.g. '5' '7' '103'

[label] means the name of a label (created with 'lab:[label]') e.g. 'foo'

[variable] means the name of a variable (created with 'var:[variable]=[number]') e.g. 'bar'

# The instruction set for the interpreter
each line consists of a number, the first two digits represent the operation and the rest specify what to do it to. e.g. '2201' would 'get' from address 22. most instructions are identical to those above.

0 = get

1 = add

2 = min

3 = put

4 = put value of accumulator in the array 'output' at position specified

5 = goto

6 = print value in array 'output' at position specified

7 = if
