import os
import sys

helpersPath = os.path.expanduser("~/Dropbox (Princeton)/14_Software/python/")
sys.path.insert(1, helpersPath)

import helpers

templatePath = "~/Dropbox\ \(Princeton\)/8_Templates/"
website_docs = "~/Dropbox\ \(Princeton\)/5_CV/website/static/docs"
website_docs_github = "~/Github/brendancooley.github.io/docs"
softwarePath = "~/Dropbox\ \(Princeton\)/14_Software/"
verticatorPath = "~/Dropbox\ \(Princeton\)/8_Templates/plugin/verticator"
pluginDest = "index_files/reveal.js-3.8.0/plugin"
revealPath = "~/Dropbox\ \(Princeton\)/8_Templates/reveal.js-3.8.0"

def task_source():
    yield {
        'name': "migrating templates and helper functions...",
        'actions': ["mkdir -p templates",
                    "cp -a " + templatePath + "cooley-paper-template.latex " + "templates/",
                    "cp -a " + templatePath + "cooley-plain.latex " + "templates/",
				    "cp -a " + softwarePath + " source/"]
    }

def task_prep_slides():
	yield {
		'name': "moving slide files",
		'actions': ["mkdir -p css",
					"cp -a " + templatePath + "slides/ " + "css/"]
	}

def task_figs():
    yield {
        'name': 'building figs...',
        'actions': ["cd figs/;  latexmk -pdf aLine.tex; latexmk -c"]
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
                   "pandoc --template=templates/cooley-paper-template.latex --filter pandoc-citeproc -o gunboats.pdf gunboats.md"],
        'verbosity': 2,
	}

def task_post_to_web():
    """

    """
    yield {
        'name': "posting...",
        'actions': ["cp -a gunboats.pdf " + website_docs,
                    "cp -a gunboats.pdf " + website_docs_github]
    }

def task_slides():
    """build slides"""
    if os.path.isfile("references.RData") is False:
        yield {
    		'name': "collecting references...",
    		'actions':["R --slave -e \"rmarkdown::render('gunboats_slides.Rmd', output_file='index.html')\""]
        }
    # build slides, migrate verticator plugin, get new version of reveal.js and rewrite paths in index.html
    yield {
		'name': "writing slides...",
		'actions': ["R --slave -e \"rmarkdown::render('gunboats_slides.Rmd', output_file='index.html')\"",
            "perl -pi -w -e 's{reveal.js-3.3.0.1}{reveal.js-3.8.0}g' index.html",
            "cp -r " + revealPath + " index_files/",
            "cp -a " + verticatorPath + " " + pluginDest],
		'verbosity': 2,
	}

def task_other():
    otherFiles = helpers.getFiles("other/")
    for i in range(len(otherFiles)):
        fName = otherFiles[i].split(".")[0]
        suffix = otherFiles[i].split(".")[1]
        if suffix == "md":
            yield {
                'name': otherFiles[i],
                'actions':["pandoc --template=templates/cooley-plain.latex -o " +
                            fName + ".pdf " + otherFiles[i]]
            }