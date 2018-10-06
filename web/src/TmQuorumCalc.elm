module TmQuorumCalc exposing (main)

import Browser
import Html exposing (Html, button, div, text)
import Platform.Sub


type alias Model =
    { name : String }


initialModel : String -> ( Model, Cmd Msg )
initialModel flag =
    ( { name = flag }, Cmd.none )


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


type alias Document msg =
    { title : String
    , body : List (Html msg)
    }


view : Model -> Document Msg
view model =
    { title = "test"
    , body =
        [ div []
            []
        ]
    }


main =
    Browser.document
        { init = initialModel
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
