
### Introduction

Prolog est un langage utilisé dans les domaines de l'Intelligence Artificielle et la Programmation Logique avec Contraintes. Sa syntaxe et son principe de fonctionnement sont radicalement différents de langages impératifs tels que C ou Java. Le raisonnement se rapproche plus de langages fonctionnels tels que Caml ou Lisp. Pourtant, Prolog n'est pas un langage fonctionnel. Prolog est le premier langage de programmation logique.

## Bases et notions

    % Commentaire en fin de ligne
    /* 
        Commentaire sur
        plusieurs lignes
    */

##### VARIABLES
    
Une variable commence toujours par majuscule (X, Michael, ..)

Une variable libre (__free variable__): variable non affectée à une valeur.

Variable liée (__bound variable__): variable affectée à une valeur.

On utilise la principe d' unification <<>> pour affecter une valeur à une variable

##### CONSTANTES ET ATOMES

Une constante commence toujours par une lettre minuscule (jean, belfort..), une chaine de caractère est entourée par des guillemets simples.
constante et chaines constituent des atomes.

##### PREDICATS

On parle de prédicat et non de fonction. Un prédicat s'organise en clauses.
Un prédicat ne retourne pas de valeur: soit elle s'exécute, soit elle échoue. On affecte les valeurs des variables passées en paramètres par « unification ». Par convention, les variables en entrée sont placées à gauche et les variables en sortie sont placées à droite, mais l'unification peut se faire dans les deux sens. 

##### PREDICATS EXAMPLES

    habite(fahmi, rabat). % Fahmi habite à Rabat

    /* Exécution 
        habite(fahmi, Ville).
        habite(Personne, rabat).
            Personne = Fahmi
    */

/* Mecanisme de "*__backtracking__*" our "*__retour sur trace__*" : l'unification peut se faire dans les 2 sens. Après exécution d'une clause (réussie ou non), Prolog revient dans l'état précédent l'exécution de la clause et évalue la clause suivante, si elle existe */

    habite(fahmi, fes).
    habite(laurent, meknes).
    habite(irchad, sale).
    habite(adeline, meknes).
    habite(nicolas, meknes).

Une clause est généralement composée de plusieurs buts separés par virgules qui constituent ce que l'on appelle corps de la clause.

    memeVille(X, Y) :-
    habite(X, VilleX), % si l'un des buts échoue, les buts suivant ne sont pas évalués
    
    habite(Y, VilleY),
    X \= Y,
    VilleX == VilleY.

  Si l'exécution se fait jusqu'au bout, la clause réussit et le prédicat renvoie une solution (par unification).

   Un prédicat est identifié à la fois par son nom et par le nombre de ses arguments. Ainsi, le prédicat __predicat/2__ (2 arguments) est fondamentalement différent du prédicat __predicat/3__ (3 arguments).
  Le nombre d'arguments d'un prédicat s'appelle *__ARITE__*
  
