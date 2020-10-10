# Clustering. Algoritmul K-Means

**[Enunt]** (https://github.com/cristysandu/Clustering-Algoritmul-K-Means/blob/master/Tema1%20-%20Enunt.pdf)

## Task-ul 1

La acest task am folosit functia load si apoi o conversie din tipul struct in tipul matrice pentru a citi coordonatele punctelor din fisier si functia fscanf pentru a citi nr de centroizi asta dupa ce am deschis fisierul.

## Task-ul 2

La acest task am salvat in variabila dimenspct dimensiunea punctelor si in nrpuncte numarul acestora apoi am am initializat primul set de centroizi random , am atribuit unei variabile pos_diff=1 cand aceasta va deveni 0 asta inseamna ca sa terminat algoritmul de sortare .Cat timp pos_diff este mai mare ca 0 atribui pe rand fiecarui punct cel mai apropiat centroid si salvez intr-un vector fiecare punct carui centoid apartine .Apoi recalculez pozitile centroizilor setandui la o pozitie random si recalculez valoare lui pos_diff care daca da 0 atunci centroizi nu s-au mai mutat de la ultim schimbare

## Task-ul 3

La acest task dupa ce am aflat centroizi vad carui cluster apartin pe rand fiecare punct ,in acest caz am considerat nr maxim 3 clustere. Pe fiecare caz am apelat functia scatter3 de points din pozitia curenta si o culare diferita pentru fiecare caz, initial nu am folosit hold on dupa apelarea scatter3 si la final imi afisa doar un punct hold on ma ajutat sa pot afisa toate punctele.

## Task-ul 4

La acest task dupa ce am determinat la fiecare pas care este cel mai apropiat centroid pentru fiecare punct am adunt la cost norma de ordinul 2 din diferenta dintre punct si centroid.

## Task-ul 5

La acest task am recitit valorile din fisierul cu puncte ,apoi am facut o iteratie de la 1 la 10 apeland pe rand clustering_pc de points si i facnd centroizi pentru fiecare i si salvand costul total apeland functia compute_cost_pc de points si centroids intr-un vector v apeland la finalul iteratiei functia plot de v.
