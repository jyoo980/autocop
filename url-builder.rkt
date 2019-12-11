#lang racket

(require "github-parser.rkt")

(define (github-url-base)
  "https://api.github.com/")

(define (build-search-url term)
  (string-append (github-url-base) "search/repositories?q=" term))

(define (open-issue-url owner-name repo-name)
  (string-append (github-url-base) "repos/" owner-name "/" repo-name "/issues"))

(define (generate-open-issue-urls repo-results)
  (map (lambda (repo-result)
         (local [(define owner-repo (parse-owner-repo repo-result))]
           (open-issue-url (first owner-repo) (second owner-repo))))
       repo-results))

(provide build-search-url generate-open-issue-urls)