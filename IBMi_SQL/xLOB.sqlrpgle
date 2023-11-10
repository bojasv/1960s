// CLOB stands for character large objects, 
// which are used to store string data too large to be stored in a VARCHAR column
  
Dcl-S request SQLTYPE(CLOB:1048576);  //1,048,576 is required len, maxlen is 16,773,100
request = jsonReqDta;
Exec Sql                                                     
  CREATE TABLE                                               
    QTEMP.REQDATA (DATA CLOB(1048576) NOT NULL DEFAULT '');   
                                                             
REQUEST_LEN  = %Len(%Trim(request));                         
REQUEST_DATA = %Trim(request);                               
Exec Sql                                                     
  INSERT INTO QTEMP.REQDATA (DATA) VALUES(:request) WITH NC;  

//------------------------------------------------------------------------------------
// the above logic can also be logged as JSON file on given IFS path
//------------------------------------------------------------------------------------

Exec Sql                                                         
  CALL QSYS2.IFS_WRITE_UTF8('/home/BOJASV/Req2Endpoint.json',
                       :request);                                
