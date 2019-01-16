-- | This module defines safe DOM event function and property accessors.

module React.Basic.DOM.Events
  ( bubbles
  , cancelable
  , eventPhase
  , eventPhaseNone
  , eventPhaseCapturing
  , eventPhaseAtTarget
  , eventPhaseBubbling
  , isTrusted
  , nativeEvent
  , preventDefault
  , isDefaultPrevented
  , stopPropagation
  , isPropagationStopped
  , target
  , currentTarget
  , relatedTarget
  , targetChecked
  , targetValue
  , timeStamp
  , type_
  , key
  , code
  , char
  , location
  , repeat
  , locale
  , ctrlKey
  , shiftKey
  , altKey
  , metaKey
  , detail
  , screenX
  , screenY
  , clientX
  , clientY
  , targetX
  , targetY
  , pageX
  , pageY
  , button
  , buttons
  , normalizedWheel
  , deltaMode
  , deltaX
  , deltaY
  , deltaZ
  ) where

import Prelude

import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Effect.Unsafe (unsafePerformEffect)
import React.Basic.Events (EventFn, SyntheticEvent, unsafeEventFn)
import Unsafe.Coerce (unsafeCoerce)
import Web.Event.Internal.Types (Event, EventTarget)

-- | General event fields

bubbles :: EventFn SyntheticEvent Boolean
bubbles = unsafeEventFn \e -> (unsafeCoerce e).bubbles

cancelable :: EventFn SyntheticEvent Boolean
cancelable = unsafeEventFn \e -> (unsafeCoerce e).cancelable

eventPhase :: EventFn SyntheticEvent Int
eventPhase = unsafeEventFn \e -> (unsafeCoerce e).eventPhase

eventPhaseNone :: Int
eventPhaseNone = 0

eventPhaseCapturing :: Int
eventPhaseCapturing = 1

eventPhaseAtTarget :: Int
eventPhaseAtTarget = 2

eventPhaseBubbling :: Int
eventPhaseBubbling = 3

isTrusted :: EventFn SyntheticEvent Boolean
isTrusted = unsafeEventFn \e -> (unsafeCoerce e).isTrusted

nativeEvent :: EventFn SyntheticEvent Event
nativeEvent = unsafeEventFn \e -> (unsafeCoerce e).nativeEvent

preventDefault :: EventFn SyntheticEvent SyntheticEvent
preventDefault = unsafeEventFn \e -> unsafePerformEffect do
  _ <- (unsafeCoerce e).preventDefault
  pure e

isDefaultPrevented :: EventFn SyntheticEvent Boolean
isDefaultPrevented = unsafeEventFn \e -> unsafePerformEffect do
  (unsafeCoerce e).isDefaultPrevented

stopPropagation :: EventFn SyntheticEvent SyntheticEvent
stopPropagation = unsafeEventFn \e -> unsafePerformEffect do
  _ <- (unsafeCoerce e).stopPropagation
  pure e

isPropagationStopped :: EventFn SyntheticEvent Boolean
isPropagationStopped = unsafeEventFn \e -> unsafePerformEffect do
  (unsafeCoerce e).isPropagationStopped

target :: EventFn SyntheticEvent EventTarget
target = unsafeEventFn \e -> (unsafeCoerce e).target

currentTarget :: EventFn SyntheticEvent EventTarget
currentTarget = unsafeEventFn \e -> (unsafeCoerce e).currentTarget

relatedTarget :: EventFn SyntheticEvent (Maybe EventTarget)
relatedTarget = unsafeEventFn \e -> toMaybe (unsafeCoerce e).relatedTarget

targetChecked :: EventFn SyntheticEvent (Maybe Boolean)
targetChecked = unsafeEventFn \e -> toMaybe (unsafeCoerce e).target.checked

targetValue :: EventFn SyntheticEvent (Maybe String)
targetValue = unsafeEventFn \e -> toMaybe (unsafeCoerce e).target.value

timeStamp :: EventFn SyntheticEvent Number
timeStamp = unsafeEventFn \e -> (unsafeCoerce e).timeStamp

type_ :: EventFn SyntheticEvent String
type_ = unsafeEventFn \e -> (unsafeCoerce e)."type"

-- | Keyboard event fields

key :: EventFn SyntheticEvent (Maybe String)
key = unsafeEventFn \e -> toMaybe (unsafeCoerce e).key

code :: EventFn SyntheticEvent (Maybe String)
code = unsafeEventFn \e -> toMaybe (unsafeCoerce e).code

