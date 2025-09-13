scale_linetype_manual(name = "Pathogen", ## legend title from var in df
                      labels = c(expression(italic("Francisella")), ## make both levels of Pathogen italics
                                 expression(italic("Rickettsia"))),
                      values = c("Francisella" = "dashed", "Rickettsia" = "solid")) ## identify which line is which