##### ANATOMIE D'UN PREDICAT PROLOG

  Diagramme:

  ![alt predicat](https://pcaboche.developpez.com/article/prolog/presentation/images/anatomie-predicat.jpeg)

  Voici un récapitulatif des définitions importantes :

Un prédicat est caractérisé par son nom et son arité, représenté par la notation __prédicat/arité__ ;
l'arité est le nombre de paramètres que compte un prédicat ;
un prédicat est généralement composé d'une tête et d'un corps ;
la tête est l'ensemble des paramètres du prédicat ;
le corps est composé de buts ;
les buts sont le plus souvent séparés par des virgules (opérateur de conjonction entre les buts).

##### UNIFICATION

 A l'aide de l'opérateur __=__

    cohabite(fahmi, Lieu) :- Lieu = rabat.

Au niveau des noms des variables, ce qui peut poser probleme avec les variables libres

    memeCite(X, Y) :- 
        habite(X, VilleX),
        habite(Y, VilleX),
        X \= Y.

##### ARITHMETIQUE

__=__ sert exclusivement à l'unification, utiliser is pour les opérateurs arithmétiques.
Les variables à droite du is doivent avoir été unifiées. 

    N1 is N - 1.

#### LISTES

En Prolog, on ne connait que deux choses d'une liste :

- son premier élément (la tête, ou head) ;
- le reste de la liste (la queue, ou tail).
  
Le parcours d'une liste se fait de manière récursive sur la queue.
La liste vide se note: __[]__.

Une liste constituée d'au moins un élément se note __[T|Q]__. Ici, __T__ représente la tête et __Q__ représente la queue. C'est aussi grâce à __[T|Q]__ que l'on ajoute un élément en début de liste (par unification).


##### TUPLES

Un tuple est un ensemble de champs, réunis dans une seule variable. On construit un tuple de cette manière 

    Jean = (jean, 25, belfort, celibataire).

##### Le caractère _
 
Evite l'introduction des variables qui ne seront pas unifiées.

Pour utiliser des variables qui ne seront pas unifiées, il est recommandé de les précéder par **_ (_Liste, _Ville, ..)**

Lorsque, dans le corps d'une clause, on n'a pas besoin de faire référence à l'un des paramètres, on remplace celui-ci par le caractère **_** .

De même, si dans une liste ou un tuple on n'a pas besoin de faire référence à l'un des éléments, on remplace celui-ci par le caractère _ . 


##### Le coupe choix, ou Cut !

Mécanisme fondamentale de la programmation prolog qui permet lors de l'évaluation d'une clause, d'indiquer que l'on ne souhaite pas évaluer les autres clauses pour ne garder que la clause courante.


##### Fonctionement d'un programme Prolog

 
Pas de structure itératives telles que for, while, do ... while.
Toutes les fonctionnalités sont donc programmés d'une manière recursive.

Ainsi, pour parcourir une liste, on examine le premier élément de la liste, puis on effectue le traitement approprié sur cet élément avant d'appeler récursivement le prédicat sur le reste de la liste. C'est de cette façon que l'on construit la liste résultat.


##### Exécution d'un prédicat Prolog
 
Voici comment Prolog exécute un prédicat :

Prolog examine la première clause et évalue les buts qu'elle contient:

Prolog évalue le premier but. Ce but est susceptible de retourner :

- Une solution ;
- Plusieurs solutions ;
- Aucune solution.

Lorsqu'un but est susceptible de retourner plusieurs solutions, on dit qu'il y a un point de choix. Le plus souvent en Prolog, on a plusieurs points de choix qui constituent ce qu'on appelle un __arbre décisionnel__.

Lorsqu'un but retourne au moins une solution, Prolog garde la première solution avant d'évaluer les buts suivants. Lorsqu'un but échoue (pas de solution), Prolog effectue un « retour arrière » (ou __backtracking__) sur le but précédent (et évalue la solution suivante, si elle existe). S'il n'y a pas de but précédent, la clause échoue.

Il arrive que Prolog rencontre l'instruction !, connue sous le nom de « **cut** » ou « **coupe-choix** ». Ce symbole signifie qu'aucun retour arrière ne sera effectué sur les buts précédant le coupe-choix. Si les buts précédents retournaient plusieurs solutions, seule la solution courante sera conservée.

Lorsque Prolog réussit à examiner tous les buts contenus dans le corps d'une clause, alors le prédicat retourne une solution.

Lorsque Prolog a fini d'évaluer une clause (qu'elle réussisse ou qu'elle échoue), Prolog examine la clause suivante, à la recherche d'autres solutions.

Ainsi :

1. On considère qu'il existe un __OU inclusif__ entre les clauses d'un prédicat Prolog (__disjonction__).

2. On considère qu'il existe un **ET** entre les buts d'une clause. Ce « **ET** » est symbolisé par l'opérateur de conjonction **','** qui sépare les différents buts.
