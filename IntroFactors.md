Introduction to Factors in R
================
Your Name Here

  - [1. Importing the Data](#importing-the-data)
  - [2. Find a variable of interest](#find-a-variable-of-interest)
  - [3. Inspect the variable](#inspect-the-variable)
  - [4. Practice using the **forcats**
    commands](#practice-using-the-forcats-commands)

### 1\. Importing the Data

The following chunk should read the Kaggle study data from the `data`
directory in your workspace. You will see some parsing issues which you
may or may not wish to explore.

``` r
ks_data <- read_csv(file = "http://people.kzoo.edu/enordmoe/math295/multipleChoiceResponses.csv")
```

    ## Warning: 43 parsing failures.
    ##  row                               col           expected           actual                                                                  file
    ## 1209 CompensationAmount                a number           -                'http://people.kzoo.edu/enordmoe/math295/multipleChoiceResponses.csv'
    ## 1316 WorkToolsFrequencyKNIMECommercial 1/0/T/F/TRUE/FALSE Rarely           'http://people.kzoo.edu/enordmoe/math295/multipleChoiceResponses.csv'
    ## 1594 WorkToolsFrequencyKNIMECommercial 1/0/T/F/TRUE/FALSE Often            'http://people.kzoo.edu/enordmoe/math295/multipleChoiceResponses.csv'
    ## 2443 WorkToolsFrequencyKNIMECommercial 1/0/T/F/TRUE/FALSE Most of the time 'http://people.kzoo.edu/enordmoe/math295/multipleChoiceResponses.csv'
    ## 2466 WorkToolsFrequencyKNIMECommercial 1/0/T/F/TRUE/FALSE Most of the time 'http://people.kzoo.edu/enordmoe/math295/multipleChoiceResponses.csv'
    ## .... ................................. .................. ................ .....................................................................
    ## See problems(...) for more details.

``` r
ks_data
```

    ## # A tibble: 16,716 x 228
    ##    GenderSelect Country   Age EmploymentStatus StudentStatus LearningDataSci…
    ##    <chr>        <chr>   <dbl> <chr>            <chr>         <chr>           
    ##  1 Non-binary,… <NA>       NA Employed full-t… <NA>          <NA>            
    ##  2 Female       United…    30 Not employed, b… <NA>          <NA>            
    ##  3 Male         Canada     28 Not employed, b… <NA>          <NA>            
    ##  4 Male         United…    56 Independent con… <NA>          <NA>            
    ##  5 Male         Taiwan     38 Employed full-t… <NA>          <NA>            
    ##  6 Male         Brazil     46 Employed full-t… <NA>          <NA>            
    ##  7 Male         United…    35 Employed full-t… <NA>          <NA>            
    ##  8 Female       India      22 Employed full-t… <NA>          <NA>            
    ##  9 Female       Austra…    43 Employed full-t… <NA>          <NA>            
    ## 10 Male         Russia     33 Employed full-t… <NA>          <NA>            
    ## # … with 16,706 more rows, and 222 more variables: CodeWriter <chr>,
    ## #   CareerSwitcher <chr>, CurrentJobTitleSelect <chr>, TitleFit <chr>,
    ## #   CurrentEmployerType <chr>, MLToolNextYearSelect <chr>,
    ## #   MLMethodNextYearSelect <chr>, LanguageRecommendationSelect <chr>,
    ## #   PublicDatasetsSelect <chr>, LearningPlatformSelect <chr>,
    ## #   LearningPlatformUsefulnessArxiv <chr>,
    ## #   LearningPlatformUsefulnessBlogs <chr>,
    ## #   LearningPlatformUsefulnessCollege <chr>,
    ## #   LearningPlatformUsefulnessCompany <chr>,
    ## #   LearningPlatformUsefulnessConferences <chr>,
    ## #   LearningPlatformUsefulnessFriends <chr>,
    ## #   LearningPlatformUsefulnessKaggle <chr>,
    ## #   LearningPlatformUsefulnessNewsletters <chr>,
    ## #   LearningPlatformUsefulnessCommunities <chr>,
    ## #   LearningPlatformUsefulnessDocumentation <chr>,
    ## #   LearningPlatformUsefulnessCourses <chr>,
    ## #   LearningPlatformUsefulnessProjects <chr>,
    ## #   LearningPlatformUsefulnessPodcasts <chr>,
    ## #   LearningPlatformUsefulnessSO <chr>,
    ## #   LearningPlatformUsefulnessTextbook <chr>,
    ## #   LearningPlatformUsefulnessTradeBook <chr>,
    ## #   LearningPlatformUsefulnessTutoring <chr>,
    ## #   LearningPlatformUsefulnessYouTube <chr>,
    ## #   BlogsPodcastsNewslettersSelect <chr>, LearningDataScienceTime <chr>,
    ## #   JobSkillImportanceBigData <chr>, JobSkillImportanceDegree <chr>,
    ## #   JobSkillImportanceStats <chr>, JobSkillImportanceEnterpriseTools <chr>,
    ## #   JobSkillImportancePython <chr>, JobSkillImportanceR <chr>,
    ## #   JobSkillImportanceSQL <chr>, JobSkillImportanceKaggleRanking <chr>,
    ## #   JobSkillImportanceMOOC <chr>, JobSkillImportanceVisualizations <chr>,
    ## #   JobSkillImportanceOtherSelect1 <chr>, JobSkillImportanceOtherSelect2 <chr>,
    ## #   JobSkillImportanceOtherSelect3 <chr>, CoursePlatformSelect <chr>,
    ## #   HardwarePersonalProjectsSelect <chr>, TimeSpentStudying <chr>,
    ## #   ProveKnowledgeSelect <chr>, DataScienceIdentitySelect <chr>,
    ## #   FormalEducation <chr>, MajorSelect <chr>, Tenure <chr>,
    ## #   PastJobTitlesSelect <chr>, FirstTrainingSelect <chr>,
    ## #   LearningCategorySelftTaught <dbl>, LearningCategoryOnlineCourses <dbl>,
    ## #   LearningCategoryWork <dbl>, LearningCategoryUniversity <dbl>,
    ## #   LearningCategoryKaggle <dbl>, LearningCategoryOther <dbl>,
    ## #   MLSkillsSelect <chr>, MLTechniquesSelect <chr>, ParentsEducation <chr>,
    ## #   EmployerIndustry <chr>, EmployerSize <chr>, EmployerSizeChange <chr>,
    ## #   EmployerMLTime <chr>, EmployerSearchMethod <chr>,
    ## #   UniversityImportance <chr>, JobFunctionSelect <chr>,
    ## #   WorkHardwareSelect <chr>, WorkDataTypeSelect <chr>,
    ## #   WorkProductionFrequency <chr>, WorkDatasetSize <chr>,
    ## #   WorkAlgorithmsSelect <chr>, WorkToolsSelect <chr>,
    ## #   WorkToolsFrequencyAmazonML <chr>, WorkToolsFrequencyAWS <chr>,
    ## #   WorkToolsFrequencyAngoss <chr>, WorkToolsFrequencyC <chr>,
    ## #   WorkToolsFrequencyCloudera <chr>, WorkToolsFrequencyDataRobot <chr>,
    ## #   WorkToolsFrequencyFlume <chr>, WorkToolsFrequencyGCP <chr>,
    ## #   WorkToolsFrequencyHadoop <chr>, WorkToolsFrequencyIBMCognos <chr>,
    ## #   WorkToolsFrequencyIBMSPSSModeler <chr>,
    ## #   WorkToolsFrequencyIBMSPSSStatistics <chr>,
    ## #   WorkToolsFrequencyIBMWatson <chr>, WorkToolsFrequencyImpala <chr>,
    ## #   WorkToolsFrequencyJava <chr>, WorkToolsFrequencyJulia <chr>,
    ## #   WorkToolsFrequencyJupyter <chr>, WorkToolsFrequencyKNIMECommercial <lgl>,
    ## #   WorkToolsFrequencyKNIMEFree <chr>, WorkToolsFrequencyMathematica <chr>,
    ## #   WorkToolsFrequencyMATLAB <chr>, WorkToolsFrequencyAzure <chr>,
    ## #   WorkToolsFrequencyExcel <chr>, WorkToolsFrequencyMicrosoftRServer <chr>,
    ## #   WorkToolsFrequencyMicrosoftSQL <chr>, …

### 2\. Find a variable of interest

Use the [codebook](http://people.kzoo.edu/enordmoe/math295/schema.csv)
(in csv format) or browse the variable names to identify a categorical
variable you want to explore. Use the `factor()` command as illustrated
in the notes to convert the character variable into a factor. If you’re
not sure what to look at, you could look at something about R use.
Variables ending with “Select” were chosen from a given set of
categories and may be easier to work with (but also might not give as
much practice dealing with unruly factors\!).

### 3\. Inspect the variable

Inspect the variable you have selected. What are the factor levels? How
many in each category?

Make a bar chart if the number of levels is not unreasonable. Study the
order of the factor levels to determine whether reordering is necessary.

### 4\. Practice using the **forcats** commands

Use the **forcats** commands to reorder and graph your categorical
variable. Show me an example of what you’ve been able to accomplish\!
