import Html exposing (Html, Attribute, div, span, text)
import Html.Attributes exposing (style)
import Html.App as App


main =
  App.beginnerProgram { model = 0, view = view, update = update }


type Msg = NoOp


update msg model =
  model


intToString : Int -> String
intToString i =
  toString i


spanText : Attribute a
spanText =
  style
      [ ("display", "block")
      , ("clear", "both")
      ]


group : Attribute a
group =
  style
    [ ("display", "block")
    , ("clear", "both")
    , ("border", "solid 1px #000")
    , ("margin-bottom", "12px")
    , ("padding", "4px")
    ]


view model =
  div []
      [ div [ group ]
            [ span [ spanText ] [ text (simpleFunc Simple1) ]
            , span [ spanText ] [ text (simpleFunc Simple2) ]
            ]
      , div [ group ]
            [ span [ spanText ] [ text (differentFunc (AString "test")) ]
            , span [ spanText ] [ text (differentFunc (AInt 2)) ]
            , span [ spanText ] [ text (differentFunc (ABool True)) ]
            , span [ spanText ] [ text (differentFunc (AFunc intToString)) ]
            ]
      ]


type Simple = Simple1 | Simple2


simpleFunc : Simple -> String
simpleFunc param =
  case param of
    Simple1 -> "This is a Simple1 type" 
    Simple2 -> "This is a Simple2 type"


type DifferentTypes
  = AString String
  | AInt Int
  | ABool Bool
  | AFunc (Int -> String)


differentFunc : DifferentTypes -> String
differentFunc dType =
  case dType of
    AString s -> "This is the string: " ++ s
    AInt i -> "This is the int: " ++ toString i
    ABool b -> "This is the bool: " ++ toString b
    AFunc f -> "This is the func: receive a Int as 1 and return" ++ (f 1) ++ " as String"
