#!/bin/bash

elm make counter-elm-with-paper-components/Counter.elm --output counter-elm-with-paper-components/card.js
elm make counter-elm-inside-polymer/Counter.elm --output counter-elm-inside-polymer/counter.js
elm make counter-everything-on-top/Counter.elm --output counter-everything-on-top/counter.js
elm make counter-polymer-inside-elm/Main.elm --output counter-polymer-inside-elm/main.js
elm make counter-elm/Counter.elm --output counter-elm/counter.js
