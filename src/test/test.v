fn test(a i32) {
    
  match a {
      1    {
        println("1")
      }
      else  { println("other number")}
    }
    s :="=>"
  }


fn rand_num() i32 {
  return 1
  }

fn main() {
mut threads := []thread i32{}

for _ in 1 .. 10 {
		threads << spawn rand_num()
	}
  
	
	

	r := threads.wait()
for i in r {
  
  test(i)
}

  
  
}
