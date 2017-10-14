module Pages.GettingStarted exposing (view)

import Types exposing (..)
import Html exposing (..)
import Html.Events exposing (onClick)
import Bootstrap.Button as Button
import Bootstrap.Modal as Modal


-- import Html.Attributes exposing (..)
-- import Navigation exposing (Location)
-- import UrlParser exposing ((</>))
-- import Bootstrap.Navbar as Navbar
-- import Bootstrap.Grid as Grid
-- import Bootstrap.Grid.Col as Col
-- import Bootstrap.Card as Card
-- import Bootstrap.ListGroup as Listgroup


view : Model -> List (Html Msg)
view model =
    [ h2 [] [ text "Getting started" ]
    , Button.button
        [ Button.success
        , Button.large
        , Button.block
        , Button.attrs [ onClick <| ModalMsg Modal.visibleState ]
        ]
        [ text "Click me" ]
    ]
