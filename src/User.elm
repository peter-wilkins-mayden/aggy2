module User exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Models exposing (..)
import Html.Events exposing (..)

viewAgenda : String -> Html Msg
viewAgenda agendaItem =
    li []
        [ text agendaItem ]

view : User -> Html Msg
view model =
    div []
        [ text "User page" ]


viewUser : User -> Html Msg
viewUser user =
    div []
        [ text (user.name ++ ": " ++ user.email)
        , button
            [ type_ "button"
            , onClick (AddAgendaItem "blah" 1 "bob@bob.com")
            ]
            [ text "Add Agenda Item" ]
        , user.agenda
            |> List.map viewAgenda
            |> ul []
        ]
