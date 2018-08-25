Keep variable names based on a function dates

see github
https://tinyurl.com/y7pwxdff
https://github.com/rogerjdeangelis/utl_keep_variable_names_based_on_a_function_dates

see Stackoverflow SAS
https://tinyurl.com/ydbv9awy
https://stackoverflow.com/questions/51988041/keep-variables-with-a-doop-loop-sas


HAVE
====

  %let dtx='01Jan2015'd '01Mar2015'd '01may2015'd;

  WORK.HAVE total obs=1

   ID    F_201501   F_201502   F_201503    F_201504    F_201505

    1        0           1           2           3           6

  RULE
  ----
    Keep only variables
      F_201501
      F_201503
      F_201505

    Which correspond to
     '01Jan2015'd
     '01Mar2015'd
     '01may2015'd


  EXAMPLE OUTPUT
  --------------

  WORK.WANT total obs=1

   ID    F_201501    F_201503    F_201505

    1        0           2           6


PROCESS
=======

  %array(dtes,values='01Jan2015'd '01Mar2015'd '01may2015'd)
  data want;
     set have(keep=id
       %do_over(dtes,phrase=%nrstr(f_%sysfunc(putn(?,yymmn6.))))
     );
  run;quit;


OUTPUT
======

  WORK.WANT total obs=1

   ID    F_201501    F_201503    F_201505

    1        0           2           6

*                _               _       _
 _ __ ___   __ _| | _____     __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \   / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/  | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|   \__,_|\__,_|\__\__,_|

;

data have;
  input id f_201501 f_201502 f_201503 f_201504 f_201505;
cards4;
1 0 1 2 3 6
;;;;
run;quit;

