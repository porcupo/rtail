rtail
=====

Re-implementation of tail in ruby.
Takes N number of lines from STDIN and pprints them to STDOUT.

Prompt
------
> Implement a self-contained "tail"-like program in a scripting language of your choice. The program should accept STDIN, and print to STDOUT
> out the last N lines of the output (where N is passed in as the first and only command-line argument, defaulting to 10 if not provided). It should not fork or call any external programs, nor use non-standard libraries.
> As these are homework assignments, more care should be given to fully document and make sure this code is "production" ready - i.e., it's what you'd be proud to check into a repo for your peers to review and critique.

Usage
-----
```bash
> cat /etc/group | ./tail.rb 3
com.apple.access_sessionkey:*:397:
com.apple.access_screensharing:*:398:
com.apple.access_ssh:*:399:
>
```

Tetsing
-------
The `test.sh` script does a very simple test comparing the output to tail.
