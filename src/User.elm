module User exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Models exposing (..)


viewAgenda : String -> Html Msg
viewAgenda agendaItem =
    li []
        [ text agendaItem ]


view : User -> Html Msg
view model =
    div []
        [ text "User page" ]


viewUser : Model -> String -> Html Msg
viewUser model userId =
    div []
        []
