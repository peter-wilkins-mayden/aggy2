module Models exposing (..)

import Navigation exposing (Location)


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
      , start_time = "Monday at 10"
      , duration = 60
      , title = "meeting 1"
      , attendees = [ bob, sue ]
      , location = "pub"
      , agenda = []
      }
    , { id_ = 2
      , start_time = "Friday at 4"
      , duration = 4
      , title = "meeting 2"
      , attendees = [ bob, sue ]
      , location = "club"
      , agenda = []
      }
    ]


type alias Model =
    { meetings : List Meeting
    , route : Route
    }


type Route
    = MeetingsRoute
    | MeetingRoute Int
    | UserRoute String
    | NotFoundRoute


type Msg
    = NoOp
    | AddAgendaItem String Int String
    | AddMeeting
    | OnLocationChange Location
