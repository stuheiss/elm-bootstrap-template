module BootstrapLayout exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)


-- import Html.Events exposing (onClick)

import Navigation exposing (Location)
import UrlParser exposing ((</>))
import Bootstrap.Navbar as Navbar
import Bootstrap.Grid as Grid


-- import Bootstrap.Grid.Col as Col
-- import Bootstrap.Card as Card
-- import Bootstrap.Button as Button
-- import Bootstrap.ListGroup as Listgroup

import Bootstrap.Modal as BS_Modal
import Bootstrap.Accordion as BS_Accordion
import Pages.Home as Home
import Pages.GettingStarted as GettingStarted
import Pages.Modules as Modules
import Pages.NotFound as NotFound
import Pages.Modal as Modal
import Pages.Accordion as Accordion
import Types exposing (..)


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { view = view
        , update = update
        , subscriptions = subscriptions
        , init = init
        }



-- INIT


init : Location -> ( Model, Cmd Msg )
init location =
    let
        ( navState, navCmd ) =
            Navbar.initialState NavMsg

        ( model, urlCmd ) =
            urlUpdate location
                { navState = navState
                , page = Home
                , modalState = BS_Modal.hiddenState
                , accordionState = BS_Accordion.initialState
                }
    in
        ( model, Cmd.batch [ urlCmd, navCmd ] )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Navbar.subscriptions model.navState NavMsg
        , BS_Accordion.subscriptions model.accordionState AccordionMsg
        ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            urlUpdate location model

        NavMsg state ->
            ( { model | navState = state }
            , Cmd.none
            )

        ModalMsg state ->
            ( { model | modalState = state }
            , Cmd.none
            )

        AccordionMsg state ->
            ( { model | accordionState = state }
            , Cmd.none
            )



-- NAVIGATION


urlUpdate : Navigation.Location -> Model -> ( Model, Cmd Msg )
urlUpdate location model =
    case decode location of
        Nothing ->
            ( { model | page = NotFound }, Cmd.none )

        Just route ->
            ( { model | page = route }, Cmd.none )


decode : Location -> Maybe Page
decode location =
    UrlParser.parseHash routeParser location


routeParser : UrlParser.Parser (Page -> a) a
routeParser =
    UrlParser.oneOf
        [ UrlParser.map Home UrlParser.top
        , UrlParser.map GettingStarted (UrlParser.s "getting-started")
        , UrlParser.map Modules (UrlParser.s "modules")
        , UrlParser.map Accordion (UrlParser.s "accordion")
        ]



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ menu model
        , mainContent model
        , Modal.view model
        ]


menu : Model -> Html Msg
menu model =
    Navbar.config NavMsg
        |> Navbar.withAnimation
        |> Navbar.container
        |> Navbar.brand [ href "#" ] [ text "Elm Bootstrap" ]
        |> Navbar.items
            [ Navbar.itemLink [ href "#getting-started" ] [ text "Getting started" ]
            , Navbar.itemLink [ href "#modules" ] [ text "Modules" ]
            , Navbar.itemLink [ href "#accordion" ] [ text "Accordion" ]
            ]
        |> Navbar.view model.navState


mainContent : Model -> Html Msg
mainContent model =
    Grid.container [] <|
        case model.page of
            Home ->
                Home.view model

            GettingStarted ->
                GettingStarted.view model

            Modules ->
                Modules.view model

            NotFound ->
                NotFound.view

            Accordion ->
                Accordion.view model
