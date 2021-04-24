#lang racket

(require json)
(require racket/struct)

(struct repo-result (name url)
  #:methods gen:custom-write
  [(define write-proc
     (make-constructor-style-printer
      (lambda (obj) 'repo-result)
      (lambda (obj) (list (repo-result-name obj) (repo-result-url obj)))))])

(define (raw->jsexpr js-string)
  (string->jsexpr js-string))

(define (extract-items full-data)
  (hash-ref full-data 'items))

(define (extract-val items key)
  (for/list ([item items])
    (hash-ref item key)))

(define (map-to-repo-results items)
  (let ([full-names (extract-val items 'full_name)]
        [html-urls (extract-val items 'html_url)])
    (foldl (lambda (name url acc)
              (append acc (list (repo-result name url))))
            empty
            full-names
            html-urls)))

(define (parse-owner-repo repo-result)
  (string-split (repo-result-name repo-result) #rx"/"))

(provide repo-result-name
         raw->jsexpr
         extract-items
         extract-val
         map-to-repo-results
         parse-owner-repo)
