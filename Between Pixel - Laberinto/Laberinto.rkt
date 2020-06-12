(require (lib "graphics.ss" "graphics"));;Importacion de la libreria                             
(open-graphics);;Abrir la libreria
;;------------------------------------------
;;Animación de carga
;;------------------------------------------
(define (intro)
  (define wininicio (open-viewport "Between pixels" 600 503))
  ((draw-pixmap wininicio) "Logo.png" (make-posn 0 0) "blue")
  (sleep 0.3)
  ((draw-solid-rectangle wininicio)(make-posn 270 420) 10 10 "blue");;Cuadro azul
  (sleep 0.35)
  ((draw-solid-rectangle wininicio)(make-posn 290 420) 10 10 "blue")
  (sleep 0.4)
  ((draw-solid-rectangle wininicio)(make-posn 310 420) 10 10 "blue")
  (sleep 0.5)
  (close-viewport wininicio)
  (menu)
  )

;;------------------------------------------
;;Puntaje en pantalla
;;------------------------------------------
(define (puntaje p d x y cont ventana);;Esta función cumple con el objetivo de mostrar en pantalla el puntaje actual del jugador, para eso divide cada digito del puntaje actual y dibuja una imagen con el número correspondiente
  (if (< cont 3)
      (cond ((= (modulo (quotient p d) 10) 0) (begin
                                                ((draw-pixmap ventana) "0.png" (make-posn x y) "blue");; p = puntaje d = variable para separar digitos x = posición en X para dibujar la imagen y = posición en Y para dibujar
                                                (puntaje p (/ d 10) (+ x 18) y (+ cont 1) ventana)
                                                )
                                              )
            ((= (modulo (quotient p d) 10) 1) (begin
                                                ((draw-pixmap ventana) "1.png" (make-posn x y) "blue")    
                                                (puntaje p (/ d 10) (+ x 18) y (+ cont 1) ventana)
                                                )
                                              )
            ((= (modulo (quotient p d) 10) 2) (begin
                                                ((draw-pixmap ventana) "2.png" (make-posn x y) "blue")
                                                (puntaje p (/ d 10) (+ x 18) y (+ cont 1) ventana)
                                                )
                                              )
            ((= (modulo (quotient p d) 10) 3) (begin
                                                ((draw-pixmap ventana) "3.png" (make-posn x y) "blue")
                                                (puntaje p (/ d 10) (+ x 18) y (+ cont 1) ventana)
                                                )
                                              )
            ((= (modulo (quotient p d) 10) 4) (begin
                                                ((draw-pixmap ventana) "4.png" (make-posn x y) "blue")
                                                (puntaje p (/ d 10) (+ x 18) y (+ cont 1) ventana)
                                                )
                                              )
            ((= (modulo (quotient p d) 10) 5) (begin
                                                ((draw-pixmap ventana) "5.png" (make-posn x y) "blue")
                                                (puntaje p (/ d 10) (+ x 18) y (+ cont 1) ventana)
                                                )
                                              )
            ((= (modulo (quotient p d) 10) 6) (begin
                                                ((draw-pixmap ventana) "6.png" (make-posn x y) "blue")
                                                (puntaje p (/ d 10) (+ x 18) y (+ cont 1) ventana)
                                                )
                                              )
            ((= (modulo (quotient p d) 10) 7) (begin
                                                ((draw-pixmap ventana) "7.png" (make-posn x y) "blue")
                                                (puntaje p (/ d 10) (+ x 18) y (+ cont 1) ventana)
                                                )
                                              )
            ((= (modulo (quotient p d) 10) 8) (begin
                                                ((draw-pixmap ventana) "8.png" (make-posn x y) "blue")
                                                (puntaje p (/ d 10) (+ x 18) y (+ cont 1) ventana)
                                                )
                                              )
            ((= (modulo (quotient p d) 10) 9) (begin
                                                ((draw-pixmap ventana) "9.png" (make-posn x y) "blue")
                                                (puntaje p (/ d 10) (+ x 18) y (+ cont 1) ventana)
                                                )
                                              )
            ((= (modulo (quotient p d) 10) 9) (begin
                                                ((draw-pixmap ventana) "9.png" (make-posn x y) "blue")
                                                (puntaje p (/ d 10) (+ x 18) y (+ cont 1) ventana)
                                                )
                                              )
            (else display "are you crack?")
            )
      (display " Uribe = paraco")
      )
  )

