# 0, 1, 1, 2, 3, 5...
while(TRUE) {
  x = as.integer(readline(prompt = "Input the count: "))
  if (x <= 0) {
    print("Thanks a lot!")
    break
  }
  
  if (x == 1) {
    print(0)
    next
  }
  
  p0 = 0
  p1 = 1
  ret = paste(p0, p1)
  
  while(x > 2) {
    p = p0 + p1
    ret = paste(ret, p)
    p0 = p1
    p1 = p
    
    x = x - 1
  }
  
  print(ret)
}
