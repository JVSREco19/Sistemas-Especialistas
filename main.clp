(defrule objetivo-pergunta
	(initial-fact)
	=>
	(printout t crlf "Que tipo de trabalho você gostaria de ter no futuro? Escolha entre as opções" crlf)
	(printout t crlf "1 - Fazer novas descobertas para humanidade, estudar fenômenos que ainda não compreendemos")
	(printout t crlf "2 - Estudar a humanidade, sua cultura ou sua história")
	(printout t crlf "3 - Expressar seus sentimentos e utilizar sua criatividade para criar obras primas")
	(printout t crlf "4 - Estudar os seres vivos e seus biomas")
	(printout t crlf "5 - Ajudar as pessoas, estudar patologias")
	(printout t crlf "6 - Ensinar, promover o conhecimento e ajudar as pessoas a entender melhor o mundo")
	(printout t crlf "7 - Criar e utilizar da tecnologia pra melhorar a vida do ser humano")
	(printout t crlf "8 - Ainda não tem uma ambição em mente" crlf)
	(assert(objetivo(read))))


(defrule interesse-pergunta
	(objetivo ?)
	=>
	(printout t crlf "Quais são as suas atividades extracurriculares favoritas? Escolha entre as opções")
	(printout t crlf "1 - Tecnologia e Informática")
	(printout t crlf "2 - Negócios e Finanças")
	(printout t crlf "3 - Artes e Design")
	(printout t crlf "4 - Ciências Exatas e Naturais")
	(printout t crlf "5 - Saúde e Medicina")
	(printout t crlf "6 - Ciências Humanas" crlf)
	(assert(interesse(read))))

(defrule habilidade-pergunta
	(interesse ?)
	=>
	(printout t crlf "Em que matérias você tem facilidade na escola? Escolha entre as opções")
	(printout t crlf "1 - Matemátca")
	(printout t crlf "2 - Português")
	(printout t crlf "3 - Ciências")
	(printout t crlf "4 - História")
	(printout t crlf "5 - Geografia")
	(printout t crlf "6 - Inglês")
	(printout t crlf "7 - Artes")
	(printout t crlf "8 - Educação física" crlf)
	(assert(habilidade(read))))

(defrule experiencia-pergunta
	(habilidade ?)
	=>
	(printout t crlf "Escolha uma opção com a qual você já trabalhou ou quer trabalhar.")
	(printout t crlf "1 - Vendas e atendimento ao cliente")
	(printout t crlf "2 - Administração e gestão")
	(printout t crlf "3 - Tecnologia e informática")
	(printout t crlf "4 - Saúde")
	(printout t crlf "5 - Educação")
	(printout t crlf "6 - Serviços gerais" crlf)
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
	(assert (area-academica "Ciência da Computação")))

(defrule educacao
	(and(objetivo 6)
	(experiencia 5))
    =>
	(assert (area-academica "Educação")))

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
	(assert (area-academica "Economia ou Administração")))

(defrule tecnico
	and(objetivo 8)
	
    =>
	(assert (area-academica "Técnico")))

(defrule print-job
	(area-academica ?a)
	=>
	(printout t crlf "Ao analisar seu perfil a melhor area seria " ?a  crlf))
