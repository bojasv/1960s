## About Web Services
Web services are a medium to connect business applications to each other anywhere on the web, inside or outside the enterprise, regardless of their platform, design, or runtime environment. 
Basically, Web services helps make an app truly global.

> A Web service is a self-contained software component with a well-defined interface that describes a set of operations that are accessible over the Internet. XML technology provides a platform and programming language-independent means by which a Web service's interface can be defined. Web services can be implemented using any programming language, and can be run on any platform, as long as two components are provided to indicate how the Web service can be accessed: a standardized XML interface description, called WSDL (Web Services Description Language), and a standardized XML-based protocol, called Simple Object Access Protocol (SOAP). Applications can access a Web service by issuing requests formatted according to the XML interface.  

> Web services do not provide a Graphical User Interface (GUI) for the user. Instead, Web services share business logic, data, and processes through a programming interface across a network. Therefore, developers can access Web services from applications to gain specific functionality. In short, Web services are encapsulated functions which are offered using broadly adopted standard interface descriptions and protocols.  

> The Web services architecture is based on the interactions among three roles: service provider, service registry, and service requestor. The interactions involve the publish operations, find operations, and bind operations. Together, these roles and operations act upon the Web service artifacts: the Web service software module and its description. In a typical scenario, a service provider defines a service description for the Web service using Web Services Description Language (WSDL). The WSDL description of the service is then published to the service requestor or service registry. The service requestor uses a find operation to retrieve the service description locally or from the service registry. Once obtained, the service description is used to bind with the service provider and invoke or interact with the Web service implementation.

Ref: https://www.ibm.com/docs/en/i/7.2?topic=tasks-integrated-web-services-i


## Different Ways to implement Web Services on IBM i
There are few ways that web services could be utilized on the IBM i, irrespective of whether the API requires TLS/SSL config or not. In that case, such cofig has to be done first before testing the API
1. Using IBM-supplied SQL routines
   - `SYSTOOLS` (Since 2014 i.e. 7.1 onwards) - It requires JVM (1.6 or higher) and hence slower than QSYS2 routines
   - `QSYS2` (Sep 2021 onwards i.e. 7.3 TR11 or 7.4 TR5 onwards) - Do not require Java
2. Using CGI development tools (i.e. `CGIDEV2` library)
3. Using Third Party Apps like Krengeltech's RPG API Express (formerly RPG-XML Suite or `RXS 3.5`)

## Ways to Test API
1. Analyze the SQL state and response header and data.
2. Mimic the API config in the Postman, verify using cURL.
