#lang racket

(require 2htdp/batch-io)
(write-file "highscore.txt" "dave 25\nbarry 40")
(read-lines "highscore.txt")