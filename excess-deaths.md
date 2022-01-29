---
title: "Excess mortality"
output: 
    html_document: 
      toc: yes
      toc_float: yes
      code_folding: hide
      keep_md: yes
      highlight: pygments
      theme: flatly
      number_sections: yes
bibliography: references.bib
  
---



-   url - <https://app.powerbi.com/view?r=eyJrIjoiYmUwNmFhMjYtNGZhYS00NDk2LWFlMTAtOTg0OGNhNmFiNGM0IiwidCI6ImVlNGUxNDk5LTRhMzUtNGIyZS1hZDQ3LTVmM2NmOWRlODY2NiIsImMiOjh9>


# Heading 1 {.tabset}


## Heading 2 


```r
library(readODS)
library(here)
library(tidyverse)

path <- here("data")

df_sheets <- ods_sheets(paste0(path, "/EMData.ods"))


df_region <- read_ods(paste0(path, "/EMData.ods"), sheet = "region")
```


```r
df_region %>%
  janitor::clean_names() %>%
  mutate(covid_per = round(100 * deaths_with_covid_19_on_the_death_certificate / registered_deaths, 2)) %>%
  group_by(region = population_subgroup) %>%
  summarise(mean = mean(covid_per), 
            median = median(covid_per), 
            sd = sd(covid_per), 
            q = quantile(covid_per, probs = c(0.1, 0.25, .75, .9), names = TRUE)) %>% 
  mutate(quant = c(0.1, 0.25, 0.75, 0.9)) %>%
  pivot_wider(names_from =  "quant", values_from = "q") %>%
  mutate_if(is.numeric, round, 1) %>%
  flextable::flextable(
    col_keys = c("population_subgroup", "mean", "median", "0.1", "0.9")
    ) %>%
  add_footer_lines("Source: Weekly excess mortality") %>%
  add_footer_lines("Source: https://app.powerbi.com/view?r=eyJrIjoiYmUwNmFhMjYtNGZhYS00NDk2LWFlMTAtOTg0OGNhNmFiNGM0IiwidCI6ImVlNGUxNDk5LTRhMzUtNGIyZS1hZDQ3LTVmM2NmOWRlODY2NiIsImMiOjh9")
```

```{=html}
<template id="e03facbf-0ace-4fcd-a1f0-f847f3b41bec"><style>
.tabwid table{
  border-spacing:0px !important;
  border-collapse:collapse;
  line-height:1;
  margin-left:auto;
  margin-right:auto;
  border-width: 0;
  display: table;
  margin-top: 1.275em;
  margin-bottom: 1.275em;
  border-color: transparent;
}
.tabwid_left table{
  margin-left:0;
}
.tabwid_right table{
  margin-right:0;
}
.tabwid td {
    padding: 0;
}
.tabwid a {
  text-decoration: none;
}
.tabwid thead {
    background-color: transparent;
}
.tabwid tfoot {
    background-color: transparent;
}
.tabwid table tr {
background-color: transparent;
}
</style><div class="tabwid"><style>.cl-04dabe96{}.cl-04d80264{font-family:'Helvetica';font-size:11pt;font-weight:normal;font-style:normal;text-decoration:none;color:rgba(0, 0, 0, 1.00);background-color:transparent;}.cl-04d80bba{margin:0;text-align:left;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-04d80bc4{margin:0;text-align:right;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);padding-bottom:5pt;padding-top:5pt;padding-left:5pt;padding-right:5pt;line-height: 1;background-color:transparent;}.cl-04d82ac8{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-04d82ad2{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(0, 0, 0, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-04d82ad3{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-04d82adc{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 0 solid rgba(0, 0, 0, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-04d82add{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 0 solid rgba(255, 255, 255, 0.00);border-top: 0 solid rgba(255, 255, 255, 0.00);border-left: 0 solid rgba(255, 255, 255, 0.00);border-right: 0 solid rgba(255, 255, 255, 0.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-04d82ae6{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}.cl-04d82ae7{width:54pt;background-color:transparent;vertical-align: middle;border-bottom: 2pt solid rgba(102, 102, 102, 1.00);border-top: 2pt solid rgba(102, 102, 102, 1.00);border-left: 0 solid rgba(0, 0, 0, 1.00);border-right: 0 solid rgba(0, 0, 0, 1.00);margin-bottom:0;margin-top:0;margin-left:0;margin-right:0;}</style><table class='cl-04dabe96'>
```

