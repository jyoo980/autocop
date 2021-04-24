#lang racket

(require "github-parser.rkt")

(define (github-url-base)
  "https://api.github.com/")

(define (build-search-url term)
  (string-append (github-url-base) "search/repositories?q=" term))

(define (open-issue-url owner-name repo-name)
  (string-append (github-url-base) "repos/" owner-name "/" repo-name "/issues"))

(define (generate-open-issue-urls repo-results)
  (for/list ([repo repo-results])
    (match (parse-owner-repo repo)
      [`(,owner ,repo) (open-issue-url owner repo)]
      [other (error "Unexpected error generatorating urls: ~a\n" other)])))
  
(provide build-search-url generate-open-issue-urls)

