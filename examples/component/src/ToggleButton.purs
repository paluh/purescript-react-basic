module ToggleButton where

import Prelude

import React.Basic as React
import React.Basic.DOM as R
import React.Basic.EventProcessor (handle_) as EventsProcessor

type Props =
  { label :: String
  }

component :: React.Component Props
component = React.component { displayName: "ToggleButton", initialState, receiveProps, render, willUnmount }
  where
    willUnmount = const $ pure unit
    initialState = const $ pure
      { on: false
      }

    receiveProps _ =
      pure unit

    render { props, state, setState } =
      R.button
        { onClick: EventsProcessor.handle_
            (setState \s -> s { on = not s.on })
        , children:
            [ R.text props.label
            , R.text if state.on
                       then " On"
                       else " Off"
            ]
        }