```{=html}
<thead><tr style="overflow-wrap:break-word;"><td class="cl-04d82ae7"><p class="cl-04d80bba"><span class="cl-04d80264"></span></p></td><td class="cl-04d82ae6"><p class="cl-04d80bc4"><span class="cl-04d80264">mean</span></p></td><td class="cl-04d82ae6"><p class="cl-04d80bc4"><span class="cl-04d80264">median</span></p></td><td class="cl-04d82ae6"><p class="cl-04d80bc4"><span class="cl-04d80264">0.1</span></p></td><td class="cl-04d82ae6"><p class="cl-04d80bc4"><span class="cl-04d80264">0.9</span></p></td></tr></thead><tbody><tr style="overflow-wrap:break-word;"><td class="cl-04d82ad2"><p class="cl-04d80bba"><span class="cl-04d80264"></span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">12.6</span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">7.9</span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">1.6</span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">31.1</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-04d82ad2"><p class="cl-04d80bba"><span class="cl-04d80264"></span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">11.4</span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">6.0</span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">1.0</span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">32.5</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-04d82ad2"><p class="cl-04d80bba"><span class="cl-04d80264"></span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">12.3</span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">7.0</span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">1.6</span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">33.3</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-04d82ad2"><p class="cl-04d80bba"><span class="cl-04d80264"></span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">14.3</span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">8.2</span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">2.2</span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">45.7</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-04d82ad2"><p class="cl-04d80bba"><span class="cl-04d80264"></span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">12.5</span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">8.1</span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">1.0</span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">31.3</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-04d82ad2"><p class="cl-04d80bba"><span class="cl-04d80264"></span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">13.8</span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">8.2</span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">2.6</span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">33.7</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-04d82ad2"><p class="cl-04d80bba"><span class="cl-04d80264"></span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">11.1</span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">5.3</span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">1.5</span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">32.6</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-04d82ad2"><p class="cl-04d80bba"><span class="cl-04d80264"></span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">7.6</span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">4.5</span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">0.5</span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">20.4</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-04d82ad2"><p class="cl-04d80bba"><span class="cl-04d80264"></span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">12.8</span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">7.2</span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">1.5</span></p></td><td class="cl-04d82ac8"><p class="cl-04d80bc4"><span class="cl-04d80264">34.1</span></p></td></tr><tr style="overflow-wrap:break-word;"><td class="cl-04d82adc"><p class="cl-04d80bba"><span class="cl-04d80264"></span></p></td><td class="cl-04d82ad3"><p class="cl-04d80bc4"><span class="cl-04d80264">12.7</span></p></td><td class="cl-04d82ad3"><p class="cl-04d80bc4"><span class="cl-04d80264">8.3</span></p></td><td class="cl-04d82ad3"><p class="cl-04d80bc4"><span class="cl-04d80264">1.6</span></p></td><td class="cl-04d82ad3"><p class="cl-04d80bc4"><span class="cl-04d80264">31.2</span></p></td></tr></tbody><tfoot><tr style="overflow-wrap:break-word;"><td  colspan="5"class="cl-04d82add"><p class="cl-04d80bba"><span class="cl-04d80264">Source: Weekly excess mortality</span></p></td></tr><tr style="overflow-wrap:break-word;"><td  colspan="5"class="cl-04d82add"><p class="cl-04d80bba"><span class="cl-04d80264">Source: https://app.powerbi.com/view?r=eyJrIjoiYmUwNmFhMjYtNGZhYS00NDk2LWFlMTAtOTg0OGNhNmFiNGM0IiwidCI6ImVlNGUxNDk5LTRhMzUtNGIyZS1hZDQ3LTVmM2NmOWRlODY2NiIsImMiOjh9</span></p></td></tr></tfoot></table></div></template>
<div class="flextable-shadow-host" id="18459542-350d-4d15-b3a3-cc7faaa1d425"></div>
<script>
var dest = document.getElementById("18459542-350d-4d15-b3a3-cc7faaa1d425");
var template = document.getElementById("e03facbf-0ace-4fcd-a1f0-f847f3b41bec");
var caption = template.content.querySelector("caption");
if(caption) {
  caption.style.cssText = "display:block;text-align:center;";
  var newcapt = document.createElement("p");
  newcapt.appendChild(caption)
  dest.parentNode.insertBefore(newcapt, dest.previousSibling);
}
var fantome = dest.attachShadow({mode: 'open'});
var templateContent = template.content;
fantome.appendChild(templateContent);
</script>

```

  

```r
bs_accordion(id = "WRITING") %>%
  bs_set_opts(panel_type = "primary", use_heading_link = TRUE) %>%
  bs_append(title = "Writing well for specialists", 
            content = "This is the content for Writing well for specialists") %>%
  bs_append(title = "Know your audience", 
            content = "Content for know your audience") %>%
  bs_set_opts(panel_type = "success") %>%
  bs_append(title = "How people read", 
            content = "Content for how people read")
```

```{=html}
<div id="WRITING" class="panel-group" role="tablist" aria-multiselectable="true">
<div class="panel panel-primary" id="WRITING-0">
<div id="WRITING-0-heading" class="panel-heading" role="tab" data-toggle="collapse" data-target="#WRITING-0-collapse" data-parent="#WRITING" aria-expanded="true" aria-controls="WRITING-0-collapse" style="cursor: pointer;">
<h4 class="panel-title">Writing well for specialists</h4>
</div>
<div aria-labelledby="WRITING-0-heading" class="panel-collapse collapse in" id="WRITING-0-collapse" role="tabpanel">
<div class="panel-body" style="">This is the content for Writing well for specialists</div>
</div>
</div>
<div class="panel panel-primary" id="WRITING-1">
<div id="WRITING-1-heading" class="panel-heading" role="tab" data-toggle="collapse" data-target="#WRITING-1-collapse" data-parent="#WRITING" aria-expanded="true" aria-controls="WRITING-1-collapse" style="cursor: pointer;">
<h4 class="panel-title">Know your audience</h4>
</div>
<div id="WRITING-1-collapse" class="panel-collapse collapse" role="tabpanel" aria-labelledby="WRITING-1-heading">
<div class="panel-body" style="">Content for know your audience</div>
</div>
</div>
<div class="panel panel-success" id="WRITING-2">
<div id="WRITING-2-heading" class="panel-heading" role="tab" data-toggle="collapse" data-target="#WRITING-2-collapse" data-parent="#WRITING" aria-expanded="true" aria-controls="WRITING-2-collapse" style="cursor: pointer;">
<h4 class="panel-title">How people read</h4>
</div>
<div id="WRITING-2-collapse" class="panel-collapse collapse" role="tabpanel" aria-labelledby="WRITING-2-heading">
<div class="panel-body" style="">Content for how people read</div>
</div>
</div>
</div>
```


