#lang racket

(require net/url)
(require "url-builder.rkt")
(require "github-parser.rkt")
(require "file-io.rkt")

;; string -> string
;; searches GitHub for repositories containing the term, produces
;; string representation of JSON response
(define (search-gh-for term)
  (call/input-url (string->url (build-search-url term))
                  get-pure-port
                  port->string))

(define SEARCH-ITEMS (search-gh-for "insightubc"))
(define RESULTS-JSON (raw->jsexpr SEARCH-ITEMS))

; Save to disk
(write "results.json" RESULTS-JSON)

; (map print (map-to-repo-results (extract-items (raw->jsexpr SEARCH-ITEMS))))

