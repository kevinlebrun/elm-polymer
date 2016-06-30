port module Main exposing (..)

import Html exposing (..)
import Html.App exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as Json


type alias Model =
    Int


init : { a | value : Int } -> ( Model, Cmd Msg )
init flags =
    ( flags.value, Cmd.none )


detailValue =
    Json.at [ "detail", "value" ] Json.int


onValueChanged tagger =
    on "value-changed" <| Json.map tagger detailValue

value =
    attribute "value"

myCounter =
    node "my-counter"


view : Model -> Html Msg
view model =
    div []
        [ myCounter [ value <| toString model , onValueChanged Change ] []
        , p []
            [ text "Controls:"
            , button [ onClick Reset ] [ text "Reset" ]
            ]
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
            ( v, change v )

        Reset ->
            ( 0, change 0 )

        NoOp ->
            ( model, Cmd.none )


main : Program { value : Int }
main =
    programWithFlags
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


port change : Model -> Cmd msg
