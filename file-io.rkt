#lang racket

(require json)

;; string jsexpr -> void
;; writes a file with the given name (full path) with the stringified json content
(define (write file-name data)
  (local [(define data-string (jsexpr->string data))]
    (call-with-output-file file-name #:exists 'replace
      (lambda (out)
        (display data-string out)))))

(provide write)
