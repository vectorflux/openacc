This simple test example illustrates the full deep copy which needs to be supported for ICON.  Currently the 'non-standard' 
–h acc_model=deep_copy option in the Cray compiler (e.g., CCE 8.4) fails because of the type of alias used (although there
is a workaround suggested by Alfio Lazzaro), and the NVIDIA/PGI (e.g., PGI 15.3.0) does not support this at all.

This is a public test example for compiler developers to test their full deep copy support.
