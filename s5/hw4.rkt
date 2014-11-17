
#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

;; put your code below

(define (sequence low high stride) 
  (if (> low high) null (cons low (sequence (+ low stride) high stride))))


(define (string-append-map xs suffix)
  (let ([f (lambda (x) (string-append x suffix))]) 
      (map f xs)))

(define (list-nth-mod xs n)
  (cond [(negative? n) (error 'list-nth-mod "negative number")]
        [(null? xs) (error 'list-nth-mod "empty list")]
        [#t (let ([i (remainder n (length xs))])
              (car (list-tail xs i)))]))

 (define powers-of-two
     (letrec ([f (lambda (x) (cons x (lambda () (f (* x 2)))))])
       (lambda () (f 2))))

(define (stream-for-n-steps s n)
  (if (zero? n) null (cons (car (s)) (stream-for-n-steps (cdr (s)) (- n 1)))))

(define funny-number-stream
  (letrec ([f (lambda(x) (let ([y (if (zero? (modulo x 5)) (- 0 x) x)]) (cons y (lambda () (f (+ x 1))))))])
    (lambda () (f 1))))
  
(define dan-then-dog
  (letrec ([dan (cons "dan.jpg" (lambda() dog))]
           [dog (cons "dog.jpg" (lambda() dan))])
    (lambda() dan)))

(define (stream-add-zero s)
  (lambda () 
    (let ([pair (s)]) 
               (cons (cons 0 (car pair)) (stream-add-zero (cdr pair))))))

(define (cycle-lists xs ys)
  (letrec ([f (lambda (n) (cons (cons (list-nth-mod xs n) (list-nth-mod ys n)) (lambda () (f (+ n 1)))))])
    (lambda () (f 0) )))

(define (vector-assoc v vec)
  (define (f n)
    (if (= n (vector-length vec)) #f
        (let ([el (vector-ref vec n)])
          (cond [(not (pair? el)) (f (+ n 1))]
                [(equal? v (car el)) el]
                [#t (f (+ n 1))]))))
  (f 0))

(define (cached-assoc xs n)
  (let* ([memo (make-vector n #f)]
         [next 0]
         [f (lambda (v)
              (cond [(vector-assoc v memo) (vector-assoc v memo)]
                    [(assoc v xs) (begin
                                    (vector-set! memo next (assoc v xs))
                                    (set! next (remainder (+ next 1) n))
                                    (assoc v xs))]
                    [#t #f]))])
    f))