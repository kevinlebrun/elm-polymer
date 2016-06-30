module Counter exposing (..)

import Html exposing (..)
import Html.App exposing (..)
import Html.Events exposing (..)


type alias Model =
    Int


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , span [] [ text <| toString model ]
        , button [ onClick Increment ] [ text "+" ]
        ]


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1


main : Program Never
main =
    beginnerProgram
        { model = 0
        , view = view
        , update = update
        }
