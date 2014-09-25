# Issues with this code

* does not actually check args before reading stdin
  "bad" args (`-h` or anything other than an integer) are not processed until EOF is received from STDIN
  ie, if you just run `tail -h`, the script just waits for input w/o explaination.

* Definitely does not check possible exceptions or issues as much as it should

