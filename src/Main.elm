module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Meeting exposing (..)
import Models exposing (..)
import Navigation exposing (Location)
import Routing exposing (..)
import User exposing (..)


---- MODEL ----


initialModel : Route -> Model
initialModel route =
    { meetings = someMeetings
    , route = route
    }


init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            Routing.parseLocation location
    in
    ( initialModel currentRoute, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp
    | AddAgendaItem String Int String
    | AddMeeting
    | OnLocationChange Location


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AddAgendaItem item meetingId email ->
            ( { model
                | meetings =
                    List.map
                        (\meeting ->
                            if meeting.id_ == meetingId then
                                { meeting | agenda = item :: meeting.agenda }
                            else
                                meeting
                        )
                        model.meetings
              }
            , Cmd.none
            )

        AddMeeting ->
            ( model, Cmd.none )

        NoOp ->
            ( model, Cmd.none )

        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
            ( { model | route = newRoute }, Cmd.none )



---- VIEW ----


viewAgenda : String -> Html Msg
viewAgenda agendaItem =
    li []
        [ text agendaItem ]


viewAllMeetings : Model -> Html Msg
viewAllMeetings model =
    div []
        [ h1 [] [ text "Meetings" ]
        , model.meetings
            |> List.map viewMeeting
            |> div []
        ]


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        UserRoute id_ ->
            viewUser model id_

        MeetingRoute id_ ->
            viewMeeting model id_

        MeetingsRoute ->
            viewAllMeetings model

        NotFoundRoute ->
            notFoundView


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Navigation.program OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = always Sub.none
        }
