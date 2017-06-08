module Counter exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
    Int


init : ( Model, Cmd Msg )
init =
    ( 3, Cmd.none )


paperCard =
    node "paper-card"


paperButton =
    node "paper-button"


heading =
    attribute "heading"


cardContent =
    div [ class "card-content" ]


cardActions =
    div [ class "card-actions" ]


view : Model -> Html Msg
view model =
    div []
        [ paperCard [ heading "Hello World!" ]
            [ cardContent [ text (toString model) ]
            , cardActions
                [ paperButton [ onClick Decrement ] [ text "Decrement" ]
                , paperButton [ onClick Increment ] [ text "Increment" ]
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


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
