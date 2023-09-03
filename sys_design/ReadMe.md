# Basics

Disclaimer: These are the opinions from a code developer's POV.

Designing a system may involve anything from as trivial as naming variables and deciding indentation for better code readability to 
crucial aspects like routine processing time and memory consumed.

A good system shall be
- Efficient
  - Processing Time
  - Memory Consumed
- Maintainability
  - Readable

I feel making a system efficient is more about how well you know the nuances of the programming language, the database and the operating system, while
making a system maintainable is a whole different thing, which involves making the code readable, declaring sensible variables, writing helpful comments.  

About writing helpful comments: A simple routine that search and find a value from an array shouldn't have comments explaining every little detail of the routine, 
yet also it must not be devoid of details about the process that could help understand it better.  
Tip: Comments can be written while you're developing the code, while they shall be reviewed at each stage of the development, they should definitely be reviewed before the final delivery.  

## Naming things
Things can be a ...
- constants (usually system-defined)
  - opcode
  - built-in/system-supplied function
  - figurative constant
  - reserved keywords
  - literal
- variable names (usually user-defined)
  - command/menu/program
  - file/member/record_format/file-field/key-field
  - routine/sub-routine/function/procedure/sub-procedure
  - parameter
