% Sistema Especialista - Identificar especie de tartarugas marinhas 
%  --através de algumas perguntas é possivel encontrar a espécie de uma tartaruga
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
tartaruga(t6,'Tartaruga Cabeçuda|Caretta caretta').
tartaruga(t7,'Tartaruga de Kemp|Lepidochelys kempii').
tartaruga(t8,'Tartaruga desconhecida...').

opcao(q1,'Q1:Corpo constituído por uma carapaça única, grande, alongada e flexível com sete quilhas distintas que se localizam ao longo do comprimento da tartaruga, de cor cinzenta escura ou preta com pontos brancos e barbatanas sem unhas.').
opcao(q2,'Q2:Corpo constituído por uma carapaça óssea, dura, sem quilhas mas com placas grandes e barbatanas com uma ou duas unhas.').
opcao(q3,'Q3:Carapaça com 4 pares placas laterais.').
opcao(q4,'Q4:Carapaça com 5 ou mais pares de placas laterais.').
opcao(q5,'Q5:Cabeça estreita, dois pares de escamas pré-frontais e bico como o de um falcão. Carapaça de cor castanho-amarelado com quatro placas laterais imbricando-se como telhas. Barbatanas anteriores e posteriores com duas unhas.').
opcao(q6,'Q6:Cabeça pequena com um único par de escamas pré-orbitais. Carapaça redonda ou oval e as placas não se sobrepõem. Barbatanas com uma unha visível.').
opcao(q7,'Q7:Mandíbula serrilhada. Carapaça de forma oval. A cor da carapaça varia de verde-claro a muito escuro e de baço a muito brilhante, ou de tons de amarelo, castanho e verde com listras radiantes. O plastrão varia entre o branco e o amarelado, nas populações do Atlântico a tons mais escuros nas populações do Pacífico.').
opcao(q8,'Q8:Carapaça redonda e achatada com placas não sobrepostas e cobertas por uma fina camada de cera; de cor verde-acinzentada e as margens de cor amarelada.').
opcao(q9,'Q9:Carapaça com 5 pares de placas laterais.').
opcao(q10,'Q10:Carapaça com seis ou mais placas laterais, de cor verde-acinzentado escuro. Barbatanas com uma ou duas unhas visíveis, e podem ter uma unha extra nas barbatanas anteriores.').
opcao(q11,'Q11:Cabeça grande e mandíbulas fortes. Carapaça oval de cor castanho e o plastrão de cor amarelada. Barbatanas dianteiras curtas e grossas com 2 unhas, e barbatanas traseiras com 2 ou 3 unhas.').
opcao(q12,'Q12:Carapaça redonda, de cor verde-acinzentado escuro. Barbatanas anteriores com uma unha e as posteriores com 1 ou 2 unhas.').




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
t8:-write('Não consegui achar. Isto é mesmo uma tartaruga??!!...'),fail,!.


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


identificar :- write('--*--Olá, vou te auxiliar a identificar uma tartaruga...responda as perguntas...--*--')
		,nl,nl, busca(Animal),
       write('Eu acho que a tartaruga é: '),tartaruga(Animal,X),
       write(X), nl, undo.







































