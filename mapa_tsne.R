# para instalar o pacote M3C

# if (!requireNamespace("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")
# 
# BiocManager::install("M3C")


library(M3C)
library(grid)

set.seed(13)
tsne_result <- tsne(dist_matrix, perplex = 5)
tsne_result


tsne_coords <- tsne_result$data
tsne_df <- data.frame(X = tsne_coords[,1], Y = tsne_coords[,2], 
                      City = colnames(base))




combined_df <- merge(tsne_df, city_coords, by = "City")

combined_df$X <- combined_df$X*(-1)
combined_df$Y <- combined_df$Y*(-1)

load_image <- function(filepath) {
  img <- readPNG(filepath)
  rasterGrob(img, width = unit(1, "npc"), height = unit(1, "npc"))
}

# Path para a imagem que você deseja sobrepor
image_path <- "mapareal.png"

# Carregar a imagem
image_grob <- load_image(image_path)

# Criar o gráfico t-SNE
tsne_plot <- ggplot(combined_df, aes(x = X, y = Y, label = City)) +
  geom_point(color = "blue", size = 3) +
  geom_text(vjust = -0.5, hjust = 0.5, size = 3) +
  labs(title = "Visualização t-SNE das Cidades", 
       x = "Dimensão 1", y = "Dimensão 2") +
  theme_minimal()

# Adicionar a imagem como uma camada no gráfico t-SNE
tsne_plot_with_image <- tsne_plot +
  annotation_custom(image_grob, xmin = -Inf, xmax = Inf,
                    ymin = -Inf, ymax = Inf)

# Adicionar os pontos t-SNE novamente por cima da imagem
final_plot <- tsne_plot_with_image +
  geom_point(data = combined_df, aes(x = X, y = Y), 
             color = "blue", size = 3)



library(patchwork)
tsne_plot + image_grob # graficos lado a lado


# Plotar o gráfico final
print(final_plot) # graficos sobrepostos
