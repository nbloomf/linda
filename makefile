all: FORCE
	/app/halcyon/halcyon install /home/nathan/code/linda

tidy: \
  $(wildcard dict/*.txt) \
  $(wildcard dict/*/*.txt) \
  $(wildcard dict/*/*/*.txt)

dict/%.txt: FORCE
	$(call tidyup,dict/$*.txt)

count: FORCE
	@echo 'raw line count:' | doppler lightred
	@find dict/ -type f | xargs cat | wc -l

FORCE:


define tidyup
  @echo "tidying $(1)" | doppler lightblue
  @cat $(1) | util/balance-lines.hs
  @sort $(1) | uniq | sponge $(1)
endef
