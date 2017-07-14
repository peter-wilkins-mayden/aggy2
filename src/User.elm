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


viewUser : Model-> UserId -> Html Msg
viewUser model userId =
    div []
        []
