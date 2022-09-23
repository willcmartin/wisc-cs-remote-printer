# UW-Madison CS Remote Printing Script

A simple bash script to print a document from your personal computer to a UW-Madison CS Department printer

## Usage

Clone repo and update script permissions

```
$ git clone https://github.com/willwisc-cs-remote-printercmartin/wisc-cs-remote-printer.git
$ cd wisc-cs-remote-printer
$ chmod +x ./uw_remote_print.sh
```

Modify `./uw_remote_print.sh` script to connect to your CS account

```python
1 #!/bin/bash
2
3 # ssh info
4 USER=willmartin # <--- place your cs username here
5

```

Run script (must be connected to UW Madsion wireless network)

```
./uw_remote_print.sh -p copier-5 -f document.pdf -n 3
```

Flags

- `-p`: printer name
- `-f`: file name
- `-n`: numer of copies

Output

```
----------------
USER INFORMATION
----------------
    User	     Quota	   Printed
willmartin	<unlimited>	         9

------------
COPYING FILE
------------
document.pdf                         100%   11KB 269.8KB/s   00:00    

--------------
PRINTER STATUS
--------------
copier-5 is ready
no entries

------------
VERIFICATION
------------
PRINT 3 COPY/COPIES OF 'document.pdf' TO PRINTER 'copier-5' (Y/N): Y
Print job added to queue

-----------------------
CLEANING UP AND EXITING
-----------------------
```
