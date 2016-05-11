

options(repos=structure(c(CRAN="http://mirrors.ebi.ac.uk/CRAN/")))
# Lines added by the Vim-R-plugin command :RpluginConfig (2014-Aug-27 20:54):
if(interactive()){
    if(nchar(Sys.getenv("DISPLAY")) > 1)
        options(editor = 'gvim -f -c "set ft=r"')
    else
        options(editor = 'vim -c "set ft=r"')
    # See ?setOutputColors256 to know how to customize R output colors
    # library(colorout)
    # library(setwidth)
    library(vimcom)
    # See R documentation on Vim buffer even if asking for help in R Console:
    if(Sys.getenv("VIM_PANE") != "")
        options(pager = vim.pager)
}

view <- function(data, autofilter=TRUE) {
        # data: data frame
        # autofilter: whether to apply a filter to make sorting and filtering easier
        open_command <- switch(Sys.info()[['sysname']],
            Windows= 'open',
            Linux  = 'xdg-open',
            Darwin = 'open')
    require(XLConnect)
        temp_file <- paste0(tempfile(), '.xlsx')
        wb <- loadWorkbook(temp_file, create = TRUE)
            createSheet(wb, name = "temp")
            writeWorksheet(wb, data, sheet = "temp", startRow = 1, startCol = 1)
                if (autofilter) setAutoFilter(wb, 'temp', aref('A1', dim(data)))
                saveWorkbook(wb, )
                    system(paste(open_command, temp_file))
}
