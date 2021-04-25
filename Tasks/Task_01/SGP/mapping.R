


HSCode <- c()
for( i in 1:4182){
  
  spl <- as.numeric(strsplit(as.character(singapore_imports_s1$hs_product_code[i]), "")[[1]])
  if(length(spl) > 6){
    #HSCode[i] = int(''.join(map(str,spl[1:6])))
    HSCode[i]  = as.numeric(paste(spl[1:6], collapse = ""))
    
  }else{
    #HSCode[i] = int(''.join(map(str,spl)))
    HSCode[i] = as.numeric(paste(spl, collapse = ""))
    
  }
  
}