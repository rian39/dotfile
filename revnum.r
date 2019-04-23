digits = 8
r = runif(100)*10^digits

i = 0
digs = 1 

nu  <- function() {
    i <<- i + 1
    s = round(r[i]/digs)
    return(s)
}

rn  <-  function() {
    s = r[i]/digs
    s = as.character(round(s))
    s = strsplit(s, NULL)[[1]]
    s = rev(s)
    s = as.integer(paste0(s, collapse=''))
    return(s)
}

nu()
rn()
