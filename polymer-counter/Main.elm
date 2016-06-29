module Main exposing (..)

import Html exposing (..)
import Html.App exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as Json


type alias Model =
    Int


init : ( Model, Cmd Msg )
init =
    ( 2, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ node "my-counter"
            [ attribute "value" <| toString model, on "value-changed" (Json.map Change <| Json.at [ "detail", "value" ] Json.int) ]
            [ ]
        , button [ onClick Reset ] [ text "Reset" ]
        , p [ class "help" ] [ text <| "In Elm, the value is: " ++ (toString model) ]
        ]


helpMessage model =
    p [ class "help" ] [ text <| "My help message" ++ (toString model) ]


type Msg
    = NoOp
    | Change Int
    | Reset


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Change v ->
            ( v, Cmd.none )

        Reset ->
            init

        NoOp ->
            ( model, Cmd.none )


main : Program Never
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
