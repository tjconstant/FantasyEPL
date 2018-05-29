library(knitr)

knit('index.Rhtml', encoding='UTF-8')

library(RCurl)

ftpUpload("index.html",to="ftp://people.ex.ac.uk/FF/index.html", userpwd="tjc202:maXwell1864")
ftpUpload("figure/CumGraph-CL.png",to="ftp://people.ex.ac.uk/FF/figure/CumGraph-CL.png", userpwd="tjc202:maXwell1864")
ftpUpload("figure/CumGraph-SC.png",to="ftp://people.ex.ac.uk/FF/figure/CumGraph-SC.png", userpwd="tjc202:maXwell1864")
ftpUpload("figure/CumGraph-CL-Extrap.png",to="ftp://people.ex.ac.uk/FF/figure/CumGraph-CL-Extrap.png", userpwd="tjc202:maXwell1864")
ftpUpload("figure/CumGraph-CL-Extrap-RF.png",to="ftp://people.ex.ac.uk/FF/figure/CumGraph-CL-Extrap-RF.png", userpwd="tjc202:maXwell1864")
ftpUpload("figure/CumGraph-SGC-Extrap.png",to="ftp://people.ex.ac.uk/FF/figure/CumGraph-SGC-Extrap.png", userpwd="tjc202:maXwell1864")
ftpUpload("figure/TVGraph-CL.png",to="ftp://people.ex.ac.uk/FF/figure/TVGraph-CL.png", userpwd="tjc202:maXwell1864")
ftpUpload("figure/TVGraph-SC.png",to="ftp://people.ex.ac.uk/FF/figure/TVGraph-SC.png", userpwd="tjc202:maXwell1864")
ftpUpload("figure/DirtyBastard-CL.png",to="ftp://people.ex.ac.uk/FF/figure/DirtyBastard-CL.png", userpwd="tjc202:maXwell1864")
ftpUpload("figure/DirtyBastard-SC.png",to="ftp://people.ex.ac.uk/FF/figure/DirtyBastard-SC.png", userpwd="tjc202:maXwell1864")
ftpUpload("figure/DreamTeam.png",to="ftp://people.ex.ac.uk/FF/figure/DreamTeam.png", userpwd="tjc202:maXwell1864")
ftpUpload("figure/Density-CL.png",to="ftp://people.ex.ac.uk/FF/figure/Density-CL.png", userpwd="tjc202:maXwell1864")
ftpUpload("figure/Density-SC.png",to="ftp://people.ex.ac.uk/FF/figure/Density-SC.png", userpwd="tjc202:maXwell1864")
