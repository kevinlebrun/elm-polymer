module Card exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.Keyed


type alias Model =
    Int


init : ( Model, Cmd Msg )
init =
    ( 3, Cmd.none )


paperCard =
    node "paper-card"


paperButton =
    node "paper-button"


view : Model -> Html Msg
view model =
    Html.Keyed.node "div"
        []
        [ ( toString model
          , paperCard [ attribute "heading" ("Counter: " ++ (toString model)) ]
                [ div [ class "card-content" ] [ text (toString model) ]
                , div [ class "card-actions" ]
                    [ paperButton [ onClick Decrement ] [ text "Decrement" ]
                    , paperButton [ onClick Increment ] [ text "Increment" ]
                    ]
                ]
          )
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


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
