set.seed(1)

mds <- cmdscale(eurodist)
mds

mds_df <- data.frame(X = mds[,1], Y = mds[,2], 
                      City = rownames(mds))




combined_df_mds <- merge(mds_df, city_coords, by = "City")

combined_df_mds$Y <- combined_df_mds$Y*(-1)

load_image <- function(filepath) {
  img <- readPNG(filepath)
  rasterGrob(img, width = unit(1, "npc"), height = unit(1, "npc"))
}

# Path para a imagem que você deseja sobrepor
image_path <- "mapareal.png"

# Carregar a imagem
image_grob <- load_image(image_path)

# Criar o gráfico t-SNE
mds_plot <- ggplot(combined_df_mds, aes(x = X, y = Y, label = City)) +
  geom_point(color = "blue", size = 3) +
  geom_text(vjust = -0.5, hjust = 0.5, size = 3) +
  labs(title = "Visualização MDS das Cidades", 
       x = "Dimensão 1", y = "Dimensão 2") +
  theme_minimal()

# Adicionar a imagem como uma camada no gráfico t-SNE
mds_plot_with_image <- mds_plot +
  annotation_custom(image_grob, xmin = -Inf, xmax = Inf,
                    ymin = -Inf, ymax = Inf)

# Adicionar os pontos t-SNE novamente por cima da imagem
final_plot <- mds_plot_with_image +
  geom_point(data = combined_df_mds, aes(x = X, y = Y), 
             color = "blue", size = 3)



library(patchwork)
mds_plot + image_grob # graficos lado a lado


# Plotar o gráfico final
print(final_plot) # graficos sobrepostos




# Utilizando NMDS

set.seed(1)

mds <- MASS::isoMDS(eurodist, tol = 10^-6)
mds

mds_df <- data.frame(X = mds$points[,1], Y = mds$points[,2], 
                     City = rownames(mds$points))




combined_df_mds <- merge(mds_df, city_coords, by = "City")

combined_df_mds$Y <- combined_df_mds$Y*(-1)

load_image <- function(filepath) {
  img <- readPNG(filepath)
  rasterGrob(img, width = unit(1, "npc"), height = unit(1, "npc"))
}

# Path para a imagem que você deseja sobrepor
image_path <- "mapareal.png"

# Carregar a imagem
image_grob <- load_image(image_path)

# Criar o gráfico t-SNE
mds_plot <- ggplot(combined_df_mds, aes(x = X, y = Y, label = City)) +
  geom_point(color = "blue", size = 3) +
  geom_text(vjust = -0.5, hjust = 0.5, size = 3) +
  labs(title = "Visualização MDS das Cidades", 
       x = "Dimensão 1", y = "Dimensão 2") +
  theme_minimal()

# Adicionar a imagem como uma camada no gráfico t-SNE
mds_plot_with_image <- mds_plot +
  annotation_custom(image_grob, xmin = -Inf, xmax = Inf,
                    ymin = -Inf, ymax = Inf)

# Adicionar os pontos t-SNE novamente por cima da imagem
final_plot <- mds_plot_with_image +
  geom_point(data = combined_df_mds, aes(x = X, y = Y), 
             color = "blue", size = 3)



library(patchwork)
mds_plot + image_grob # graficos lado a lado


# Plotar o gráfico final
print(final_plot) # graficos sobrepostos
