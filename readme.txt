Git Repository is located at:
https://github.com/davidpluseipi/planets

To get the files, either:
A) Navigate to the address above and download a .zip, 
OR
B) Install Git and "clone" the repository (instructions below)


Here are the files you need:
orbits.dat  (contains the same data stored in data.csv)
showday.m (show the orbits and planets on specific day)
getaxes.m (get info on elliptical parameters)


Good to know:
- orbits.mat is data pulled from orbits.csv
- ellipsearc.m is a function pulled from MATLAB central, if needed
- license.txt applies to ellipsearc.m


Note:
- notice the use of the argument 'IgnoreCase' when calling contains
- notice the section on user input validation
- 


Git Installation and Cloning the Repo
1) Install git from https://git-scm.com/ and select these options:
    a) select the option for "Git from the command line and also 
       from 3rd-party software"
    b) select "Use OpenSSH"
    c) on "configuring line-ending conversions" select checkout as-is,
       commit as-is"
2) Watch some videos here https://git-scm.com/doc
3) Configure git 
    a) open 'Git Bash' (should looke similar to MATLAB command line)
    b) enter the following commands (don't type the $)
        1) $ git config --global user.name "Ryan Adams"
        2) $ git config --global user.email "ryanmadamz@gmail.com"
4) change to the directory where you want to put the files
    a) use the command 'ls' to list the files/directories
    b) use the command 'cd Documents' to change directories
       to the Documents directory, and repeat to get where 
       you want (for example 'cd MATLAB')
5) clone the repository (for example, you might be in the MATLAB directory
    a) $ git clone https://github.com/davidpluseipi/planets
    b) when you hit enter, git will clone aka copy the files from the 
       online repo (repository) into your local directory
6) type 'ls' to list the contents of the MATLAB directory
    a) you should see the directory 'planets'

(If these instructions didn't help, throw your computer out the window.)