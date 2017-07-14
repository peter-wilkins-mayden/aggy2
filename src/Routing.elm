module Routing exposing (..)

import Navigation exposing (Location)
import UrlParser exposing (..)


type Route
    = MeetingsRoute
    | MeetingRoute MeetingId
    | UserRoute UserId
    | NotFoundRoute


type alias UserId =
    String


type alias MeetingId =
    String


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map MeetingsRoute top
        , map MeetingRoute (s "meeting" </> string)
        , map UserRoute (s "user" </> string)
        ]


parseLocation : Location -> Route
parseLocation location =
    case parseHash matchers location of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
