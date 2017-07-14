module Meeting exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Models exposing (..)


viewAgenda : String -> Html Msg
viewAgenda agendaItem =
    li []
        [ text agendaItem ]


viewUsersInMeeting : User -> Html Msg
viewUsersInMeeting user =
    li []
        [ text (user.name ++ "  ")
        , text user.email
        ]


viewMeeting : Model -> Int -> Html Msg
viewMeeting model meetingId =
    let
        maybeMeeting =
            model.meetings
                |> List.filter (\meeting -> meeting.id_ == meetingId)
                |> List.head
    in
    case maybeMeeting of
        Just meeting ->
            div []
                [ h1 [] [ text meeting.title ]
                , p [] [ text meeting.location ]
                , p [] [ text meeting.start_time ]
                , meeting.attendees
                    |> List.map viewUsersInMeeting
                    |> li []
                ]

        Nothing ->
            div []
                [ h1 [] [ text "Oh nO ; meeting not found!" ]
                ]
