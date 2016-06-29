module Card exposing (..)

import Html exposing (..)
import Html.App exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
    Int


init : ( Model, Cmd Msg )
init =
    ( 3, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ node "paper-card"
            [ attribute "heading" <| "Counter: " ++ (toString model) ]
            [ div [ class "card-content" ] [ text <| toString model ]
            , div [ class "card-actions" ]
                [ node "paper-button" [ onClick Decrement ] [ text "Decrement" ]
                , node "paper-button" [ onClick Increment ] [ text "Increment" ]
                ]
            ]
        ]


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( model + 1, Cmd.none )

        Decrement ->
            ( model - 1, Cmd.none )


main : Program Never
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
