import Html exposing (Html, Attribute, div, span, text)
import Html.Attributes exposing (style)
import Html.App as App


main =
  App.beginnerProgram { model = 0, view = view, update = update }


type Msg = NoOp


update msg model =
  model


spanText : Attribute a
spanText =
  style
      [ ("display", "block")
      , ("clear", "both")
      ]


view model =
  div []
    [ span [ spanText ] [ text (simpleFunc1 Simple1) ]
    , span [ spanText ] [ text (simpleFunc1 Simple2) ]
    ]


type Simple = Simple1 | Simple2

simpleFunc1 : Simple -> String
simpleFunc1 param =
  case param of
    Simple1 -> "This is a Simple1 type" 
    Simple2 -> "This is a Simple2 type"
