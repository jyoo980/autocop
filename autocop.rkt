#lang racket

(require net/url)
(require "url-builder.rkt")
(require "github-parser.rkt")

;; string -> string
;; searches GitHub for repositories containing the term, produces
;; string representation of JSON response
(define (search-gh-for term)
  (call/input-url (string->url (build-search-url term))
                  get-pure-port
                  port->string))

#|
(define SEARCH-ITEMS (search-gh-for "term"))
(map print (map-to-repo-results (extract-items (raw->jsexpr SEARCH-ITEMS))))
|#