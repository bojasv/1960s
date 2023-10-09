Dcl-C HTTP_METHOD_POST -1;
Dcl-C HTTP_METHOD_GET -2;
Dcl-C HTTP_METHOD_HEAD -3;
Dcl-C HTTP_METHOD_PUT -4;
Dcl-C HTTP_METHOD_DELETE -5;
Dcl-C HTTP_METHOD_OPTIONS -6;
Dcl-C HTTP_METHOD_PATCH -7;

Dcl-C HTTP_VERSION_ANY -1.0;
//a separate TCP connection to the same server is made for every resource request.
Dcl-C HTTP_VERSION_11 1.1; 
//a TCP connection can be reused to make multiple resource requests 
// (i.e. of HTML pages, frames, images, scripts, stylesheets, etc.)
Dcl-C HTTP_VERSION_10 1.0; 
// metadata (headers) are in binary and compressed
Dcl-C HTTP_VERSION_20 2.0; 

Dcl-C TIMEOUT_UNLTD 4294967294; //8194 years?
Dcl-C TIMEOUT_5MIN 300;
