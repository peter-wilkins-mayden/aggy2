module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (src)


---- MODEL ----


type alias User =
    { email : String
    , name : String
    , agenda : List String
    }


type alias Meeting =
    { id_ : Int
    , start_time : String
    , duration : Int
    , title : String
    , attendees : List User
    , location : String
    , agenda : List String
    }


bob =
    { email = "String"
    , name = "Bob"
    , agenda = []
    }


sue =
    { email = "String"
    , name = "Sue"
    , agenda = []
    }


someMeetings : List Meeting
someMeetings =
    [ { id_ = 1
      , start_time = "String"
      , duration = 60
      , title = "meeting 1"
      , attendees = [ bob, sue ]
      , location = "place 1"
      , agenda = []
      }
    , { id_ = 2
      , start_time = "String"
      , duration = 4
      , title = "meeting 2"
      , attendees = [ bob, sue ]
      , location = "place 2"
      , agenda = []
      }
    ]


type alias Model =
    { meetings : List Meeting
    }


init : ( Model, Cmd Msg )
init =
    ( { meetings = someMeetings
      }
    , Cmd.none
    )



---- UPDATE ----


type Msg
    = NoOp
    | AddAgendaItem String Int
    | AddMeeting


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AddAgendaItem item meetingId ->
            ( model, Cmd.none )

        AddMeeting ->
            ( model, Cmd.none )

        NoOp ->
            ( model, Cmd.none )



---- VIEW ----


viewMeeting : Meeting -> Html Msg
viewMeeting meeting =
    div []
        [ text (toString meeting.id_ ++ ":  ")
        , text meeting.title
        , meeting.attendees
            |> List.map viewUser
            |> ul []
        ]


viewUser : User -> Html Msg
viewUser user =
    div []
        []


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Meetings" ]
        , model.meetings
            |> List.map viewMeeting
            |> ul []
        ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
