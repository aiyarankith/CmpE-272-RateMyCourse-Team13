CmpE-272-Enterprise-Software-Platforms
=========================================
Rate My Course 

Rate My Course is a web application which collects user reviews about the courses offered
at the California State University colleges. The users can be students enrolled in these 
colleges and also people from industry.

We have used the following technologies:
1. Java EE 
2. Spring Framework 4
3. JSTL
4. HTML 5
5. CSS 3
6. CouchDB using LightCouch
7. MySQL

Data:

Data from the following CSU colleges have been collected:-
  1.San Jose State University
  2.California State University, Long Beach
  3.California State University, East Bay
  4.Fresno State
  5.California State University, Sacramento
  
  The data is collected in the CSV format.
  
  
Loading data to CouchDB:

  We used Python script to upload this data on couchDB. 
  The python library of couchDB is used to convert the .csv file to json format.
  
  Prerequisites: 
  Python 2.6
  Couch DB
  
  Command to run the Python script on the Terminal window:
  
  python script3.py <file-name> <database-name>
  
Spring API
The Spring jars can be downloaded from here

http://repo.spring.io/release/org/springframework/spring/
http://www.java2s.com/Code/Jar/o/Downloadorgapachecommonsloggingjar.htm

JSTL
The JSTL jars can be downloaded from here

CouchDB light couch libraries
The CouchDB jars can be downloaded from here

Functionalities:

Following people can  use this application:

Admin- Admin can login to his account to add, delete, update courses.
       The admin profile is saved in mysql database.
User- User of this system can be an unenrolled student, enrolled student and Industrialist person.
      The weightage of the rating will be dependent on the user i.e. the rating of an Industrialist will be of maximum
      value followed by that of enrolled student and then unenrolled student. This will effect the overall rating of the 
      course.
      The user can also post comments along with the rating.
      
We have also implemented graphs to summarize the information in an easy to read manner.


  
  
  
  
  
  

     

     
