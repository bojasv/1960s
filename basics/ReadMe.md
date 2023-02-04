# System Limits

`VARCHAR` : In IBM DB2, two extra bytes are used to store the length of a VARCHAR column because this length can be represented in two bytes.
Each byte can store 256 possible values (0 to 255), so two bytes can store up to 65536 possible values (0 to 65535). This means that the length of a VARCHAR column in DB2 can be up to 65535 characters.
