import os

templatePath = "~/Dropbox\ \(Princeton\)/8_Templates/"
website_docs = "~/Dropbox\ \(Princeton\)/5_CV/website/static/docs"
softwarePath = "~/Dropbox\ \(Princeton\)/14_Software/"

def task_source():
    yield {
        'name': "migrating templates and helper functions...",
        'actions': ["mkdir -p templates",
                    "cp -a " + templatePath + "cooley-paper-template.latex " + "templates/",
				    "cp -a " + softwarePath + " source/"]
    }

def task_prep_slides():
	yield {
		'name': "moving slide files",
		'actions': ["mkdir -p css",
					"cp -a " + templatePath + "slides/ " + "css/"]
	}

def task_write_paper():
    if os.path.isfile("references.RData") is False:
        yield {
    		'name': "collecting references...",
    		'actions':["R --slave -e \"set.seed(100);knitr::knit('gunboats.rmd')\""]
        }
    yield {
		'name': "writing paper...",
		'actions':["R --slave -e \"set.seed(100);knitr::knit('gunboats.rmd')\"",
                   "pandoc --template=templates/cooley-paper-template.latex --filter pandoc-citeproc -o gunboats.pdf gunboats.md",
                   "cp -a gunboats.pdf " + website_docs],
	}

def task_slides():
    """build slides"""
    if os.path.isfile("references.RData") is False:
        yield {
    		'name': "collecting references...",
    		'actions':["R --slave -e \"rmarkdown::render('gunboats_slides.Rmd', output_file='index.html')\""]
        }
    yield {
		'name': "writing slides...",
		'actions': ["R --slave -e \"rmarkdown::render('gunboats_slides.Rmd', output_file='index.html')\""],
		'verbosity': 2,
	}