;;------------------------------------------
;;Limites del Laberinto
;;------------------------------------------
(define (comprobador a b);; a = valor en x // b = valor en y
  (if {or (and (> a 244) (> b 24) (< a 269) (< b 269)) (and (> a 214) (> b 30) (< a 239) (< b 207)) ;;Limites de los bordes del laberinto. Los limites se definen con cuadrilateros. Para definir un limite se requiere   
          (and (> a 152) (> b 183) (< a 245) (< b 208))  (and (> a 152) (> b 152) (< a 177) (< b 186)) ;;la esquina superior izquierda y la esquina inferior derecha. Si las coordenadas de la esquina superior izquierda fueran (x1,y1)
          (and (> a 30) (> b 30) (< a 215) (< b 55)) (and (> a 176) (> b 152) (< a 208) (< b 177));; y las de la esquina inferior derecha (x2,y2), el limite se definiria como [and (> a x1) (> b y1) (< a x1) (< b y2)]
          (and (> a 30) (> b 54) (< a 55) (< b 177)) (and (> a 54) (> b 122) (< a 86) (< b 147))
          (and (> a 122) (> b 153) (< a 153) (< b 178)) (and (> a 54) (> b 61) (< a 85) (< b 85))
          (and (> a 60) (> b 84) (< a 85) (< b 116)) (and (> a 84) (> b 91) (< a 147) (< b 116))
          (and (> a 91) (> b 60) (< a 117) (< b 92)) (and (> a 116) (> b 60) (< a 208) (< b 85))
          (and (> a 182) (> b 84) (< a 208) (< b 116)) (and (> a 152) (> b 91) (< a 183) (< b 116))
          (and (> a 152) (> b 115) (< a 177) (< b 147)) (and (> a 91) (> b 122) (< a 153) (< b 147))
          (and (> a 91) (> b 146) (< a 116) (< b 177)) (and (> a 60) (> b 152) (< a 92) (< b 177))
          (and (> a 60) (> b 176) (< a 86) (< b 238)) (and (> a 30) (> b 183) (< a 61) (< b 208))
          (and (> a 30) (> b 207) (< a 55) (< b 269)) (and (> a 54) (> b 244) (< a 177) (< b 269))
          (and (> a 91) (> b 213) (< a 117) (< b 245)) (and (> a 116) (> b 213) (< a 239) (< b 239))
          (and (> a 213) (> b 238) (< a 239) (< b 269)) (and (> a 183) (> b 244) (< a 214) (< b 269))
          (and (> a 183) (> b 122) (< a 208) (< b 153)) (and (> a 122) (> b 176) (< a 147) (< b 208))
          (and (> a 91) (> b 183) (< a 123) (< b 208)) (and (> a 183) (> b 268) (< a 208) (< b 269))}
      #t;;se puede mover el personaje
      #f
      )
  )
