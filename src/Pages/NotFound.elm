module Pages.NotFound exposing (view)

import Types exposing (..)
import Html exposing (..)


-- import Html.Attributes exposing (..)
-- import Html.Events exposing (onClick)
-- import Navigation exposing (Location)
-- import UrlParser exposing ((</>))
-- import Bootstrap.Navbar as Navbar
-- import Bootstrap.Grid as Grid
-- import Bootstrap.Grid.Col as Col
-- import Bootstrap.Card as Card
-- import Bootstrap.Button as Button
-- import Bootstrap.ListGroup as Listgroup
-- import Bootstrap.Modal as Modal


view : List (Html Msg)
view =
    [ h1 [] [ text "Not found" ]
    , text "SOrry couldn't find that page"
    ]
