is.palindrome <- function (word) {
  identical(word, paste(rev(strsplit(word, "")[[1]]), collapse=""))
}

is.palindrome("kayak")
[1] TRUE

is.palindrome("love")
[1] FALSE

help("rev")

rev("abc")
a<-strsplit("abc","")
class(a)
for(B in a)
{
  print(B)
}

rev(strsplit("abcd", "")