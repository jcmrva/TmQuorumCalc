module TmQuorumCalc exposing (main)

import Browser
import Html exposing (Html, button, div, text)


type alias Model =
    { name : String }


initialModel : Model
initialModel =
    { name = "" }


type Msg
    = NoOp


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp -> model


view : Model -> Html Msg
view model =
    div []
        [ 
        ]


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
