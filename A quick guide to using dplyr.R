# ---- Using dplyr; An example ----

download.file("https://doi.org/10.1371/journal.pone.0149098.s002", "df.csv")


df <- read.csv("df.csv", stringsAsFactors = FALSE)

unique(df$Prey.species)

install.packages("dplyr")

library(dplyr)
df1 <- df %>% 
  filter(`Prey.species` != "Unknown",
         nchar(`Prey.species`) > 0) %>%
  mutate(Prey.species = tolower(Prey.species)) %>%
  group_by(Lion.ID, Prey.species) %>%
  summarise(nb_killed = sum(State..kill..1..or.non.kill..0..)) %>%
  arrange(desc(nb_killed))
  
df2 <- df %>%
  select(Lion = Lion.ID, 
         Prey = Prey.species, 
         is_killed = State..kill..1..or.non.kill..0..) %>%
  filter(Prey != "Unknown" & nchar(Prey) > 0) %>%
  mutate(Prey = tolower(Prey)) %>%
  group_by(Lion, Prey) %>%
  summarise(nb_killed = sum(is_killed)) %>%
  arrange(desc(nb_killed))