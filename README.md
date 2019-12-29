# ForkFinder -- On the space between things



#### Introduction  
Fork Finder is an application that allows us to find the common ancestor in terms of the taxonomy tree of two organisms. For example, if you want to find how similar *Arabidopsis thaliana* and *Plasmodiophora brassicae* are to eachother, you will put the two names in the application and it will return the rank at which these two organisms differ.

#### Installation

1. Clone the respository:  
	`git clone gi@github:tayabsoomro/forkFinder.git`
2. Get the necessary includes:  
	`mkdir includes && wget -O ./includes/new_taxdump.tar.gz https://ftp.ncbi.nlm.nih.gov/pub/taxonomy/new_taxdump/new_taxdump.tar.gz && cd includes && tar -xzvf new_taxdump.tar.gz && cd ..`
3. Use the tool:  
	`USAGE: ./forkFinder.sh <TaxID1> <TaxID2>`
4. Leave a feedback!