# Visualização de grupos - t-SNE e escalonamento multidimensional

Neste estudo foram avaliados formas de visualização de grupos, principalmente visando uma futura utilização de técnicas de aprendizado não superviosionado. 

Duas técnicas para visualização ganham destaque: t-SNE (t-Distributed Stochastic Neighbor Embedding) e MDS (multidimensional scaling), apesar de outras serem utilizadas.

Os scripts para essas técnicas de maior interesse devem seguir a seguinte ordem:

1) mapa_real.R - Script em que crio um mapa das cidades estudadas. Ele é criado conforme são na realidade, e servem de gabarito para como as técnicas desempenharam (levando sempre em consideração a finalidade as técnicas).
2) mapa_tsne - Script em que aplico a técnica t-SNE. Nele, crio dois plots: Um em como o t-SNE separou os grupos lado a lado com o "gabarito" e outro desses dois gráficos sobrepostos.
3) mapa_mds - Script em que aplico a técnica MDS. Nele, crio dois plots: Um em como o MDS separou os grupos lado a lado com o "gabarito" e outro desses dois gráficos sobrepostos.

Com isso, conseguimos visualizar o objetivo de cada uma das técnicas


OBS: Essa ordem é recomendada porque os pacotes utilizados em cada técnica pode ter sido carregado apenas nos scripts anteriores. 

