module Pages.Modules exposing (view)

import Types exposing (..)
import Html exposing (..)
import Bootstrap.ListGroup as Listgroup


-- import Html.Attributes exposing (..)
-- import Html.Events exposing (onClick)
-- import Navigation exposing (Location)
-- import UrlParser exposing ((</>))
-- import Bootstrap.Navbar as Navbar
-- import Bootstrap.Grid as Grid
-- import Bootstrap.Grid.Col as Col
-- import Bootstrap.Card as Card
-- import Bootstrap.Button as Button
-- import Bootstrap.Modal as Modal


view : Model -> List (Html Msg)
view model =
    [ h1 [] [ text "Modules" ]
    , Listgroup.ul
        [ Listgroup.li [] [ text "Alert" ]
        , Listgroup.li [] [ text "Badge" ]
        , Listgroup.li [] [ text "Card" ]
        ]
    ]
