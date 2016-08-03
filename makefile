all: FORCE
	/app/halcyon/halcyon install /home/nathan/code/linda

tidy: FORCE
	$(call tidyup,dict/adjectives.txt)
	$(call tidyup,dict/adverbs.txt)
	$(call tidyup,dict/conjunctions.txt)
	$(call tidyup,dict/irregular-verbs.txt)
	$(call tidyup,dict/auxiliary-verbs.txt)
	$(call tidyup,dict/nouns.txt)
	$(call tidyup,dict/names.txt)
	$(call tidyup,dict/prepositions.txt)
	$(call tidyup,dict/pronouns.txt)
	$(call tidyup,dict/qualifiers.txt)
	$(call tidyup,dict/regular-verbs.txt)
	$(call tidyup,dict/regular-verbs/e-es-ed-ing.txt)
	$(call tidyup,dict/regular-verbs/es-ed-ing.txt)
	$(call tidyup,dict/regular-verbs/s-ed-ing.txt)
	$(call tidyup,dict/regular-verbs/y-ies-ied-ying.txt)

FORCE:


define tidyup
  @sort $(1) | uniq | sponge $(1)
endef
