module Meeting exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href, value)
import Models exposing (Meeting)


view : Meeting -> Html Msg
view model =
    div []
        [ text "Meetings page" ]


viewMeeting : Meeting -> Html Msg
viewMeeting meeting =
    div []
        [ text (toString meeting.id_ ++ ":  ")
        , text meeting.title
        , p [] [ text "Attendees" ]
        , meeting.attendees
            |> List.map viewUser
            |> ul []
        , p [] [ text "Agenda" ]
        , meeting.agenda
            |> List.map viewAgenda
            |> ul []
        ]
