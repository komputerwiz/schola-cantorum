# Chants for the Latin Mass

This project is meant to aid technologically adept schola members, ministers, and lay faithful in the preparation of songbooks and worship aids for the Catholic Latin Mass. Included in this repository are:

* Ordinaries (I-XVIII),
* Propers (Introit, Gradual, Alleluia, Offertory, Communion, etc.), and
* Various Hymns and Antiphons.

Each chant is encoded in [gabc][gregorio] notation from the _Gregorian Missal_, _Liber Cantualis_, and other sources.

# "Modern" Arrangements

Polyphonies and other modern choral arrangements are encoded using [LilyPond][]. To build EPS versions of these files for inclusion in LaTeX templates, use the following paper settings:

    \paper {
      indent = #0
      line-width = 7.5\in % or whatever your desired width
      oddFooterMarkup = ##f
      oddHeaderMarkup = ##f
      bookTitleMarkup = ##f
      scoreTitleMarkup = ##f
    }

and execute the following command:

    lilypond -dbackend=eps -dno-gs-load-fonts -dinclude-eps-fonts FILE.ly

# Work In Progress

This project is far from complete, and contributions are more than welcome.

# Resources

* [The Gregorio Project][gregorio] - Gregorian chant notation and TeX typesetting tools
* [LilyPond][lilypond] - music engraving program for primarily modern music notation
* [Illuminare Score Editor](http://dev.illuminarepublications.com/gregorio/) - web app for writing and editing gabc
* [Corpus Christi Watershed](http://www.ccwatershed.org/) - reflections on the liturgy and many resources for the Traditional Latin Mass

# Licensing

The chants in this repository are public domain, but they are sacred and ancient, and therefore should be used with reverence.

Supporting code and templates are provided under the MIT license.

Additional licensing information for sacred texts, translations, and other excerpts will be provided where necessary.

[gregorio]: http://gregorio-project.github.io/
[lilypond]: http://lilypond.org/
