module Meeting exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Models exposing (..)
import Html.Events exposing (..)

viewAgenda : String -> Html Msg
viewAgenda agendaItem =
    li []
        [ text agendaItem ]

viewUsersInMeeting : User -> Html Msg
viewUsersInMeeting user =
    div []
        []

viewMeeting : Model -> MeetingId -> Html Msg
viewMeeting model meetingId =
        let
          maybeMeeting =
            model.meetings
              |> List.filter (\meeting -> meeting.id_ == meetingId)
              |> List.head
        in
        case maybeMeeting of
          (Just meeting) ->
              div []
                  [ h1 [] [text meeting.title]

                  ]
