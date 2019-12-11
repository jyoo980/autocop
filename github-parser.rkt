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
  (map (lambda (item) (hash-ref item key)) items))

(define (map-to-repo-results items)
  (local [(define full-names (extract-val items 'full_name))
          (define html-urls (extract-val items 'html_url))]
    (foldl (lambda (html name acc)
             (append acc (list (repo-result name html))))
           empty
           full-names
           html-urls)))

(provide raw->jsexpr extract-items extract-val map-to-repo-results)