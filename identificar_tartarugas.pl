% Sistema Especialista - Identificar especie de tartarugas marinhas 
%  --atrav�s de algumas perguntas � possivel encontrar a esp�cie de uma tartaruga
% Author: Wdnei Ribeiro da Paixao
% Para iniciar, digite "identificar".


entende(s,sim).
entende(y,sim).
entende(sim,sim).
entende(yes,sim).
entende(1,sim).




tartaruga(t1,'Tartaruga de Couro |Dermochelys coriacea').
tartaruga(t2,'Tartaruga de Pente|Eretmochelys imbricata').
tartaruga(t3,'Tartaruga Verde|Chelonia mydas').
tartaruga(t4,'Tartaruga Australiana|Natator depressus').
tartaruga(t5,'Tartaruga Oliva|Lepidochelys olivacea').
tartaruga(t6,'Tartaruga Cabe�uda|Caretta caretta').
tartaruga(t7,'Tartaruga de Kemp|Lepidochelys kempii').
tartaruga(t8,'Tartaruga desconhecida...').

opcao(q1,'Q1:Corpo constitu�do por uma carapa�a �nica, grande, alongada e flex�vel com sete quilhas distintas que se localizam ao longo do comprimento da tartaruga, de cor cinzenta escura ou preta com pontos brancos e barbatanas sem unhas.').
opcao(q2,'Q2:Corpo constitu�do por uma carapa�a �ssea, dura, sem quilhas mas com placas grandes e barbatanas com uma ou duas unhas.').
opcao(q3,'Q3:Carapa�a com 4 pares placas laterais.').
opcao(q4,'Q4:Carapa�a com 5 ou mais pares de placas laterais.').
opcao(q5,'Q5:Cabe�a estreita, dois pares de escamas pr�-frontais e bico como o de um falc�o. Carapa�a de cor castanho-amarelado com quatro placas laterais imbricando-se como telhas. Barbatanas anteriores e posteriores com duas unhas.').
opcao(q6,'Q6:Cabe�a pequena com um �nico par de escamas pr�-orbitais. Carapa�a redonda ou oval e as placas n�o se sobrep�em. Barbatanas com uma unha vis�vel.').
opcao(q7,'Q7:Mand�bula serrilhada. Carapa�a de forma oval. A cor da carapa�a varia de verde-claro a muito escuro e de ba�o a muito brilhante, ou de tons de amarelo, castanho e verde com listras radiantes. O plastr�o varia entre o branco e o amarelado, nas popula��es do Atl�ntico a tons mais escuros nas popula��es do Pac�fico.').
opcao(q8,'Q8:Carapa�a redonda e achatada com placas n�o sobrepostas e cobertas por uma fina camada de cera; de cor verde-acinzentada e as margens de cor amarelada.').
opcao(q9,'Q9:Carapa�a com 5 pares de placas laterais.').
opcao(q10,'Q10:Carapa�a com seis ou mais placas laterais, de cor verde-acinzentado escuro. Barbatanas com uma ou duas unhas vis�veis, e podem ter uma unha extra nas barbatanas anteriores.').
opcao(q11,'Q11:Cabe�a grande e mand�bulas fortes. Carapa�a oval de cor castanho e o plastr�o de cor amarelada. Barbatanas dianteiras curtas e grossas com 2 unhas, e barbatanas traseiras com 2 ou 3 unhas.').
opcao(q12,'Q12:Carapa�a redonda, de cor verde-acinzentado escuro. Barbatanas anteriores com uma unha e as posteriores com 1 ou 2 unhas.').




 /* busca a ser testada*/
busca(t1) :- t1, !.
busca(t2) :- t2, !.
busca(t3) :- t3, !.
busca(t4) :- t4, !.
busca(t5) :- t5, !.
busca(t6) :- t6, !.
busca(t7) :- t7, !.
busca(unknown):-t8,!. /* sem resposta */


t1:-verificar(q1).
t2:-verificar(q2),verificar(q3),verificar(q5).
t3:-verificar(q2),verificar(q3),verificar(q6),verificar(q7).
t4:-verificar(q2),verificar(q3),verificar(q6),verificar(q8).
t5:-verificar(q2),verificar(q4),verificar(q9),verificar(q11).
t6:-verificar(q2),verificar(q4),verificar(q9),verificar(q12).
t7:-verificar(q2),verificar(q4),verificar(q5).
t8:-write('N�o consegui achar. Isto � mesmo uma tartaruga??!!...'),fail,!.


perguntar(Pergunta) :-opcao(Pergunta,Q),
        write(Q), write('? '),nl,
         read(Resposta),nl,
         ( entende(Resposta,sim)
         -> assert(yes(Pergunta)) ;
         assert(no(Pergunta)), fail).
:- dynamic yes/1,no/1.
/* Como verificar algo */
verificar(S) :- (yes(S) -> true ; (no(S) -> fail ; perguntar(S))).
/* undo all yes/no assertions */
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.


identificar :- write('--*--Ol�, vou te auxiliar a identificar uma tartaruga...responda as perguntas...--*--')
		,nl,nl, busca(Animal),
       write('Eu acho que a tartaruga �: '),tartaruga(Animal,X),
       write(X), nl, undo.







































