+++
Title = "Head Detached From Origin Master"
date = "2019-12-12T11:32:54+08:00"
draft = true
tags = ["github", "vim"]
topics = []
description = ""
+++


## Capitalize first letter of each word in a selection using vim

You can use the following substitution:

```
s/\<./\u&/g
```
* \< matches the start of a word
* . matches the first character of a word
* \u tells Vim to uppercase the following character in the substitution string (&)
* & means substitute whatever was matched on the LHS

## References

* [How can I reconcile detached HEAD with master/origin?](https://stackoverflow.com/questions/5772192/how-can-i-reconcile-detached-head-with-master-origin)
* [Capitalize first letter of each word in a selection using vim](https://stackoverflow.com/questions/17440659/capitalize-first-letter-of-each-word-in-a-selection-using-vim)

