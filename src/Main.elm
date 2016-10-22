import Html exposing (Html, Attribute, div, span, text)
import Html.Attributes exposing (style)
import Html.App as App

type alias Model = { elInt : ExplicitLength Int
                   , elStr : ExplicitLength String
                   }


initialModel : Model
initialModel =  { elInt = { value = "test with Int"
                          , numericValue = 1.0
                          , units = 1
                          , unitLabel = "unitLabel"
                          , length = Compatible
                          , lengthOrAuto = Compatible
                          , lengthOrNumber = Compatible
                          , lengthOrNone = Compatible
                          , lengthOrMinMaxDimension = Compatible
                          , lengthOrNoneOrMinMaxDimension = Compatible
                          , textIndent = Compatible
                          , flexBasis = Compatible
                          , lengthOrNumberOrAutoOrNoneOrContent = Compatible
                          , fontSize = Compatible
                          }
                , elStr = { value = "test with String"
                          , numericValue = 1.0
                          , units = "1"
                          , unitLabel = "unitLabel"
                          , length = Compatible
                          , lengthOrAuto = Compatible
                          , lengthOrNumber = Compatible
                          , lengthOrNone = Compatible
                          , lengthOrMinMaxDimension = Compatible
                          , lengthOrNoneOrMinMaxDimension = Compatible
                          , textIndent = Compatible
                          , flexBasis = Compatible
                          , lengthOrNumberOrAutoOrNoneOrContent = Compatible
                          , fontSize = Compatible
                          }
                }


main =
  App.beginnerProgram { model = initialModel, view = view, update = update }


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


view {elInt, elStr} =
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
            , span [ spanText ] [ text (differentFunc (AExplicitLength elInt)) ]
            , span [ spanText ] [ text (differentFunc (AExplicitLength elStr)) ]
            ]
      ]


type Simple = Simple1 | Simple2


simpleFunc : Simple -> String
simpleFunc param =
  case param of
    Simple1 -> "This is a Simple1 type" 
    Simple2 -> "This is a Simple2 type"


type Compatible
  = Compatible


type alias ExplicitLength units =
  { value : String
  , numericValue : Float
  , units : units
  , unitLabel : String
  , length : Compatible
  , lengthOrAuto : Compatible
  , lengthOrNumber : Compatible
  , lengthOrNone : Compatible
  , lengthOrMinMaxDimension : Compatible
  , lengthOrNoneOrMinMaxDimension : Compatible
  , textIndent : Compatible
  , flexBasis : Compatible
  , lengthOrNumberOrAutoOrNoneOrContent : Compatible
  , fontSize : Compatible
  }


type DifferentTypes units
  = AString String
  | AInt Int
  | ABool Bool
  | AFunc (Int -> String)
  | AExplicitLength (ExplicitLength units)


differentFunc : DifferentTypes a -> String
differentFunc dType =
  case dType of
    AString s -> "This is the string: " ++ s
    AInt i -> "This is the int: " ++ toString i
    ABool b -> "This is the bool: " ++ toString b
    AFunc f -> "This is the func: receive a Int as 1 and return" ++ (f 1) ++ " as String"
    AExplicitLength el -> "This is the explicit length with value: " ++ el.value