char :: EventFn SyntheticEvent (Maybe String)
char = unsafeEventFn \e -> toMaybe (unsafeCoerce e).char

location :: EventFn SyntheticEvent (Maybe Number)
location = unsafeEventFn \e -> toMaybe (unsafeCoerce e).location

repeat :: EventFn SyntheticEvent (Maybe Boolean)
repeat = unsafeEventFn \e -> toMaybe (unsafeCoerce e).repeat

locale :: EventFn SyntheticEvent (Maybe String)
locale = unsafeEventFn \e -> toMaybe (unsafeCoerce e).locale

-- | Mouse event fields

detail :: EventFn SyntheticEvent (Maybe Int)
detail = unsafeEventFn \e -> toMaybe (unsafeCoerce e).detail

screenX :: EventFn SyntheticEvent (Maybe Number)
screenX = unsafeEventFn \e -> toMaybe (unsafeCoerce e).screenX

screenY :: EventFn SyntheticEvent (Maybe Number)
screenY = unsafeEventFn \e -> toMaybe (unsafeCoerce e).screenY

clientX :: EventFn SyntheticEvent (Maybe Number)
clientX = unsafeEventFn \e -> toMaybe (unsafeCoerce e).clientX

clientY :: EventFn SyntheticEvent (Maybe Number)
clientY = unsafeEventFn \e -> toMaybe (unsafeCoerce e).clientY

pageX :: EventFn SyntheticEvent (Maybe Number)
pageX = unsafeEventFn \e -> toMaybe (unsafeCoerce e).pageX

pageY :: EventFn SyntheticEvent (Maybe Number)
pageY = unsafeEventFn \e -> toMaybe (unsafeCoerce e).pageY


-- foreign import getBoundingClientRect ∷ EventTarget → { left ∷ Number , top ∷ Number , right ∷ Number , bottom ∷ Number }
foreign import getTargetX ∷ SyntheticEvent → Nullable Number
foreign import getTargetY ∷ SyntheticEvent → Nullable Number

targetX :: EventFn SyntheticEvent (Maybe Number)
targetX = unsafeEventFn (toMaybe <<< getTargetX)

targetY :: EventFn SyntheticEvent (Maybe Number)
targetY = unsafeEventFn (toMaybe <<< getTargetY)


button :: EventFn SyntheticEvent (Maybe Int)
button = unsafeEventFn \e -> toMaybe (unsafeCoerce e).button

buttons :: EventFn SyntheticEvent (Maybe Int)
buttons = unsafeEventFn \e -> toMaybe (unsafeCoerce e).buttons

-- \ Shared keyboard + mouse fields

ctrlKey :: EventFn SyntheticEvent (Maybe Boolean)
ctrlKey = unsafeEventFn \e -> toMaybe (unsafeCoerce e).ctrlKey

shiftKey :: EventFn SyntheticEvent (Maybe Boolean)
shiftKey = unsafeEventFn \e -> toMaybe (unsafeCoerce e).shiftKey

altKey :: EventFn SyntheticEvent (Maybe Boolean)
altKey = unsafeEventFn \e -> toMaybe (unsafeCoerce e).altKey

metaKey :: EventFn SyntheticEvent (Maybe Boolean)
metaKey = unsafeEventFn \e -> toMaybe (unsafeCoerce e).metaKey

-- | Wheel event fields

-- | Normalized wheel event field
-- Based on npm's normalize wheel
type NormalizedWheel =
  { spinX :: Number
  , spinY :: Number
  , pixelX :: Number
  , pixelY :: Number }

foreign import computeNormalizedWheel :: SyntheticEvent -> Nullable NormalizedWheel

normalizedWheel :: EventFn SyntheticEvent (Maybe NormalizedWheel)
normalizedWheel = unsafeEventFn (toMaybe <<< computeNormalizedWheel)

-- | Original wheel event field

deltaMode :: EventFn SyntheticEvent (Maybe Int)
deltaMode = unsafeEventFn \e -> toMaybe (unsafeCoerce e).deltaMode

deltaX :: EventFn SyntheticEvent (Maybe Number)
deltaX = unsafeEventFn \e -> toMaybe (unsafeCoerce e).deltaX

deltaY :: EventFn SyntheticEvent (Maybe Number)
deltaY = unsafeEventFn \e -> toMaybe (unsafeCoerce e).deltaY

deltaZ :: EventFn SyntheticEvent (Maybe Number)
deltaZ = unsafeEventFn \e -> toMaybe (unsafeCoerce e).deltaZ
