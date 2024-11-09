module main

import os




// fn is_in_string(s string) string {
  
//   string_open =false
  
//   mut out := []string{}
//   for i in s {
    
//     if i == '\"'  && !string_open  {
      
//       string_open == true
//     } else if i == "\"" &&  string_open {
      
//     } else if  string_open { 
    
      
      
//     }
    
//     out << i
    
//   }
//   out << ""
//   t := join(out,"")
//   return t
  
// }
// pub fn join(a []string, sep string) string {
// 	if a.len == 0 {
// 		return ''
// 	}
// 	mut len := 0
// 	for val in a {
// 		len += val.len + sep.len
// 	}
// 	len -= sep.len
// 	// Allocate enough memory
// 	mut res := string{
// 		str: unsafe { malloc_noscan(len + 1) }
// 		len: len
// 	}
// 	mut idx := 0
// 	for i, val in a {
// 		unsafe {
// 			vmemcpy(voidptr(res.str + idx), val.str, val.len)
// 			idx += val.len
// 		}
// 		// Add sep if it's not last
// 		if i != a.len - 1 {
// 			unsafe {
// 				vmemcpy(voidptr(res.str + idx), sep.str, sep.len)
// 				idx += sep.len
// 			}
// 		}
// 	}
// 	unsafe {
// 		res.str[res.len] = 0
// 	}
// 	return res
// }

fn main() {
  args := arguments()
  
  
  mut files := []string{}
  for arg in args {
    if arg.contains("--file") {
    s:=  arg.replace("--file=","")
      files << s
   //  break
      
    }
  }
  {
  //s := os.abs_path(".")
  }

for f in files {
      s := os.abs_path(f)
      if os.exists(s) &&  os.is_file(s){ 
        data := os.read_lines(s)  or { 
		println(err)
		return
	}     mut bracket_count := 0
	      mut match_start := false
				mut out_file := []string{}
        for i in data {
            if i.contains("match") {
              match_start = true 
            }
           // if i.contains("  while ") {
           //    l1 :=  i.replace("while","for")
           //    out_file << l1
           //       continue 
           // }
            
            if match_start { 
              
              for c in i {
                if c == c'{' {
                  bracket_count = bracket_count + 1
                  
                } else if c == c'}' {
                  bracket_count = bracket_count - 1
               

                }
                
                
              } 
              if bracket_count == 0 {
                match_start = false
              } 
              if match_start {
              if i.contains("=>") {
                  str :=  i.replace(" ","")
                  ch := str.substr(str.len -1,str.len)
                  ch_i := str.index("=>") or { 
		println(err)
		return
	}
                  ch2 := str.substr(ch_i + 2,ch_i + 3) 
                  if ch == "," {
                 mut  l1 :=  i.replace("=>","{")
                  l2 :=  l1.replace(",","}")
                  out_file << l2
                continue 
                  } else if ch2 != "{"  {
                     l1 :=  i.replace("=>","{")
                    l2 := l1 + "}"
                 
                             out_file << l2
                     continue
                  } else {
              
                    l1 :=  i.replace("=>","")
                    out_file << l1
                             continue 
                    
                  }
                  
              }
            }
            }
            
            out_file << i
        } 
        os.write_lines(f,out_file) or {
        		println(err)
		return
	
        }
      }
  }
}