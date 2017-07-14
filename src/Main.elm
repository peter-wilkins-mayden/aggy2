module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


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
    { email = "bob@bob.com"
    , name = "Bobby B"
    , agenda = []
    }


sue =
    { email = "sue@sue.com"
    , name = "Sue S"
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
    | AddAgendaItem String Int String
    | AddMeeting


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AddAgendaItem item meetingId email ->
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
        , p [] [ text "Attendees"]
        , meeting.attendees
            |> List.map viewUser
            |> ul []
        ]


viewUser : User -> Html Msg
viewUser user =
    div []
        [text (user.name ++ ": " ++ user.email)
        , button
            [ type_ "button"
            , onClick (AddAgendaItem "blah" 1 "bob@bob.com")
            ]
            [text "Add Agenda Item"]
        , user.agenda
            |> List.map viewAgenda
            |> ul []
        ]

viewAgenda : String -> Html Msg
viewAgenda agendaItem =
    li []
       [text (agendaItem)]


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Meetings" ]
        , model.meetings
            |> List.map viewMeeting
            |> div []
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
