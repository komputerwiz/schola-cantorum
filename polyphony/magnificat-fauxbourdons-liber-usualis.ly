\version "2.18.2"

intone = {
  \once \override LyricText.self-alignment-X = #-1
}

quarterBar = {
  \once \override BreathingSign.stencil = #ly:breathing-sign::divisio-minima
  \once \override BreathingSign.Y-offset = #0
  \breathe
}

halfBar = {
  \once \override BreathingSign.stencil = #ly:breathing-sign::divisio-maior
  \once \override BreathingSign.Y-offset = #0
  \breathe
}

fullBar = {
  \once \override BreathingSign.stencil = #ly:breathing-sign::divisio-maxima
  \once \override BreathingSign.Y-offset = #0
  \breathe
}

doubleBar = {
  \once \override BreathingSign.stencil = #ly:breathing-sign::finalis
  \once \override BreathingSign.Y-offset = #0
  \breathe
}

chant = \relative c' {
  \key d \minor
  f g( a) a\breve a4( bes a g) a4. \halfBar
  a\breve g4 f g g( f d4.) \fullBar
  \break
  <d a' d>\breve <f a c>4 <c g' c> <f a c>4. \halfBar
  <f a c>\breve <c g' c>4 <d f a> <g, g' bes>\>^\markup{\italic rit.} <g g' bes> <a f' a>( <a e' a> <d a'>4.)\! \doubleBar
}

verseA = \lyricmode {
  Ma -- gní -- fi -- cat __ _
  \intone ánima me -- a \intone Dómi -- num, __
  \intone "et exsultávit spíritus" me - us,
  \intone "in Deo salu" -- tá -- ri me -- o, __ _
}

verseB = \lyricmode {
  qui -- a \intone "respéxit humilitátem ancíllæ" su -- æ.
  \intone "Ecce enim ex hoc beátam me dicent omnes gene" -- ra -- ti -- \intone ó -- nes, __
  \intone "quia fécit mihi mágna, qui" pó -- tens est,
  \intone "et sánctum" nó -- men e -- jus, __ _
}

verseC = \lyricmode {
  et mi -- \intone "sericórdia ejus a progénie in progé" -- ni -- es
  \intone "timén" -- ti -- bus \intone e -- um. __
  \intone "Fecit poténtiam in bráchio" su - o,
  \intone "dispérsit supérbos mente" cor -- dis su -- i; __ _
}

verseD = \lyricmode {
  De -- pó -- \intone "suit poténtes de" se -- de
  \intone "et exal" -- tá -- vit \intone húmi -- les; __
  \intone "esuriéntes implévit" bo - nis
  \intone "et dívites dimí" -- sit in -- á -- nes. __ _
}

verseE = \lyricmode {
  Sus -- cé -- \intone "pit Ísraël púerum" su -- um,
  \intone "recordátus misericór" -- di -- æ su -- æ, __
  \intone "sicut locútus est ad patres" no - stros,
  \intone "Ábraham et sémini e" -- jus in sæ -- cu -- la. __
}

verseF = \lyricmode {
  Gló -- ri -- \intone "a Patri, et Fí" -- li -- o,
  \intone "et Spirí" -- tu -- i \intone Sanc -- to. __
  \intone "Sicut erat in princípio, et nunc, et" sem - per,
  \intone "et in sæcula sæcu" -- ló -- rum. A -- men. __ _
}

\paper {
  #(set-paper-size "letter")

  %the following removes everything but the music for engraving as an EPS to include in other programs
  %indent = #0
  %line-width = 7.5\in
  %oddFooterMarkup = ##f
  %oddHeaderMarkup = ##f
  %bookTitleMarkup = ##f
  %scoreTitleMarkup = ##f
}

\header {
  title = "Magnificat"
  subtitle = "Fauxbourdons"
  composer = "Lc 1:46–55"
  tagline = ""
}

\score {
  \new Staff <<
    \override DynamicLineSpanner.staff-padding = #2
    \new Voice = "melody" \chant
    \new Lyrics \lyricsto melody { \set stanza = #"1. " \verseA }
    \new Lyrics \lyricsto melody { \set stanza = #"2. " \verseB }
    \new Lyrics \lyricsto melody { \set stanza = #"3. " \verseC }
    \new Lyrics \lyricsto melody { \set stanza = #"4. " \verseD }
    \new Lyrics \lyricsto melody { \set stanza = #"5. " \verseE }
    \new Lyrics \lyricsto melody { \set stanza = #"6. " \verseF }
  >>
  \layout {
    indent = #0
    #(layout-set-staff-size 15)
    \context {
      \Score
      \override LyricText #'font-size = #-1
    }
    \context {
      \Staff
      \remove "Bar_engraver"
      \remove "Time_signature_engraver"
      \remove "Clef_engraver"
      \hide Stem
    }
  }
}


\markup {
  \vspace #3
  \teeny
  \fill-line {
    \column {
      \line { Magnificat anima mea Dominum, }
      \line { et exsultavit spiritus meus, in Deo salutari meo, }
      \line { quia respexit humilitatem ancillæ suæ. }
      \line { Ecce enim ex hoc beatam me dicent omnes generationes, }
      \line { quia fecit mihi magna, qui potens est: et sanctum nomen ejus, }
      \line { et misericordia ejus a progenie in progenies timentibus eum. }
      \line { Fecit potentiam in brachio suo, }
      \line { dispersit superbos mente cordis sui; }
      \line { deposuit potentes de sede }
      \line { et exaltavit humiles; }
      \line { esurientes implevit bonis }
      \line { et divites dimisit inanes. }
      \line { Suscepit Israel puerum suum, }
      \line { recordatus misericordiæ suæ, }
      \line { sicut locutus est ad patres nostros, }
      \line { Abraham et semini ejus in sæcula. }
      \line { Gloria Patri, et Filio, et Spiritui Sancto. }
      \line { Sicut erat in principio, et nunc, et semper, et in sæcula sæculorum. Amen. }
    }
    \hspace #2
    \column \italic {
      \line { My soul proclaims the greatness of the Lord, }
      \line { and my spirit rejoices in God my Savior }
      \line { for he has looked with favor on his lowly servant. }
      \line { From this day all generations will call me blessed: }
      \line { The Almighty has done great things for me, and holy is his Name. }
      \line { He has mercy on those who fear him in every generation. }
      \line { He has shown the strength of his arm, }
      \line { he has scattered the proud in their conceit. }
      \line { He has cast down the mighty from their thrones, }
      \line { and has lifted up the lowly. }
      \line { He has filled the hungry with good things, }
      \line { and the rich he has sent away empty. }
      \line { He has come to the help of his servant Israel }
      \line { for he has remembered his promise of mercy, }
      \line { the promise he made to our fathers, }
      \line { to Abraham and his children for ever. }
      \line { Glory to the Father, and to the Son, and to the Holy Spirit: }
      \line { as it was in the beginning, is now, and will be forever. Amen. }
    }
  }
}
