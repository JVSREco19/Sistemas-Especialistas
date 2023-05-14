(defrule objetivo-pergunta
	(initial-fact)
	=>
	(printout t crlf "Que tipo de trabalho voc� gostaria de ter no futuro? Escolha entre as op��es" crlf)
	(printout t crlf "1 - Fazer novas descobertas para humanidade, estudar fen�menos que ainda n�o compreendemos")
	(printout t crlf "2 - Estudar a humanidade, sua cultura ou sua hist�ria")
	(printout t crlf "3 - Expressar seus sentimentos e utilizar sua criatividade para criar obras primas")
	(printout t crlf "4 - Estudar os seres vivos e seus biomas")
	(printout t crlf "5 - Ajudar as pessoas, estudar patologias")
	(printout t crlf "6 - Ensinar, promover o conhecimento e ajudar as pessoas a entender melhor o mundo")
	(printout t crlf "7 - Criar e utilizar da tecnologia pra melhorar a vida do ser humano")
	(printout t crlf "8 - Ainda n�o tem uma ambi��o em mente" crlf)
	(assert(objetivo(read))))


(defrule interesse-pergunta
	(objetivo ?)
	=>
	(printout t crlf "Quais s�o as suas atividades extracurriculares favoritas? Escolha entre as op��es")
	(printout t crlf "1 - Tecnologia e Inform�tica")
	(printout t crlf "2 - Neg�cios e Finan�as")
	(printout t crlf "3 - Artes e Design")
	(printout t crlf "4 - Ci�ncias Exatas e Naturais")
	(printout t crlf "5 - Sa�de e Medicina")
	(printout t crlf "6 - Ci�ncias Humanas" crlf)
	(assert(interesse(read))))

(defrule habilidade-pergunta
	(interesse ?)
	=>
	(printout t crlf "Em que mat�rias voc� tem facilidade na escola? Escolha entre as op��es")
	(printout t crlf "1 - Matem�tca")
	(printout t crlf "2 - Portugu�s")
	(printout t crlf "3 - Ci�ncias")
	(printout t crlf "4 - Hist�ria")
	(printout t crlf "5 - Geografia")
	(printout t crlf "6 - Ingl�s")
	(printout t crlf "7 - Artes")
	(printout t crlf "8 - Educa��o f�sica" crlf)
	(assert(habilidade(read))))

(defrule experiencia-pergunta
	(habilidade ?)
	=>
	(printout t crlf "Escolha uma op��o com a qual voc� j� trabalhou ou quer trabalhar.")
	(printout t crlf "1 - Vendas e atendimento ao cliente")
	(printout t crlf "2 - Administra��o e gest�o")
	(printout t crlf "3 - Tecnologia e inform�tica")
	(printout t crlf "4 - Sa�de")
	(printout t crlf "5 - Educa��o")
	(printout t crlf "6 - Servi�os gerais" crlf)
	(assert(experiencia(read))))

(defrule saude
	(and(objetivo 5)
	(interesse 5)
	(habilidade 3)
	(experiencia 4))
    =>
	(assert (area-academica "Ciencias da Saude")))

(defrule computer
	(and(objetivo 7)
	(interesse 1)
	(habilidade 1)
	(experiencia 3))
    =>
	(assert (area-academica "Ci�ncia da Computa��o")))

(defrule educacao
	(and(objetivo 6)
	(experiencia 5))
    =>
	(assert (area-academica "Educa��o")))

(defrule historia
	(and(objetivo 2)
	(interesse 6)
	(or(habilidade 5)(habilidade 4)))
    =>
	(assert (area-academica "Jornalismo ou historia")))

(defrule natureza
	(and(objetivo 4)
	(interesse 4)
	(or(habilidade 3)(habilidade 5)))
	
    =>
	(assert (area-academica "Ciencias da Natureza")))

(defrule artes
	(and(objetivo 3)
	(interesse 3)
	(habilidade 7))
    =>
	(assert (area-academica "Artes e design")))

(defrule exatas
	(and(objetivo 1)
	(interesse 4)
	(habilidade 1))
    =>
	(assert (area-academica "Ciencias Exatas")))

(defrule fisica
	(and(objetivo 1)
	(interesse 4)
	(habilidade 3))
    =>
	(assert (area-academica "Ciencias da Natureza")))

(defrule economia
	(and(interesse 2)
	(or(habilidade 1)(habilidade 2)(habilidade 6))
	(or(experiencia 1)(experiencia 2)))
    =>
	(assert (area-academica "Economia ou Administra��o")))

(defrule tecnico
	and(objetivo 8)
	
    =>
	(assert (area-academica "T�cnico")))

(defrule print-job
	(area-academica ?a)
	=>
	(printout t crlf "Ao analisar seu perfil a melhor area seria " ?a  crlf))