;;--------------------------------------------------
;;Aparición del profesor
;;--------------------------------------------------
(define (profesor x y v ventana)
  (if (= v 2)
      (if (and (comprobador x (- y 5)) (comprobador x (- y 12)) (comprobador x (- y 15)) (comprobador (+ x 6) (- y 10)) (comprobador (+ x 12) (- y 18)));;arriba
          (begin
            ((draw-pixmap ventana) "Profesor.png" (make-posn x (- y 17)) "blue")
            (play-sound "GameOver.mp3" #t)
            (close-viewport ventana)
            (pierde)
            )
          (if (and (comprobador x (+ y 5)) (comprobador x (+ y 19)) (comprobador x (+ y 26)) (comprobador (+ x 5) (+ y 35)) (comprobador (+ x 12) (+ y 36)));;abajo
              (begin
                ((draw-pixmap ventana) "Profesor.png" (make-posn x (+ y 19)) "blue")
                (play-sound "GameOver.mp3" #t)
                (close-viewport ventana)
                (pierde)
                )
              (if (and (comprobador (+ x 5) y) (comprobador (+ x 10) y) (comprobador (+ x 16) (+ y 8)) (comprobador (+ x 22) (+ y 12)) (comprobador (+ x 28) (+ y 17)));;derecha
                  (begin
                    ((draw-pixmap ventana) "Profesor.png" (make-posn (+ x 10) y) "blue")
                    (play-sound "GameOver.mp3" #t)
                    (close-viewport ventana)
                    (pierde)
                    )
                  (if (and (comprobador (- x 5) y) (comprobador (- x 12) y) (comprobador (- x 13) y) (comprobador (- x 13) (+ y 8)) (comprobador (- x 13) (+ y 12)) (comprobador (- x 13) (+ y 17)));;izquierda
                      (begin
                        ((draw-pixmap ventana) "Profesor.png" (make-posn (- x 12) y) "blue")
                        (play-sound "GameOver.mp3" #t)
                        (close-viewport ventana)
                        (pierde)
                        )
                      )
                  )
              )
          )
      )
  )
;;--------------------------------------------------
;;Salida nivel 1
;;--------------------------------------------------
(define (salida1 puntos)
  (define salida (open-viewport "Salida - Nivel 1" 600 503))
  ((draw-pixmap salida) "Salida1.png" (make-posn 0 0) "blue")
  (puntaje puntos 100 432 307 0 salida)
  (play-sound "Final.mp3" #t)
  (get-mouse-click salida)
  (define x (posn-x (query-mouse-posn salida)))
  (define y (posn-y (query-mouse-posn salida)))
  (if (and (>= x 0) (<= x 600) (>= y 0) (<= y 503))
      (begin
        (close-viewport salida)
        (menu)
        )
      )
  )
;;--------------------------------------------------
;;Salida nivel 2
;;--------------------------------------------------
(define (salida2 puntos)
  (define salida2 (open-viewport "Salida - Nivel 2" 600 503))
  ((draw-pixmap salida2) "Salida2.png" (make-posn 0 0) "blue")
  (puntaje puntos 100  432 307 0 salida2)
  (play-sound "Fin_juego.mp3" #t)
  (get-mouse-click salida2)
  (define x (posn-x (query-mouse-posn salida2)))
  (define y (posn-y (query-mouse-posn salida2)))
  (if (and (>= x 0) (<= x 600) (>= y 0) (<= y 503))
      (begin
        (close-viewport salida2)
        (menu)
        )
      )
  )
  
;;--------------------------------------------------
;;Elector de ventana emergente
;;--------------------------------------------------
(define (Salida puntos ventana)
  (if (= ventana 1)
      (salida1 puntos)
      (salida2 puntos)
      )
  )
;;--------------------------------------------------
;;Función principal, llamada: movimiento
;;--------------------------------------------------      
(define (movimiento x1 y1 ventana  ventana2 key puntos item1 item2 item3 item4 item5);; puntos = puntos sumados en el nivel items = items recogidos
  (define (elector)
    (if (= ventana2 0)
        ventana
        ventana2
        )
    )
;;--------------------------------------------------
;;Elector de salida
;;--------------------------------------------------  
  (define (elector_salida);; si la ventana del segundo nivel es igual a 0 quiere decir que se está ejecutando el nivel 1, y se retorna 1, de lo contrario 2
    (if (= ventana2 0)
        1
        2
        )
    )
;;--------------------------------------------------
;;Salida
;;--------------------------------------------------  
  (define (salida x y)
    (if (and (> x 182) (> y 268) (< x 208) (< y 272))
        (begin
          (close-viewport ventana)
          (Salida puntos (elector_salida));; por medio del elector de salida establece qué ventana mostrar
          )
        (profesor x1 y1 (elector_salida) ventana)
        )
    )

;;-------------------------------------------
;;Objetos: Parciales y Libros
;;-------------------------------------------
  (define (objetos a b ventana ventana2)
    (if (= (elector_salida) 1);; hace que los objetos en este if sean utilizados sólo en el nivel 1
        (if (and (> a 70) (> b 133) (< a 85) (< b 148));;determina el espacio que ocupa cada objeto
            (begin
              ((clear-solid-rectangle ventana)(make-posn 70 133) 15 14)
              (if (= item1 0)
                  (begin
                    (play-sound "item2.mp3" #t)
                    (puntaje (+ 35 puntos) 100 203 294 0 ventana)
                    (movimiento x1 y1 ventana ventana2 (key-value (get-key-press ventana)) (+ puntos 35) (+ item1 1) item2 item3 item4 item5)
                    )
                  )
              )
            (if (and (> a 187) (> b 125) (< a 201) (< b 139))
                (begin
                  ((clear-solid-rectangle ventana)(make-posn 187 125) 15 14)
                  (if (= item2 0)
                      (begin
                        (play-sound "item2.mp3" #t)
                        (puntaje (+ 35 puntos) 100 203 294 0 ventana)
                        (movimiento x1 y1 ventana  ventana2 (key-value (get-key-press ventana)) (+ puntos 35) item1 (+ item2 1) item3 item4 item5)
                        )
                      )
                  )
                )
            )
        (if (= (elector_salida) 2);; determina los objetos que se utilizan en el nivel 2
            (if (and (> a 70) (> b 133) (< a 85) (< b 148))
                (begin
                  ((clear-solid-rectangle ventana)(make-posn 70 133) 15 14)
                  (if (= item1 0)
                      (begin
                        (play-sound "item2.mp3" #t)
                        (puntaje (+ 45 puntos) 100 203 294 0 ventana)
                        (movimiento x1 y1 ventana ventana2 (key-value (get-key-press ventana)) (+ puntos 45) (+ item1 1) item2 item3 item4 item5)
                        )
                      )
                  )
                (if (and (> a 160) (> b 253) (< a 175) (< b 268)) ;; Si el objeto principal cae dentro del límite se guarda el objeto de obtención y se suma su respectivo valor al puntaje principal
                    (begin
                      ((clear-solid-rectangle ventana)(make-posn 160 253) 15 14)
                      (if (= item2 0)
                          (begin
                            (play-sound "item2.mp3" #t)
                            (puntaje (+ 45 puntos) 100 203 294 0 ventana);;""
                            (movimiento x1 y1 ventana  ventana2 (key-value (get-key-press ventana)) (+ puntos 45) item1 (+ item2 1) item3 item4 item5)
                            )
                          )
                      )
                    (if (and (> a 131) (> b 192) (< a 146) (< b 207));;""
                        (begin
                          ((clear-solid-rectangle ventana)(make-posn 131 192) 15 14)
                          (if (= item3 0)
                              (begin
                                (play-sound "item2.mp3" #t)
                                (puntaje (+ 45 puntos) 100 203 294 0 ventana)
                                (movimiento x1 y1 ventana  ventana2 (key-value (get-key-press ventana)) (+ puntos 45) item1 item2 (+ item3 1) item4 item5)
                                )
                              )
                          )
                        (if (and (> a 69) (> b 223) (< a 74) (< b 238));""
                            (begin
                              ((clear-solid-rectangle ventana)(make-posn 69 223) 15 14)
                              (if (= item4 0)
                                  (begin
                                    (play-sound "item2.mp3" #t)
                                    (puntaje (+ 45 puntos) 100 203 294 0 ventana)
                                    (movimiento x1 y1 ventana ventana2 (key-value (get-key-press ventana)) (+ puntos 45) item1 item2 item3 (+ item1 4) item5)
                                    )
                                  )
                              )
                            (if (and (> a 186) (> b 251) (< a 201) (< b 269));""
                            (begin
                              ((clear-solid-rectangle ventana)(make-posn 186 251) 15 17)
                              (if (= item5 0)
                                  (begin
                                    (play-sound "Diploma.mp3" #t)
                                    (puntaje (+ 250 puntos) 100 203 294 0 ventana)
                                    (movimiento x1 y1 ventana ventana2 (key-value (get-key-press ventana)) (+ puntos 250) item1 item2 item3 item4 (+ item5 1))
                                    )
                                  )
                              )
                            )
                        )
                    )
                )
            )
        )
    )
  )

;;--------------------------------------------------
;;Movimiento del Estudiante
;;--------------------------------------------------
  (if (equal? key 'down);;Abajo
      (begin
        (if (and (comprobador x1 (+ y1 18)) (comprobador (+ x1 5) (+ y1 18)) (comprobador (+ x1 8) (+ y1 18)));;Comprueba que el movimiento a realizar quede dentro del espacio definido
            (begin
              (objetos x1 (+ y1 18) ventana ventana2)
              (objetos (+ x1 5) (+ y1 18) ventana ventana2)
              (objetos (+ x1 8) (+ y1 18) ventana ventana2)
              ((clear-solid-rectangle ventana)(make-posn x1 y1) 9 18);;En caso de ser verdadero elimina el espacio que ocupa
              ((draw-pixmap ventana) "Estudiante.png" (make-posn x1 (+ y1 1)) "blue");; y se re-dibuja en la dirección ingresada por teclado
              (movimiento x1 (+ y1 1) ventana ventana2 (key-value (get-key-press ventana)) puntos item1 item2 item3 item4 item5);; espera el siguiente movimiento
              )
            (begin
              (salida (+ x1 8) (+ y1 18))
              (movimiento x1 y1 ventana ventana2 (key-value (get-key-press ventana)) puntos item1 item2 item3 item4 item5);; en caso de que el movimiento no quede dentro del espacio definido se espera un nuevo movimiento
              )
            )
        )
      (if (equal? key 'up);;Arriba
          (begin
            (if (and (comprobador x1 (- y1 1)) (comprobador (+ x1 5) (- y1 1)) (comprobador (+ x1 8) (- y1 1)))
                (begin
                  (objetos x1 (- y1 1) ventana ventana2)
                  (objetos (+ x1 5) (- y1 1) ventana ventana2)
                  (objetos (+ x1 8) (- y1 1) ventana ventana2)
                  ((clear-solid-rectangle ventana)(make-posn x1 y1) 9 18)
                  ((draw-pixmap ventana) "Estudiante.png" (make-posn x1 (- y1 1)) "blue")
                  (movimiento x1 (- y1 1) ventana ventana2 (key-value (get-key-press ventana)) puntos item1 item2 item3 item4 item5)
                  )
                (begin
                  (salida x1 (- y1 1))
                  (movimiento x1 y1 ventana ventana2 (key-value (get-key-press ventana)) puntos item1 item2 item3 item4 item5)
                  )
                )
            )
          (if (equal? key 'right);;Derecha
              (if (and (comprobador (+ x1 9) y1) (comprobador (+ x1 9) (+ y1 5)) (comprobador (+ x1 9) (+ y1 10)) (comprobador (+ x1 9) (+ y1 11)) (comprobador (+ x1 9) (+ y1 17)))
                  (begin
                    (objetos (+ x1 9) y1 ventana ventana2)
                    (objetos (+ x1 9) (+ y1 5) ventana ventana2)
                    (objetos (+ x1 9) (+ y1 10) ventana ventana2)
                    (objetos (+ x1 9) (+ y1 11) ventana ventana2)
                    (objetos (+ x1 9) (+ y1 17) ventana ventana2)
                    ((clear-solid-rectangle ventana)(make-posn x1 y1) 9 18)
                    ((draw-pixmap ventana) "Estudiante.png" (make-posn (+ x1 1) y1) "blue")
                    (movimiento (+ x1 1) y1 ventana ventana2 (key-value (get-key-press ventana)) puntos item1 item2 item3 item4 item5)
                    )
                  (begin
                    (salida (+ x1 9) (+ y1 17))
                    (movimiento x1 y1 ventana ventana2 (key-value (get-key-press ventana)) puntos item1 item2 item3 item4 item5)
                    )
                  )
              (if (equal? key 'left);;Izquierda
                  (begin
                    (if (and (comprobador (- x1 1) y1) (comprobador (- x1 1) (+ y1 5)) (comprobador (- x1 1) (+ y1 11)) (comprobador (- x1 1) (+ y1 10)) (comprobador (- x1 1) (+ y1 17)))
                        (begin
                          (objetos (- x1 1) y1 ventana ventana2)
                          (objetos (- x1 1) (+ y1 5) ventana ventana2)
                          (objetos (- x1 1) (+ y1 11) ventana ventana2)
                          (objetos (- x1 1) (+ y1 10) ventana ventana2)
                          (objetos (- x1 1) (+ y1 17) ventana ventana2)
                          ((clear-solid-rectangle ventana)(make-posn x1 y1) 9 18)
                          ((draw-pixmap ventana) "Estudiante.png" (make-posn (- x1 1) y1) "blue")
                          (movimiento (- x1 1) y1 ventana  ventana2 (key-value (get-key-press ventana)) puntos item1 item2 item3 item4 item5)
                          )
                        (begin
                          (salida (- x1 1) y1)
                          (movimiento x1 y1 ventana ventana2 (key-value (get-key-press ventana)) puntos item1 item2 item3 item4 item5)
                          )
                        )
                    )
                  (movimiento x1 y1 ventana ventana2 (key-value (get-key-press ventana)) puntos item1 item2 item3 item4 item5)
                      
                  )
              )
          )
      )
  )

;;--------------------------------------------------
;;Introducción primer nivel
;;--------------------------------------------------
(define (intronivel1)
  (define inivel1 (open-viewport "Intro NV1" 600 503));;Creación de la ventana
  ((draw-pixmap inivel1) "Nivel1.png" (make-posn 0 0) "blue");;Se dibuja la imagen de introducción del nivel1
  (get-mouse-click inivel1);;Se espera una instrucción por mouse
  (define x (posn-x (query-mouse-posn inivel1)))
  (define y (posn-y (query-mouse-posn inivel1)))
  (if (and (>= x 0) (<= x 600) (>= y 0) (<= y 503));;Si se da click sobre la ventana se llama a la función nivel1
      (begin
        (close-viewport inivel1)
        (nivel1)
        )
      )
  )
;;--------------------------------------------------
;;Primer nivel
;;--------------------------------------------------
(define (nivel1)
  (define win1 (open-viewport "Nivel 1" 300 346));;Creación de la ventana
  ((draw-pixmap win1) "Laberinto.png" (make-posn 0 0) "blue");;Dibujo del laberinto
  ((draw-pixmap win1) "Taller.png" (make-posn 70 133) "blue");;Dibujo del item Taller
  ((draw-pixmap win1) "Taller.png" (make-posn 187 125) "blue")
  ((draw-pixmap win1) "Estudiante.png" (make-posn 249 32) "blue");;Dibujo del Avatar
  ((draw-pixmap win1) "0.png" (make-posn 203 294) "blue")
  ((draw-pixmap win1) "0.png" (make-posn 221 294) "blue")
  ((draw-pixmap win1) "0.png" (make-posn 239 294) "blue")
  (movimiento  249 32 win1 0 (key-value (get-key-press win1)) 0 0 0 0 0 0);;Llamado a la función movimiento {movimiento x y ventana (lector de teclado)}
  )
;;--------------------------------------------------
;;Game Over
;;--------------------------------------------------
(define (pierde)
  (define gameover (open-viewport "Game Over" 600 503));; Creación de la ventana
  ((draw-pixmap gameover) "GameOver.png" (make-posn 0 0) "blue");; se dibuja la imagen para cuando el jugador pierde
  (get-mouse-click gameover);;se espera una instrucción por mouse 
  (define x (posn-x (query-mouse-posn gameover)))
  (define y (posn-y (query-mouse-posn gameover)))
  (if (and (>= x 0) (<= x 600) (>= y 0) (<= y 503)) ;;Si se clickea sobre la ventana vuelve a abrir el menú
      (begin
        (close-viewport gameover)
        (menu)
        )
      )
  )
;;--------------------------------------------------
;;Introducción nivel 2
;;-------------------------------------------------- 
(define (intronivel2)
  (define inivel2 (open-viewport "Intro NV2" 600 503));;Se abre una nueva ventana
  ((draw-pixmap inivel2) "Nivel2.png" (make-posn 0 0) "blue");;Se dibuja la imagen de introducción del nivel2
  (get-mouse-click inivel2)
  (define x (posn-x (query-mouse-posn inivel2)))
  (define y (posn-y (query-mouse-posn inivel2)))
  (if (and (>= x 0) (<= x 600) (>= y 0) (<= y 503));Si se clickea sobre la imagen se llama a la función nivel2 (empieza el nivel)
      (begin
        (close-viewport inivel2)
        (nivel2)
        )
      )
  )
;;--------------------------------------------------
;;Segundo nivel
;;--------------------------------------------------
(define (nivel2)
  (define win1 (open-viewport "Nivel 2" 300 346));;Creación de la ventana
  ((draw-pixmap win1) "Laberinto.png" (make-posn 0 0) "blue");;Dibujo del laberinto
  ((draw-pixmap win1) "Parcial.png" (make-posn 160 253) "blue");;Dibujo del item Parcial
  ((draw-pixmap win1) "Parcial.png" (make-posn 131 192) "blue")
  ((draw-pixmap win1) "Parcial.png" (make-posn 70 132) "blue")
  ((draw-pixmap win1) "Parcial.png" (make-posn 69 223) "blue");;Dibujo del Diploma
  ((draw-pixmap win1) "Diploma.png" (make-posn 186 251) "blue")
  ((draw-pixmap win1) "Estudiante.png" (make-posn 249 32) "blue");;Dibujo del Avatar
  ((draw-pixmap win1) "0.png" (make-posn 203 294) "blue");;Dibujo del puntaje inicial
  ((draw-pixmap win1) "0.png" (make-posn 221 294) "blue")
  ((draw-pixmap win1) "0.png" (make-posn 239 294) "blue")
  (movimiento 249 32 win1 1 (key-value (get-key-press win1)) 0 0 0 0 0 0)
)

;;--------------------------------------------------
;;Instrucciones
;;--------------------------------------------------
(define (instrucciones)
  (define instruc (open-viewport "Instrucciones" 600 503));;Creación de la ventana
  ((draw-pixmap instruc) "Instrucciones.png" (make-posn 0 0) "blue");; Se dibuja la imagen de las instrucciones
  (get-mouse-click instruc);; Se espera una instruccion por mouse
  (define x (posn-x (query-mouse-posn instruc)))
  (define y (posn-y (query-mouse-posn instruc)))
  (if (and (>= x 490) (<= x 590) (>= y 460) (<= y 495));; Si se clickea dentro de las coordenadas establecidas se regresa al menú
      (begin
        (close-viewport instruc)
        (menu)
        )
      (begin
        (close-viewport instruc);;De lo contrario se vuelve a llamar a instrucciones (Se realiza para que el código no deje de funcionar)
        (instrucciones)
        )
      )
  )
;;--------------------------------------------------
;;Créditos
;;--------------------------------------------------
(define (creditos)
  (define cred (open-viewport "Créditos" 600 503))
  ((draw-pixmap cred) "Créditos.png" (make-posn 0 0) "blue")
  (get-mouse-click cred) ;; Se espera una instruccion por mouse
  (define x (posn-x (query-mouse-posn cred)))
  (define y (posn-y (query-mouse-posn cred)))
  (if (and (>= x 490) (<= x 590) (>= y 20) (<= y 55)) ;; Si se clickea dentro de las coordenadas establecidas se regresa al menú
      (begin
        (close-viewport cred)
        (menu)
        )
      )
  (if (and (>= x 0) (<= x 955) (>= y 0) (<= y 900));;De lo contrario se vuelve a llamar a créditos (Se realiza para que el código no deje de funcionar)
      (begin
        (close-viewport cred)
        (creditos)
        )
      )
  )

;;--------------------------------------------------
;;Menú
;;--------------------------------------------------  
(define (menu)
  (define winmenu (open-viewport "Menú principal" 600 503))
  ((draw-pixmap winmenu) "Menú.png" (make-posn 0 0) "blue")
  (get-mouse-click winmenu)
  (define x (posn-x (query-mouse-posn winmenu)))
  (define y (posn-y (query-mouse-posn winmenu)))
  (if (and (>= x 70) (<= x 270) (>= y 220) (<= y 290)) ;;Condiciones para el botón del nivel 1
      (begin
        (close-viewport winmenu)
        (intronivel1)
        )
      )
  (if (and (>= x 330) (<= x 530) (>= y 220) (<= y 290)) ;;Condiciones paara el botón del nivel 2
      (begin
        (close-viewport winmenu)
        (intronivel2)
        )
      )
  (if (and (>= x 210) (<= x 410) (>= y 350) (<= y 390)) ;;Condiciones para el botón de las instrucciones
      (begin
        (close-viewport winmenu)
        (instrucciones)
        )
      )
  (if (and (>= x 245) (<= x 375) (>= y 420) (<= y 460)) ;Condiciones para el botón de los créditos
      (begin
        (close-viewport winmenu)
        (creditos)
        )
      )
  (if (and (>= x 0) (<= x 955) (>= y 0) (<= y 900));;Condiciones para el botón del menú
      (begin
        (close-viewport winmenu)
        (menu)
        )
      )
  )

(intro) 

