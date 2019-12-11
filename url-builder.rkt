#lang racket

(define (github-url-base)
  "https://api.github.com/")

(define (build-search-url term)
  (string-append (github-url-base) "search/repositories?q=" term))

(provide github-url-base build-search-url)