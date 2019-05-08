# https://omnianalytics.io/2018/08/30/animating-the-data-transformation-process-with-gganimate/
# make omni's gif look more DNA-y per sara's comment
# The idea of adding the animation is very nice.
# I suggest adding in the columns SampleName; Locus;
# Allele 1; Allele 2;.....Height 1; Height 2............
# Data point 1, Data point 2...... (format of GeneMapper files)
# and then how these get into the long format in STR validator.
library(strvalidator)
data(set1)

head(set1)
library(tidyr)
library(dplyr)
library(purrr)

set1_long <- slim(set1, fix = c("Sample.Name", "Marker", "Dye"),
                               stack = c("Allele", "Height"), keep.na = FALSE)

head(set1_long)

longDat <- function(x) {
  names(x) %>%
    rbind(x) %>%
    setNames(seq_len(ncol(x))) %>%
    mutate(row = row_number()) %>%
    tidyr::gather(column, value, -row) %>%
    mutate(column = as.integer(column)) %>%
    ungroup() %>%
    arrange(column, row)
}

# longDat(set1)
long_tables <- map(list(set1_long, set1), longDat)

long_table <- long_tables[[1]] %>%
  mutate(tstep = "b")
wide_table <- long_tables[[2]] %>%
  mutate(tstep = "a")
both_tables <- bind_rows(long_table, wide_table)

both_tables$celltype <- NA
both_tables$celltype[both_tables$column == 1] <- c("Header", rep("Sample.Name", 575), "Header", rep("Sample.Name", 170))
both_tables$celltype[both_tables$column ==2] <-  c("Header", rep("Marker", 575), "Header", rep("Marker", 170))
both_tables$celltype[both_tables$column == 3] <-  c("Header", rep("Dye", 575), "Header", rep("Dye", 170))
both_tables$celltype[both_tables$column == 4] <- c("Header", rep(paste0("Allele.", 1:5), each = 115), "Allele.1", rep("allele-value", 170))
both_tables$celltype[both_tables$column == 5] <- c("Header", rep(paste0("Height.", 1:5), each = 115), "Allele.2", rep("allele-value", 170))
both_tables$celltype[both_tables$column == 6] <- c("Allele.3",rep("allele-value", 170))
both_tables$celltype[both_tables$column == 7] <- c("Allele.4",rep("allele-value", 170))
both_tables$celltype[both_tables$column == 8] <- c("Allele.5",rep("allele-value", 170))
both_tables$celltype[both_tables$column == 9] <- c("Height.1",rep("height-value", 170))
both_tables$celltype[both_tables$column == 10] <- c("Height.2",rep("height-value", 170))
both_tables$celltype[both_tables$column == 11] <- c("Height.3",rep("height-value", 170))
both_tables$celltype[both_tables$column == 12] <- c("Height.4",rep("height-value", 170))
both_tables$celltype[both_tables$column == 13] <- c("Height.5",rep("height-value", 170))

order_celltype <- unique(both_tables$celltype)[c(1:4, 5, 10, 6, 11, 7, 12, 8, 13, 9, 14, 15, 16  )]

both_tables$celltype <- factor(both_tables$celltype, levels = order_celltype, ordered = T)
levels(both_tables$celltype)
custom_cols <- c("black", "#cccccc", "#969696",  "#636363",
                 "#c7e9c0", "#c6dbef","#a1d99b", "#9ecae1", "#74c476", "#6baed6",
                 "#31a354","#3182bd", "#006d2c", "#08519c", "#edf8e9", "#eff3ff")



# plot
library(ggplot2)

# use less data for clearer rectangles

nrow(both_tables %>% filter(tstep=="b"))

wide_table <- filter(both_tables, tstep == "a")
long_table <- filter(both_tables, tstep == "b")

long_table_h <- filter(long_table, celltype == "Header")
long_table_dat <- long_table %>%
  filter(celltype != "Header") %>%
  group_by(column, celltype) %>% sample_frac(1/5) %>% mutate(row = row_number()+1) %>%
  mutate(row = ifelse(celltype %in% order_celltype[7:14], row + 23, row),
         row = ifelse(celltype %in% order_celltype[9:14], row + 23, row),
         row = ifelse(celltype %in% order_celltype[11:14], row + 23, row),
         row = ifelse(celltype %in% order_celltype[13:14], row + 23, row))

long_table <- bind_rows(long_table_h, long_table_dat)

wide_table_h <- filter(wide_table, celltype %in% order_celltype[c(1, 5:14)] )
wide_table_dat <- wide_table %>%
  filter(!(celltype %in% order_celltype[c(1,5:14)])) %>%
  group_by(column, celltype) %>% sample_frac(1/5) %>% mutate(row = row_number()+1)
wide_table <- bind_rows(wide_table_h, wide_table_dat)

both_tables_shorter <- bind_rows(long_table, wide_table)

base_plot <- ggplot(both_tables_shorter, aes(column, -row, fill = celltype)) +
  geom_tile(color = "black") +
  theme_void() +
  scale_fill_manual(name = "",values = custom_cols)
base_plot +
  facet_wrap(~tstep)
library(gganimate)
base_plot +
  transition_states(
    states            = tstep,
    transition_length = 1,
    state_length      = 1
  ) +
  enter_fade() +
  exit_fade() +
  ease_aes('sine-in-out')





