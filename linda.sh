#!/bin/bash

cat $1 | \
  egrep -v -f ~/code/linda/dict/nouns.txt | \
  egrep -v -f ~/code/linda/dict/nouns/from-verbs/e!ion-or.txt | \
  egrep -v -f ~/code/linda/dict/nouns/from-verbs/ion-or.txt | \
  egrep -v -f ~/code/linda/dict/nouns/from-verbs/e!ion-er.txt | \
  egrep -v -f ~/code/linda/dict/nouns/from-verbs/e!ation.txt | \
  egrep -v -f ~/code/linda/dict/nouns/from-verbs/e!ation-er.txt | \
  egrep -v -f ~/code/linda/dict/nouns/from-verbs/y!ication-icand-ier.txt | \
  egrep -v -f ~/code/linda/dict/nouns/from-verbs/ment.txt | \
  egrep -v -f ~/code/linda/dict/nouns/from-adjectives/ity-ist-ism.txt | \
  egrep -v -f ~/code/linda/dict/regular-verbs.txt | \
  egrep -v -f ~/code/linda/dict/regular-verbs/s-ed-ing.txt | \
  egrep -v -f ~/code/linda/dict/regular-verbs/s-ped-ping.txt | \
  egrep -v -f ~/code/linda/dict/regular-verbs/s-ted-ting.txt | \
  egrep -v -f ~/code/linda/dict/regular-verbs/s-ned-ning.txt | \
  egrep -v -f ~/code/linda/dict/regular-verbs/s-ged-ging.txt | \
  egrep -v -f ~/code/linda/dict/regular-verbs/s-d-ing.txt | \
  egrep -v -f ~/code/linda/dict/regular-verbs/es-ed-ing.txt | \
  egrep -v -f ~/code/linda/dict/regular-verbs/e-es-ed-ing.txt | \
  egrep -v -f ~/code/linda/dict/regular-verbs/y-ies-ied-ying.txt | \
  egrep -v -f ~/code/linda/dict/irregular-verbs.txt | \
  egrep -v -f ~/code/linda/dict/adjectives.txt | \
  egrep -v -f ~/code/linda/dict/determiners.txt | \
  egrep -v -f ~/code/linda/dict/colors.txt | \
  egrep -v -f ~/code/linda/dict/adverbs.txt | \
  egrep -v -f ~/code/linda/dict/cardinals.txt | \
  egrep -v -f ~/code/linda/dict/conjunctions.txt | \
  egrep -v -f ~/code/linda/dict/ordinals.txt | \
  egrep -v -f ~/code/linda/dict/qualifiers.txt | \
  egrep -v -f ~/code/linda/dict/pronouns.txt | \
  egrep -v -f ~/code/linda/dict/prepositions.txt | \
  egrep -v -f ~/code/linda/dict/auxiliary-verbs.txt | \
  egrep -v -f ~/code/linda/dict/names.txt | \
  cat