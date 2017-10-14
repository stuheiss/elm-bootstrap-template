module Pages.Modal exposing (view)

import Types exposing (..)
import Html exposing (..)
import Bootstrap.Modal as BS_Modal
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col


view : Model -> Html Msg
view model =
    BS_Modal.config ModalMsg
        |> BS_Modal.small
        |> BS_Modal.h4 [] [ text "Getting started ?" ]
        |> BS_Modal.body []
            [ Grid.containerFluid []
                [ Grid.row []
                    [ Grid.col
                        [ Col.xs6 ]
                        [ text "Col 1" ]
                    , Grid.col
                        [ Col.xs6 ]
                        [ text "Col 2" ]
                    ]
                ]
            ]
        |> BS_Modal.view model.modalState
