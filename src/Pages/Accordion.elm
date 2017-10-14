module Pages.Accordion exposing (view)

import Types exposing (..)
import Html exposing (..)
import Html.Attributes exposing (class)
import Bootstrap.Accordion as Accordion
import Bootstrap.Card as Card
import Bootstrap.Text as Text
import Bootstrap.ListGroup as ListGroup


-- We reuse functions from the Card module to build/configure accordion content


view : Model -> List (Html Msg)
view model =
    [ h2 [] [ text "Polka!" ]
    , Accordion.config AccordionMsg
        |> Accordion.withAnimation
        |> Accordion.cards
            [ Accordion.card
                { id = "card1"
                , options = [ Card.outlineSuccess, Card.align Text.alignXsCenter ]
                , header =
                    Accordion.headerH3 []
                        (Accordion.toggle [] [ text " Card 1" ])
                        |> Accordion.prependHeader
                            [ span [ class "fa fa-car" ] [] ]
                , blocks =
                    [ Accordion.block [ Card.blockAlign Text.alignXsLeft ]
                        [ Card.titleH4 [] [ text "Block title" ]
                        , Card.text [] [ text "Lorem ipsum etc" ]
                        ]
                    , Accordion.block [ Card.blockAlign Text.alignXsRight ]
                        [ Card.titleH4 [] [ text "Block2 title" ]
                        , Card.text [] [ text "Lorem ipsum etc" ]
                        ]
                    ]
                }
            , Accordion.card
                { id = "card2"
                , options = [ Card.outlineSuccess, Card.align Text.alignXsCenter ]
                , header =
                    Accordion.headerH3 []
                        (Accordion.toggle [] [ text " Card 2" ])
                        |> Accordion.prependHeader
                            [ span [ class "fa fa-taxi" ] [] ]
                , blocks =
                    [ Accordion.block []
                        [ Card.text [] [ text "Lorem ipsum etc" ] ]
                    , Accordion.listGroup
                        [ ListGroup.li [] [ text "List item 1" ]
                        , ListGroup.li [] [ text "List item 2" ]
                        ]
                    ]
                }
            ]
        |> Accordion.view model.accordionState
    ]
