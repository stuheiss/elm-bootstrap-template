module Types exposing (..)

import Bootstrap.Navbar as Navbar
import Bootstrap.Modal as Modal
import Bootstrap.Accordion as Accordion
import Navigation exposing (Location)


type Msg
    = UrlChange Location
    | NavMsg Navbar.State
    | ModalMsg Modal.State
    | AccordionMsg Accordion.State


type alias Model =
    { page : Page
    , navState : Navbar.State
    , modalState : Modal.State
    , accordionState : Accordion.State
    }


type Page
    = Home
    | GettingStarted
    | Modules
    | NotFound
    | Accordion
