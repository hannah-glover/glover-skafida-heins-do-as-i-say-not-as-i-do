stop

/***
********************************************************************************
*                                                                              *
*     Where to next? Parental influence on the aspirations of young Scots      *
*                                                                              *
********************************************************************************
***/

**************************
* Organising my session. *
**************************

clear all
macro drop _all
set more off

** Set main directory path.

* This should make it easier for others to replicate this do-file: simply
* replace the pathname with where you would like to save folders and files in
* this session.

* Note that on Mac machines the back slashes ('\') will need to be replaced with
* forward slashes ('/') throughout this do-file.

global directory "M:\01 PhD\02 parental influence paper"

cd "$global"

/*
** Set up directories. 

* Note you only have to do this once.

* This is where do-files will be saved.
mkdir "$directory\do_files"

* This is where raw data will be saved.
mkdir "$directory\data_raw"

* This is where clean data will be saved.
mkdir "$directory\data_clean"

* This is where log files will be saved.
mkdir "$directory\logs"

* This is where graphs will be saved.
mkdir "$directory\graphs"

* This is where codebooks will be saved.
mkdir "$directory\codebooks"

* This is where temporary files will be saved.
mkdir "$directory\temp"
*/


** Set directories as global paths.

global do "$directory\do_files"
global data_raw "$directory\data_raw"
global data_clean "$directory\data_clean"
global logs "$directory\logs"
global graphs "$directory\graphs"
global books "$directory\codebooks"
global temp "$directory\temp"


** Close any existing log files.

capture log close


** Open a new plain text log file.

log using "$logs\parental_influence_paper_v1_20250", replace text



************************************
* Downloading and preparing files. *
************************************

** Download the data.

* Download 'Growing Up in Scotland: Cohort 1, Sweeps 1-10,2005-2020: 
* Special Licence Access' (GUS) data from the UK Data Service.

* GUS citation:
* ScotCen Social Research. (2024). Growing Up in Scotland: Cohort 1, 
* Sweeps 1-10, 2005-2020: Special Licence Access. [data collection]. 
* 20th Edition. UK Data Service. SN: 5760, DOI:
* http://doi.org/10.5255/UKDA-SN-5760-13


** Move the data to the data_raw folder.

* Move the Stata files for the birth cohort over to the raw data folder. This
* should be 13 files total.



*************************
* Working with Sweep 1. *
*************************

** Use GUS sweep 1 data.

use "$data_raw/gus_cohort1_sw1_b_v4_protect.dta", clear


** Harvest variables pertaining to the research questions.

keep Idnumber DaHGbord DaHGmag5 DaHGhsiz DaGraPar MaHGsx1 DaAgBMum MaCdom01 MaPatt01 MaPatt02 MaPatt03 MaPatt04 MaPatt05 MaPatt06 MaPatt07 MaAtog01 MaAprk01 MaAvst01 MaAlit01 MaAply01 MaAdra01 MaAmus01 MaAedu01 MaAict01 MaAlit02 MaAbok01 MaAcds01 MaAdvd01 MaAlit03 MaAtv01 MaAtv02 MaAtv03 MaAtv04 MaAtv05 MaAtv06 MaAtv07 MaAtv08 MaWsts01 MaWsts02 MaCwlf01 MaCwlf02 MaCwlf03 MaCwlf04 MaHgen01 MaHlsi01 MaHlsi02 MaHprb01 MaHdev01 MaWevr01 MaWest01 MaWest02 MaWest03 MaWest04 MaWest05 MaWest06 MaWest07 MaWest08 MaWest09 MaWest10 MaWest11 MaWest12 MaWprg01 MaWprg02 MaWprg03 MaWpnt01 MaWpnt03 MaWpnt04 MaWpnt05 MaWnow01 DaMsec01 MaWsam02 MaWloo01 MaWloo02 MaWloo03 MaWage01 MaWtyp02 MaWtim01 MaYevr01 MaYpnt01 MaYnow01 DaYsec01 MaYtyp01 MaYtim01 MaWinc09 DaEqv5 DaEqvinc MaWinc10 MaMedu01 MaMeds01 MaMeds02 MaMeds03 MaMeds04 MaMeds05 MaMedf01 MaMedf02 MaMedf03 MaMedf04 MaMedf05 MaMedf06 MaMedf07 MaMedf08 MaMedf09 MaMedf10 MaMedf11 MaMedf12 MaMedf13 MaMedf14 MaMedf15 MaMedf16 MaMedf17 MaMedf18 MaMedf19 MaMedf20 MaMedf21 MaMedf22 MaMedf23 MaMedf24 MaMedf25 MaMedf26 MaMedf27 MaMedf28 MaMedf94 DaMedu01 DaMedu02 DaMedu03 DaMedu04 MaMorg01 MaBorg01 MaYedu01 MaYeds01 MaYeds02 MaYeds03 MaYeds04 MaYeds05 MaYedf01 MaYedf02 MaYedf03 MaYedf04 MaYedf05 MaYedf06 MaYedf07 MaYedf08 MaYedf09 MaYedf10 MaYedf11 MaYedf12 MaYedf13 MaYedf14 MaYedf15 MaYedf16 MaYedf17 MaYedf18 MaYedf19 MaYedf20 MaYedf21 MaYedf22 MaYedf23 MaYedf24 MaYedf25 MaYedf26 MaYedf27 MaYedf28 MaYedf94 DaYedu01 DaYedu02 DaYedu03 DaYedu04 MaYorg01 MaZspe01 MaZhou01 MaZhou05 DaZten02 MaZsle01 DaEthGpM DaEthGpC DaEthGpP DaReligM DaReligC DaReligP ALaSNimd ALaURin2 DaWTchld DaWTbrth DaPSU DaStrat


* add number labels
numlabel _all, add

* gen id
gen id=Idnumber

* gen sweep
gen sweepa=1

* save as temporary dataset
save "$temp/a_gus_v1.dta", replace



*************************
* Working with Sweep 2. *
*************************

** Use GUS sweep 2 data. **

use "$data_raw/gus_cohort1_sw2_b_nov11_protect.dta", clear


** Harvest variables pertaining to the research questions. **

keep Idnumber MbPact02 MbPact03 MbPact04 MbPact05 MbPdis11 MbPdis12 MbPdis13 MbPdis14 MbPdis15 MbPdis31 MbPdis32 MbPdis33 MbPdis34 MbPdis35 MbPdis36 MbPdis37 MbPdis38 MbPdis41 MbPdis42 MbPdis43 MbPdis44 MbPdis45 MbPdis46 MbPdis47 MbPdis48 MbPdis61 MbPdis62 MbPdis63 MbPdis64 MbPdis65 MbPdis66 MbPdis67 MbHGsx1 DbHGbord DbHGmag5 DbHGhsiz MbHgen01 MbHlsi01 MbHlsa01 MbHlsa02 MbHlsb01 MbHlsb02 MbHlsc01 MbHlsc02 MbDgen01 MbAvst01 MbAvst02 MbAlit04 MbAply02 MbAart02 MbAmus02 MbAedu02 MbAict02 MbAlit05 MbAlit06 MbAlit07 MbAlit08 MbAlit09 MbAlit10 MbAlit11 MbAlit12 MbAlit13 MbAlit14 MbAply03 MbAply04 MbAply05 MbAply06 MbAply07 MbAply08 MbAply09 MbAply10 MbAply11 MbAply12 MbAart03 MbAart04 MbAart05 MbAart06 MbAart07 MbAart08 MbAart09 MbAart10 MbAart11 MbAart12 MbAmus03 MbAmus04 MbAmus05 MbAmus06 MbAmus07 MbAmus08 MbAmus09 MbAmus10 MbAmus11 MbAmus12 MbAedu03 MbAedu04 MbAedu05 MbAedu06 MbAedu07 MbAedu08 MbAedu09 MbAedu10 MbAedu11 MbAedu12 MbAict03 MbAict04 MbAict05 MbAict06 MbAict07 MbAict08 MbAict09 MbAict10 MbAict11 MbAict12 MbAvst03 MbAvst04 MbAvst05 MbAvst06 MbAvst07 MbAvst08 MbAvst09 MbAvst10 MbAvst11 MbAlib20 MbAlib21 MbAlib22 MbAlib23 MbAlib24 MbAlib25 MbAlib26 MbAlib27 MbAlib28 MbAlib29 MbAliv20 MbAliv21 MbAliv22 MbAliv23 MbAliv24 MbAliv25 MbAliv26 MbAliv27 MbAliv28 MbAliv29 MbAswm20 MbAswm21 MbAswm22 MbAswm23 MbAswm24 MbAswm25 MbAswm26 MbAswm27 MbAswm28 MbAswm29 MbAart20 MbAart21 MbAart22 MbAart23 MbAart24 MbAart25 MbAart26 MbAart27 MbAart28 MbAart29 MbAzoo20 MbAzoo21 MbAzoo22 MbAzoo23 MbAzoo24 MbAzoo25 MbAzoo26 MbAzoo27 MbAzoo28 MbAzoo29 MbAcnm20 MbAcnm21 MbAcnm22 MbAcnm23 MbAcnm24 MbAcnm25 MbAcnm26 MbAcnm27 MbAcnm28 MbAcnm29 MbAath20 MbAath21 MbAath22 MbAath23 MbAath24 MbAath25 MbAath26 MbAath27 MbAath28 MbAath29 MbAfai20 MbAfai21 MbAfai22 MbAfai23 MbAfai24 MbAfai25 MbAfai26 MbAfai27 MbAfai28 MbAfai29 MbAtv01 MbAtv09 MbAtv10 DbAtv09 DbAtv10 MbAatt01 MbAatt02 MbAatt03 MbAatt04 MbAatt05 MbAatt06 MbAsat01 MbCSBS01 MbWlyr01 MbWevr01 MbWest01 MbWest02 MbWest03 MbWest04 MbWest05 MbWest06 MbWest07 MbWest08 MbWest09 MbWest10 MbWest11 MbWest12 DbWest10 DbWest20 MbWnow01 MbWloo04 MbWloo02 MbWloo03 MbWatt01 MbWatt02 MbWatt03 MbWatt04 MbWatt05 MbWatt06 MbWatt07 DbWatt10 DbWatt20 MbYlyr01 MbYevr01 MbYest01 MbYest02 MbYest03 MbYest04 MbYest05 MbYest06 MbYest07 MbYest08 MbYest09 MbYest10 MbYest11 MbYest12 MbYnow01 MbYloo04 MbYloo02 DbYsta01 DbMsta10 DbMsta11 DbWsta02 MbWinc09 DbEqv5 DbEqvinc MbWinc10 DbMsec01 DbYsec01 DbMsec10 DbMedu01 DbMedu02 DaMedu03 DbMedu03 DaMedu04 DbMedu04 DbYedu01 DaYedu03 DbYedu03 DaYedu04 DbYedu04 DbWinc01 DbWinc02 MbMorg01 MbZspe01 DbMeth07 DbYeth07 DbMfai01 DbYfai01 DbZten01 DbZten02 PbPdis11 PbPdis12 PbPdis13 PbPdis14 PbPdis15 PbPdis31 PbPdis32 PbPdis33 PbPdis34 PbPdis35 PbPdis36 PbPdis37 PbPdis38 PbPdis41 PbPdis42 PbPdis43 PbPdis44 PbPdis45 PbPdis46 PbPdis47 PbPdis48 PbPdis61 PbPdis62 PbPdis63 PbPdis64 PbPdis65 PbPdis66 PbPdis67 PbPact01 PbPact02 PbPact03 PbPact04 PbPact05 PbPact06 PbPact07 PbAatt01 PbAatt02 PbAatt03 PbAatt04 PbAatt05 PbAatt06 PbAsat01 PbWatt01 PbWatt02 PbWatt03 PbWatt04 PbWatt05 PbWatt06 PbWatt07 ALbURin2 ALbSNimd DbPSU DbStrat DbWTbrth DbWtbrtP DbWTchld DbWtchlP


* add number labels
numlabel _all, add

* gen id
gen id=Idnumber

* gen sweep
gen sweepb=1

* save as temporary dataset
save "$temp/b_gus_v1.dta", replace



*************************
* Working with Sweep 3. *
*************************

** Use GUS sweep 3 data. **

use "$data_raw/gus_cohort1_sw3_b_nov11_protect.dta", clear


** Harvest variables pertaining to the research questions. **

keep Idnumber SampType DcHGrsp04 DcHGprim DcHGmag5 McHGsx1 McFmea03 McFmea02 McPSfe01 McPSsx01 McPSne03 McPSpt01 McPSpt08 McPSpt09 McHgen01 McHlsi05 McHlsi06 McHlsi07 McHlsi01 McHlsa01 McHlsb01 McHlsc01 McHlsa02 McHlsb02 McHlsc02 McTbig02 McTpay02 McTotb02 McTotn02 McAlit04 McAply02 McAart02 McAmus02 McAedu02 McAict02 McAlit05 McAlit06 McAlit07 McAlit08 McAlit09 McAlit10 McAlit11 McAlit12 McAlit13 McAlit14 McAply03 McAply04 McAply05 McAply06 McAply07 McAply08 McAply09 McAply10 McAply11 McAply12 McAart03 McAart04 McAart05 McAart06 McAart07 McAart08 McAart09 McAart10 McAart11 McAart12 McAmus03 McAmus04 McAmus05 McAmus06 McAmus07 McAmus08 McAmus09 McAmus10 McAmus11 McAmus12 McAedu03 McAedu04 McAedu05 McAedu06 McAedu07 McAedu08 McAedu09 McAedu10 McAedu11 McAedu12 McAict03 McAict04 McAict05 McAict06 McAict07 McAict08 McAict09 McAict10 McAict11 McAict12 McAvst01 McAvst02 McAbok01 McAcds01 McAdvd01 McAtv01 McAtv09 McAtv10 McAtv06 McAtv07 McAtv08 McAtv11 McAtv12 McAtv13 McAtv14 McAtv15 McAtv16 McAtv17 McAtv18 McAtv20 McAtv21 McAtv22 McAtv23 McAtv94 DcAtv09 DcAtv10 McSNcc11 McSNcc12 McSNcp01 McSNcp02 McSNcp03 McSNcp04 McSNcp05 McSNcp06 McSNcp07 McSNcp08 McHpgn01 McHlsi03 McWlyr01 McWevr01 McWest01 McWest02 McWest03 McWest04 McWest05 McWest06 McWest07 McWest08 McWest09 McWest10 McWest11 McWest12 McWnow01 McWsts02 McWloo04 McWloo02 McWloo03 McWsam03 McWtim01 McWtim02 MaWtim01 MbWtim01 MbWtim02 DaMsec01 DbMsec01 DcMsta01 DcMsta02 DcMsec01 McYlyr01 McYevr01 McYest01 McYest02 McYest03 McYest04 McYest05 McYest06 McYest07 McYest08 McYest09 McYest10 McYest11 McYest12 McYnow01 McYloo04 McYloo02 McYsam03 McYtim01 McYsts02 McYtim02 MaYtim01 MbYtim01 MbYtim02 PbWtim01 DaYsec01 DbYsec01 DcYsta01 DcYsta02 DcYsec01 DcMsec10 DaYedu01 DbYedu01 DcYedu01 DcYedu02 DaYedu03 DbYedu03 DcYedu03 DaYedu04 DbYedu04 DcYedu04 DaEthGpP DbYeth07 DcYeth07 DaReligP DbYfai01 DcYfai01 McWinc09 McWinc10 DcMsta10 DcMsta11 DcWsta02 DcWsta03 DcWinc01 DcWinc02 DcMcClem DcEqvinc DcEqv5 DaMedu01 DbMedu01 DcMedu01 DcMedu02 DaMedu03 DbMedu03 DcMedu03 DaMedu04 DbMedu04 DcMedu04 DaEthGpM DbMeth07 DcMeth07 DaReligM DbMfai01 DcMfai01 McMorg01 McZspe01 DcZten01 DcZten02 DcPSU DcStrat DcWTbrth DcWTchld DcWTbth2 DcWTchd2 DcURind2 DcADsco2 DcHGbord


* add number labels
numlabel _all, add

* gen id
gen id=Idnumber

* gen sweep
gen sweepc=1

* save as temporary dataset
save "$temp/c_gus_v1.dta", replace



*************************
* Working with Sweep 4. *
*************************

** Use GUS sweep 4 data. **

use "$data_raw/gus_cohort1_sw4_b_nov11_protect.dta", clear


** Harvest variables pertaining to the research questions. **

keep Idnumber SampType DdHGbord DdHGmag5 MdPatt01 MdPatt02 MdPatt03 MdPatt07 MdPdis31 MdPdis32 MdPdis33 MdPdis34 MdPdis35 MdPdis36 MdPdis37 MdPdis38 MdPdis39 MdPdis51 MdPdis52 MdPdis53 MdPdis54 MdPdis55 MdPdis56 MdPdis57 MdPdis58 MdPdis59 MdPdis41 MdPdis42 MdPdis43 MdPdis44 MdPdis45 MdPdis46 MdPdis47 MdPdis48 MdPdis49 MdPdis61 MdPdis62 MdPdis63 MdPdis64 MdPdis65 MdPdis66 MdPdis67 MdPdis68 MdPRpy01 MdPSsi01 MdPSbg01 MdPSpt01 MdPStk10 MdPSpt09 MdPStk11 MdPSan01 MdPSan02 MdPSan03 MdPSan04 MdPSan05 MdPSan06 MdPSan07 MdPSan08 MdPSan09 MdPSan10 MdPSan11 MdPSan12 MdPSan13 MdPSan14 MdPSan15 MdPSan16 MdPSan94 MdPShw06 MdPShw07 MdPShw08 MdPShw09 MdPShw10 MdPShw11 MdPShw12 MdPShw13 MdPShw14 MdPSas01 MdPSas02 MdPSas03 MdPSas04 MdPSas05 MdPSas06 MdPSas07 MdPSas08 MdPSas09 MdPSed01  MdHgen01 MdHlsi05 MdHlsi06 MdHlsi07 MdHlsi01 MdHlsa01 MdHlsa02 MdHlsb01 MdHlsb02 MdHlsc01 MdHlsc02 MdAlit04 MdAply02 MdAart02 MdAmus02 MdAedu02 MdAict02 MdAlit05 MdAlit06 MdAlit07 MdAlit08 MdAlit09 MdAlit10 MdAlit11 MdAlit12 MdAlit13 MdAlit14 MdAply03 MdAply04 MdAply05 MdAply06 MdAply07 MdAply08 MdAply09 MdAply10 MdAply11 MdAply12 MdAart03 MdAart04 MdAart05 MdAart06 MdAart07 MdAart08 MdAart09 MdAart10 MdAart11 MdAart12 MdAmus03 MdAmus04 MdAmus05 MdAmus06 MdAmus07 MdAmus08 MdAmus09 MdAmus10 MdAmus11 MdAmus12 MdAedu03 MdAedu04 MdAedu05 MdAedu06 MdAedu07 MdAedu08 MdAedu09 MdAedu10 MdAedu11 MdAedu12 MdAict03 MdAict04 MdAict05 MdAict06 MdAict07 MdAict08 MdAict09 MdAict10 MdAict11 MdAict12 MdAvst01 MdAvst02 MdAvst03 MdAvst04 MdAvst05 MdAvst06 MdAvst07 MdAvst08 MdAvst09 MdAvst10 MdAvst11 MdAlib20 MdAlb20a MdAlib21 MdAlib22 MdAlib23 MdAlib24 MdAlib25 MdAlib26 MdAlib27 MdAlib28 MdAlib30 MdAlib29 MdAliv20 MdAlv20a MdAliv21 MdAliv22 MdAliv23 MdAliv24 MdAliv25 MdAliv27 MdAliv28 MdAliv30 MdAliv29 MdAswm20 MdAsw20a MdAswm21 MdAswm22 MdAswm23 MdAswm24 MdAswm25 MdAswm26 MdAswm27 MdAswm28 MdAswm30 MdAswm29 MdAart20 MdAar20a MdAart21 MdAart22 MdAart23 MdAart24 MdAart25 MdAart26 MdAart27 MdAart28 MdAart30 MdAart29 MdAzoo20 MdAzo20a MdAzoo21 MdAzoo22 MdAzoo23 MdAzoo24 MdAzoo25 MdAzoo26 MdAzoo27 MdAzoo28 MdAzoo30 MdAzoo29 MdAcnm20 MdAcm20a MdAcnm21 MdAcnm22 MdAcnm23 MdAcnm24 MdAcnm25 MdAcnm26 MdAcnm27 MdAcnm28 MdAcnm29 MdAcnm30 MdAcnm29 MdAath20 MdAat20a MdAath21 MdAath22 MdAath23 MdAath24 MdAath25 MdAath26 MdAath27 MdAath28 MdAath29 MdAfai20 MdAfa20a MdAfai21 MdAfai22 MdAfai23 MdAfai24 MdAfai25 MdAfai26 MdAfai27 MdAfai28 MdAfai30 MdAfai29 DdAtv09 DdAtv10 MdHpgn01 MdHlsi03 MdHlsi04 DdAgBMum DdHdas01 DdHdas02 ZDdHdas01 ZDdHdas02 DdHdas03 MdWevr01 MdWnow01 MdWsts02 MdWloo04 MdWloo02 MdWloo03 MdWest01 MdWest02 MdWest03 MdWest04 MdWest05 MdWest06 MdWest07 MdWest08 MdWest09 MdWest10 MdWest11 MdWest12 MdWtim03 DaMsec01 DbMsec01 DcMsec01 DdMsta01 DdMsta02 DdMsec01 MdYevr01 MdYest01 MdYest02 MdYest03 MdYest04 MdYest05 MdYest06 MdYest07 MdYest08 MdYest09 MdYest10 MdYest11 MdYest12 MdYnow01 MdYloo04 MdYloo02 MdYsam03 MdYtim01 MdYsts02 MdYtim02 DaYsec01 DbYsec01 DcYsec01 DdYsta01 DdYsta02 DdMsec10 MdWinc09 MdWinc10 DdMsta10 DdMsta11 DdWsta02 DdWsta03 DdWinc01 DdWinc02 DdMcClem DdEqvinc DdEqv5 DaMedu01 DbMedu01 DcMedu01 DdMedu01 DdMedu02 DaMedu03 DbMedu03 DcMedu03 DdMedu03 DaMedu04 DbMedu04 DcMedu04 DdMedu04 DaEthGpM DbMeth07 DcMeth07 DdMeth07 MdMorg01 DdMfai01 DaYedu01 DbYedu01 DcYedu01 DdYedu01 DdYedu02 DaYedu03 DbYedu03 DcYedu03 DdYedu03 DaYedu04 DbYedu04 DcYedu04 DdYedu04 DaEthGpP DbYeth07 DcYeth07 DdYeth07 DdYfai01 DaZten02 DbZten01 DbZten02 DcZten01 DcZten02 DdZten01 DdZten02 DdWTbrth DdWTbth2 DdPSU DdStrat ALdURin2 ALdSNimd ALdCarst MdHGsx1 MdZspe01 DdHGrsp04

	 
* add number labels
numlabel _all, add

* gen id
gen id=Idnumber

* gen sweep
gen sweepd=1

* save as temporary dataset
save "$temp/d_gus_v1.dta", replace



*************************
* Working with Sweep 5. *
*************************

** Use GUS sweep 5 data. **

use "$data_raw/gus_cohort1_sw5_b_protect.dta", clear


** Harvest variables pertaining to the research questions. **

keep Idnumber SampType DeHGhsiz DeHGrsp04 DeHGbord DeHGmag5 MeFmea02 MeFmea03 MeFmml19 MeFmml23 MeFmml24 MeFmml25 MeFmml26 MeFmml27 MeFmml28 MeFmml29 MeFmml30 MePRpy01 MePSsi01 MePSbg01 MePSsx01 MePSdn01 MePSan01 MePSan02 MePSan03 MePSan04 MePSan05 MePSan06 MePSan07 MePSan08 MePSan09 MePSan10 MePSan11 MePSan12 MePSan13 MePSan14 MePSan15 MePSan16 MePSan94 MeHgen01 MeHlsi05 MeHppl01 MeHlsi06 MeHppl02 MeHlsi07 MeHppl03 MeHlsa01 MeHlsa02 MeHlsb01 MeHlsb02 MeHlsc01 MeHlsc02 MeAlit04 MeAart02 MeAmus02 MeAedu02 MeApuz02 MeAlib01 MeAprk01 MeAict15 MeAict16 MeAtv09 MeAtv25 MeAtv26 DeAtv09 DeAtv25 MeHpgn01 MeHlmt01 MeHlsi03 MeHlsi04 MeWevr01 MeWest01 MeWest02 MeWest03 MeWest04 MeWest05 MeWest06 MeWest07 MeWest08 MeWest09 MeWest10 MeWest11 MeWest12 MeWnow01 MeWsts02 MeWloo04 MeWloo02 MeWloo03 MeWtim01 MeWtim02 MeWwdy01 MeWwhe01 MeWwhe02 MeWwdy02 MeWwdy03 MaWtim01 MbWtim01 MbWtim02 McWtim01 McWtim02 MdWtim03 DaMsec01 DbMsec01 DcMsec01 DdMsec01 DeMsta01 DeMsta02 DeMsec01 MeYevr01 MeYest01 MeYest02 MeYest03 MeYest04 MeYest05 MeYest06 MeYest07 MeYest08 MeYest09 MeYest10 MeYest11 MeYest12 MeYnow01 MeYloo04 MeYloo02 MeYtim01 MeYtim02 MeYwdy01 MeYwhe01 MeYwhe02 MeYwdy02 MeYwdy03 MbYtim01 MbYtim02 McYtim01 McYtim02 MdYtim01 MdYtim02 DaYsec01 DbYsec01 DcYsec01 DdYsec01 DeYsta01 DeYsta02 DeYsec01 DeMsta10 DeMsta11 DeWsta02 DeWsta03 DeMsec10 DaYedu01 DbYedu01 DcYedu01 DdYedu01 DaYedu03 DbYedu03 DcYedu03 DdYedu03 DaYedu04 DbYedu04 DcYedu04 DdYedu04 DeYedu01 DeYedu02 DeYedu03 DeYedu04 DaEthGpP DbYeth07 DcYeth07 DdYeth07 DeYeth07 DaReligP DbYfai01 DcYfai01 DdYfai01 DeYfai01 DaMedu01 DbMedu01 DcMedu01 DdMedu01 DaMedu03 DbMedu03 DcMedu03 DdMedu03 DaMedu04 DbMedu04 DcMedu04 DdMedu04 DeMedu01 DeMedu02 DeMedu03 DeMedu04 DaEthGpM DbMeth07 DcMeth07 DdMeth07 DeMeth07 DaReligM DbMfai01 DcMfai01 DdMfai01 DeMfai01 MeMorg01 MeZspe01 MeWinc09 DeWinc01 DeWinc02 DeMcClem DeEqvinc DeEqv5 DaZten02 DbZten01 DbZten02 DcZten01 DcZten02 DdZten01 DdZten02 DeZten02 DeWTbrth DeWTbth2 DePSU DeStrat ALeURin2 ALeSNim2 ALeCarst MeHGsx1


* add number labels
numlabel _all, add

* gen id
gen id=Idnumber

* gen sweep
gen sweepe=1

* save as temporary dataset
save "$temp/e_gus_v1.dta", replace



*************************
* Working with Sweep 6. *
*************************

** Use GUS sweep 6 data. **

use "$data_raw/gus_cohort1_sw6_b_protect", clear


** Harvest variables pertaining to the research questions. **

keep Idnumber SampType DfHGhsiz DfParTyp DfHGrsp04 DfHGprim DfHGbord DfHGmag5 MfPwhr21 MfPwhr22 MfPwhr23 MfPwhr24 MfPwhr25 MfPwhr26 MfPwhr27 MfPwhr28 MfPwhr29 MfPSan01 MfPSan02 MfPSan03 MfPSan04 MfPSan05 MfPSan06 MfPSan07 MfPSan08 MfPSan09 MfPSan10 MfPSan11 MfPSan12 MfPSan13 MfPSan14 MfPSan15 MfPSan16 MfPSan94 MfPSpt09 MfPShcn1 MfPSas01 MfPSas02 MfPSas03 MfPSas04 MfPSas05 MfPSas06 MfPSas07 MfPSas08 MfPSas09 MfHgen01 MfHlsi05 MfHlsi06 MfHlsi07 MfHlsi01 MfHlsa01 MfHlsa02 MfHlsb01 MfHlsb02 MfHlsc01 MfHlsc02 MfHlsd01 MfHlse01 MfHlsf01 MfAlit04 MfAart02 MfAmus02 MfAedu2a MfAedu2b MfAprk01 MfAply02 MfAout01 MfAict02 MfAict15 MfAict16 MfAtv01 MfAtv24 MfAtv09 MfAtv25 DfAtv09 DfAtv25 MfHpgn01 MfHlsi03 MfHlsi04 MfYpgn01 MfAclp01 MfAclp02 MfAclp03 MfAclp04 MfAclp05 MfAclp06 MfAclp07 MfAclp94 MfAclp95 MfAclN01 MfAclN02 MfAclN03 MfAclN04 MfAclN05 MfAclN06 MfAclN07 MfAclN08 MfAclN09 MfAclN94 MfWevr01 MfWest01 MfWest02 MfWest03 MfWest04 MfWest05 MfWest06 MfWest07 MfWest08 MfWest09 MfWest10 MfWest11 MfWest12 MfWnow01 MfWloo04 MfWloo02 MfWloo03 MaWtim01 MbWtim01 MbWtim02 McWtim01 McWtim02 MdWtim03 MeWtim01 MeWtim02 DaMsec01 DbMsec01 DcMsec01 DdMsec01 DeMsec01 DfMsta01 DfMsta02 DfMsec01 MfYevr01 MfYest01 MfYest02 MfYest03 MfYest04 MfYest05 MfYest06 MfYest07 MfYest08 MfYest09 MfYest10 MfYest11 MfYest12 MfYnow01 MfYloo04 MfYloo02 MfYtim01 MfYsts02 MfYtim02 MaYtim01 MbYtim01 MbYtim02 PbWtim01 McYtim01 McYtim02 MdYtim01 MdYtim02 MeYtim01 MeYtim02 DaYsec01 DbYsec01 DcYsec01 DdYsec01 DeYsec01 DfYsta01 DfYsta02 DfYsec01 DfMsta10 DfMsta11 DfWsta02 DfWsta03 DfMsec10 DaMedu01 DbMedu01 DcMedu01 DdMedu01 DeMedu01 DaMedu03 DbMedu03 DcMedu03 DdMedu03 DeMedu03 DaMedu04 DbMedu04 DcMedu04 DdMedu04 DeMedu04 DfMedu01 DfMedu02 DfMedu03 DfMedu04 MfMeth01 DaEthGpM DbMeth07 DcMeth07 DdMeth07 DeMeth07 DfMeth07 MfMorg01 DaReligM DbMfai01 DcMfai01 DdMfai01 DeMfai01 DfMfai01 MfMfai07 DaYedu01 DbYedu01 DcYedu01 DdYedu01 DeYedu01 DaYedu03 DbYedu03 DcYedu03 DdYedu03 DeYedu03 DaYedu04 DcYedu04 DdYedu04 DeYedu04 DfYedu01 DfYedu02 DfYedu03 DfYedu04 MfYeth01 DaEthGpP DbYeth07 DdYeth07 DeYeth07 DfYeth07 DaReligP DbYfai01 DcYfai01 DdYfai01 DeYfai01 DfYfai01 MfYfai04 MfWinc09 DfWinc01 DfWinc02 DfMcClem DfEqvinc DfEqv5 DaZten02 DbZten01 DbZten02 DcZten01 DcZten02 DdZten01 DdZten02 DeZten02 DfZten01 DfZten02 DfWTbrth DfWTbth2 DfPSU DfStrat ALfURin2 ALfSNim2 ALfCarst MfHGsx1


* add number labels
numlabel _all, add

* gen id
gen id=Idnumber

* gen sweep
gen sweepf=1

* save as temporary dataset
save "$temp/f_gus_v1.dta", replace



*************************
* Working with Sweep 7. *
*************************

** Use GUS sweep 7 data. **

use "$data_raw/gus_bc1sweep7_protect", clear


** Harvest variables pertaining to the research questions. **

keep Idnumber MgHGsx1 DgHGhsiz DgHGbord DgHGprim DgHGrsp04 DgHGmag5 CgPa1 CgPa2 CgPa3 CgPa4 CgPa5 CgPa6 CgPa7 CgPa8 CgPa9 CgPa10 CgPa11 CgPa12 CgPa13 CgSch1 CgSch2 CgSch3 CgSch4 CgSch5 CgSch6 CgSch7 CgSch8 CgSch9 CgSch10 CgSch11 CgSch12 MgPSMPE MgPSMSE MgPSMSN MgPSMPC MgPSMCla MgPSYPE MgPSYSE MgPSYSN MgPSYPC MgPSYCla MGPSctt1 MgSprg MgPSan01 MgPSan02 MgPSan03 MgPSan04 MgPSan05 MgPSan06 MgPSan07 MgPSan08 MgPSan09 MgPSan10 MgPSan11 MgPSan12 MgPSan13 MgPSan14 MgPSan15 MgPSan16 MgPSan94 MgEasp1 MgEasp2 MgEasp3 MgEasp5 MgEasp6 MgEasp7 MgEasp8 MgEasp9 MgEasp10 MgEbar1 MgEbar21 MgEbar22 MgEbar23 MgEbar24 MgEbar25 MgEbar26 MgEbar94 MgEasp21 MgEasp22 MgEasp23 MgEasp24 MgEasp25 MgEasp26 MgEasp27 MgEasp28 MgEasp29 MgLrsp1 MgLrsp4 MgLinv1 MgLinv2 MgPShcn1 MgLinv7 MgLinv8 MgLatt1 MgLatt2 MgLatt3 MgLatt4 MgLpsc1 MgLpsc2 MgLpsc3 MgLpch1 MgLpch2 MgHlsiD1 MgHlsiD2 MgHlsiD3 MgHlsiD4 MgHlsiD5 MgHlsiD6 MgHlsiD7 MgHlsiD8 MgHlsiD9 MgHlsiDa MgHlsi06 MgHlsiE1 MgHlsiE2 MgHlsiE3 MgHlsiE4 MgHlsiE5 MgHlsiE6 MgHlsiE7  MgHlsiE8 MgHlsiE9 MgHlsiEa MgHlsi07 MgHlsiF1 MgHlsiF2 MgHlsiF1 MgHlsiF2 MgHlsiF3 MgHlsiF4 MgHlsiF5 MgHlsiF6 MgHlsiF7 MgHlsiF8 MgHlsiF9 MgHlsiFa MgHlsiA MgHlsa01 MgHldaA1 MgHldaA2 MgHldaA3 MgHldaA4 MgHldaA5 MgHldaA6 MgHldaA7 MgHldaA8 MgHldaA9 MgHldaAa MgHlsiB MgHlsb01 MgHldaB1 MgHldaB2 MgHldaB3 MgHldaB4 MgHldaB5 MgHldaB6 MgHldaB7 MgHldaB8 MgHldaB9 MgHldaBa MgHlsiC MgHlsc01 MgHldaC1 MgHldaC2 MgHldaC3 MgHldaC4 MgHldaC5 MgHldaC6 MgHldaC7 MgHldaC8 MgHldaC9 MgHldaCa MgDcon10 MgDcon03 MgAvst03 MgAvst04 MgAvst05 MgAvst06 MgAvst07 MgAvst08 MgAvst09 MgAvst10 MgAvst11 MgAsch1 MgAclb01 MgAclb02 MgAclb03 MgAclb04 MgAclb05 MgAclb06 MgAclb07 MgAclb08 MgAclb09 MgAclbw1 MgAclbw2 MgAclbw3 MgAclbw4 MgAclbw5 MgAclbw6 MgAclbw7 MgAclbw8 MGAclN1 MGAclN2 MGAclN3 MGAclN4 MGAclN5 MGAclN6 MGAclN12 MGAclN7 MGAclN8 MGAclN9 MGAclN10 MGAclN11 MGAclN14 MGAclN94 MgSNwho1 MgPwhr21 MgPwhr22 MgPwhr23 MgPwhr24 MgPwhr25 MgPwhr26 MgPwhr27 MgPwhr28 MgPwhr29 MgPwhr210 MgPwhr211 MgAqfp1 MgAqfp2 MgAqfp4 MgAafp1 MgAafp2 MgAafp4 MgAlit04 MgAtv09 MgAtv25 MgHpgn01 MgHlsi03 MgHlsi04 MgYpgn01 MgAPQ1 MgAPQ2 MgAPQ3 MgAPQ4 MgAPQ5 MgAPQ6 MgAPQ7 MgAPQ8 MgAPQ9 MgAPQ10 MgAPQ11 MgAPQ12 MgAPQ13 MgAPQ14 MgWlyr01 MgWevr01 MgWacy1 MgWacy2 MgWwyn1 MgWwyn2 MgWwyn3 MgWwyn4 MgWwyn5 MgWwyn6 MgWwyn94 MgWwyn95 MgWwyn96 MgW1oo03 MgWacy3 MgWnow01 MgWtim01 MgYlyr01 MgYevr01 MgYacy1 MgYacy2 MgYacy3 MgYnow01 DgMtsec DgYtsec DgMsec01 DgYsec01 DgMsec10 DgMsta01 DgMsta02 DgWsta02 DgWsta03 MgMedu01 DgMedu01 DgMedu02 DgMedu03 DgMedu04 DgYedu01 DgYedu02 DgYedu03 DgYedu04 DgMedu10 MgMorg01 MgMfai07 MgZspe01 MgYfai04 DgMeth07 DgYeth07 DgMfai01 DgYfai01 MgWinc09 DgWinc01 DgWinc02 DgMcClem DgEqvinc DgEqv5 MgZhou01 DgZten01 DgZten02 DgPSU DgStrat ALgCarst ALgURin1 ALgURin2 ALgSNim2 ALgLow15 ALgHBdBc DgWTbrth DgWTbth2 DgWTchld DgWTchd2 MgHGsx1

	 
* add number labels
numlabel _all, add

* gen id
gen id=Idnumber

* gen sweep
gen sweepg=1

* save as temporary dataset
save "$temp/g_gus_v1.dta", replace



***************************
* Working with Sweep 7.5. *
***************************

** Use GUS sweep 7.5 data. **

use "$data_raw/gus_cohort1_sw7_5_b_protect", clear


** Harvest variables pertaining to the research questions. **

keep Idnumber WzHGsx1 WzFriOft WzFriWkd WzFriAft WzEtho2 WzEtho6 WzEtho8 WzEtho9

	 
* add number labels
numlabel _all, add

* gen id
gen id=Idnumber

* gen sweep
gen sweeph=1

* save as temporary dataset
save "$temp/h_gus_v1.dta", replace



*************************
* Working with Sweep 8. *
*************************

** Use GUS sweep 8 data. **

use "$data_raw/gus_cohort1_sw8_b_protect", clear


** Harvest variables pertaining to the research questions. **

keep Idnumber DhHGrsp04 DhParTyp DhHGhsiz DhHGbord DhHGprim DhHGmag5 MhHGsx1 MhFriAft MhFriWkd MhPsuvf MhSNwho1 MhPsuva MhPsuvd MhPsuvh MhPsuvm MhPconds MhPcondd MhPcondg MhPcondo MhPcondi MhAlkaf MhAlkaft MhPSan01 MhPSan02 MhPSan03 MhPSan04 MhPSan05 MhPSan06 MhPSan07 MhPSan08 MhPSan09 MhPSan10 MhPSan11 MhPSan12 MhPSan13 MhPSan14 MhPSan15 MhPSan16 MhPSan94 MhHgen01 MhHlsi05 MhHlsiDa MhHlsi06 MhHlsiEa MhHlsi07 MhHlsiFa MhHlsi08 MhHlsiGa MhHlsi09 MhHlsi01 MhHlsiA MhHldaAa MhHlsiB MhHldaBa MhHlsiC MhHldaCa MhAcStruc MhAlit04 MhAtv24 MhAtv25 MhFmea02 MhFmea03 MhHpgn01 MhHlsi03 MhHlsi04 MhYpgn01 MhWlyr01 MhWevr01 MhWacy1 MhWacy2 MhWwyn1 MhWwyn2 MhWwyn3 MhWwyn4 MhWwyn5 MhWwyn6 MhWwyn94 MhWwyn95 MhWwyn96 MhW1oo03 MhWacy3 MhWnow01 MhWtim01 MhWscr01 MhYlyr01 MhYevr01 MhYacy1 MhYacy2 MhYacy3 MhYnow01 MhYscr01 DhMsta01 DhMsta02 DhYsta01 DhYsta02 DhMsta10 DhMsta11 DhWsta02 DhWsta03 DhMsec01 DhYsec01 DhMsec10 MhMorg01 MhMfai07 MhYedu01 DhMedu01 DhMedu02 DhMedu03 DhMedu04 DhYedu01 DhYedu02 DhYedu03 DhYedu04 DhMedu10 DhMeth07 DhYeth07 DhMfai01 DhYfai01 MhYfai04 MhWinc09 DhMcClem DhEqvinc DhEqv5 DhWinc02 MhZhou01 DhZten02 ALhSNim2 ALhURin2 DhPSU DhStrat DhWTbrth DhWTbth2 DhWTchld DhWTchd2 CAhPrb1 CAhPrb2 CAhPrb3 CAhPrb4 CAhPrb5 CAhPrb6 CAhPrb7 DhLCRsc DhLCStSc DhRVsco DhSCSco DhEVSco ChSch3 ChSch2 ChSch1 ChSch13 ChSch14 ChSch15 ChSch16 ChSch17 ChSch5 ChSch18 ChSch19 ChSch20 ChSch21 ChSch9 ChSch10 ChSch12 ChSch22 ChSch23 ChSch6 ChSch26 ChSch27 ChSch28 ChSuper5 ChSuper1 ChSuper2 ChSuper3 ChSuper4 ALhCarst MhHGsx1

	 
* add number labels
numlabel _all, add

* gen id
gen id=Idnumber

* gen sweep
gen sweepi=1

* save as temporary dataset
save "$temp/i_gus_v1.dta", replace



*************************
* Working with Sweep 8.5. *
*************************

** Use GUS sweep 8.5 data. **

use "$data_raw/gus_cohort1_sw8_5_b_protect", clear


** Harvest variables pertaining to the research questions. **

keep IDNumber WyHGsx1 WyPaceLearn WyDiffAcad WyMotivated WyOrganised WyAblHomework WyCommCl WyTeamSp WyIndivSp WyArtMus WyAcadCl WyExtraSkills WyRelClass WyActOther WyNuRegAct WyOvernAct WyCertAward DyWTbrth DyWTbth2

	 
* add number labels
numlabel _all, add

* gen id
gen id=IDNumber

* gen sweep
gen sweepj=1

* save as temporary dataset
save "$temp/j_gus_v1.dta", replace



*************************
* Working with Sweep 9. *
*************************

** Use GUS sweep 9 data. **

use "$data_raw/gus_bc1sweep9_protect", clear


** Harvest variables pertaining to the research questions. **

keep IDNumber MiHGsx1 DiHGagC DiHGrsp04 DiHgbord DiHGprim DiHGmag5 DiP7ID DiSecId MiPSan01 MiPSan02 MiPSan03 MiPSan04 MiPSan05 MiPSan06 MiPSan07 MiPSan08 MiPSan09 MiPSan10 MiPSan11 MiPSan12 MiPSan13 MiPSan14 MiPSan15 MiPSan16 MiPSan94 MiPSanck01 MiPSanck02 MiPSanck03 MiPSanck04 MiPSanck05 MiPSanck06 MiPSanck07 MiPSanck08 MiPSanck09 MiPSanck10 MiPSanck11 MiPSanck12 MiPSanck13 MiPSanck14 MiPSanck15 MiPSanck24 MiAsnsa MiSupa MiSupb MiSTra MiSTrf MiSRpda2 MiSRpda3 MiSRpda4 MiSRpda5 MiSRpda6 MiPsuvw MiPsuva MiPsuvd MiRegAct1 MiRegAct2 MiRegAct3 MiRegAct4 MiRegAct5 MiRegAct6 MiRegAc95 MiActYth1 MiActYth2 MiActYth3 MiActYth4 MiActYth5 MiActYth6 MiActYth95 MiActYthP MiActYthU1 MiActYthU2 MiActYthU3 MiActYthU4 MiActYthU5 MiActYthU6 MiActYthU7 MiActYthU8 MiActYthU9 MiActYthU10 MiActYthU11 MiActYthU95 MiActYthD1 MiActYthD2 MiActYthD3 MiActYthD4 MiActYthD5 MiActYthD6 MiActYthD7 MiActYthD8 MiActYthD9 MiActYthD10 MiActYthD11 MiActYthD95 MiActYthC1 MiActYthC2 MiActYthC3 MiActYthC4 MiActYthC5 MiActYthC6 MiActYthC7 MiActYthC8 MiActYthC9 MiActYthC10 MiActYthC11 MiActYthC95 MiActYthW1 MiActYthW2 MiActYthW3 MiActYthW4 MiActYthW5 MiActYthW6 MiActYthW7 MiActYthW8 MiActYthW9 MiActYthW10 MiActYthW11 MiActYthW95 MiActYthA1 MiActYthA2 MiActYthA3 MiActYthA4 MiActYthA5 MiActYthA6 MiActYthA7 MiActYthA8 MiActYthA9 MiActYthA10 MiActYthA11 MiActYthA95 MiActYthNR1 MiActYthNR2 MiActYthNR3 MiActYthNR4 MiActYthNR5 MiActYthNR6 MiActYthNR7 MiActYthNR8 MiActYthNR9 MiActYthNR10 MiActYthNR11 MiActYthNR12 MiActYthNR13 MiActYthNR14 MiActYthNR94 MiTVWeek MiTVWknd MiHgen01 MiHlsi05 MiHlsiDa MiHlsi06 MiHlsiEa MiHlsi07 MiHlsiFa MiHlsi08 MiHlsiGa MiHlsa01 MiHldaAa MiHlsiA MiHlsb01 MiHldaBa MiHlsiB MiHlsiC MiHldaCa MiAlkaf MiAlkaft MiWlyr01 MiWevr01 MiWnow01 MiLkWk3 MiLkWk2 MiWtim02 MiWtim01 MiWscr01 MiYevr01 MiYnow01 MiYloo04 MiWYlo02 MiYscr01 DiMsec01 DiYsec01 DiMsec10 DiMsta01 DiMsta02 DiYsta01 DiYsta02 DiWsta02 DiWsta03 MiMedu01 MiYedu01 DiMedu01 DiMedu02 DiMedu03 DiMedu04 DiYedu01 DiYedu02 DiYedu03 DiYedu04 DiMedu10 DiCfai02 MiZspe01 DiMeth07 DiYeth07 DiMfai02 DiYfai02 MiWinc09 DiWinc02 DIMcClem DiEqv5 MiZhou01 MiSSchFil MiPene MiPeng MiPent MiPenh MiPeno MiPens MiPend MiHwkhe MiHwkwh1 MiHwkwh2 MiHwkwh3 MiHwkwh4 MiHwkwh5 MiHwkwh6 MiHwkwh7 MiPShcn1 MiLrsp1 MiPSasEd MiHlsi03 MiHlsi04 CiGHt CiWc CiSDQwk CiSch3 CiSch2 CiSch1 CiSch14 CiSch18 CiSch22 CiSch23 CiEngLik CiMatLik CiSciLik CiLanLik CiSchSk CiTrl CiTrs CiSchp CiSchm CiSche CiSchh CiScho CiSuper5 CiSuper1 CiSuper2 DiLCRsc DiLCStSc DiRVSco DiSCSco DiEVSco ALiSNim2 ALirural DiWTbrth DiWTbth2 DiWTchld DiWTchd2 DiPSU DiStrata PiSampType PiPene PiPeng PiPent PiPenh PiPeno PiPens PiPend PiHwkhe PiSRpda2 PiSRpda3 PiSRpda4 PiSRpda5 PiSRpda6 PiPSasEd PiPsuvw PiPsuva PiPsuvd PiCprg PiHlsi03 PiHlsi04 w9_PAPI PiPSU strata_PAPI MiHGsx1

	 
* add number labels
numlabel _all, add

* gen id
gen id=IDNumber

* gen sweep
gen sweepk=1

* save as temporary dataset
save "$temp/k_gus_v1.dta", replace



*************************
* Working with Sweep 10. *
*************************

** Use GUS sweep 10 data. **

use "$data_raw/gus_bc1sweep10_protect", clear


** Fixing some data errors, hat tip Maddi Bunker

replace Djpsu = 4 if IDNumber == 1006984
replace Djstrata = 2 if IDNumber == 1006984
replace Djpsu = 49 if IDNumber == 1002532
replace Djstrata = 25 if IDNumber == 1002532
replace Djpsu = 65 if IDNumber == 1001719
replace Djstrata = 33 if IDNumber == 1001719
replace Djpsu = 76 if IDNumber == 1005588
replace Djstrata = 38 if IDNumber == 1005588
replace Djpsu = 110 if IDNumber == 1006447
replace Djstrata = 55 if IDNumber == 1006447
replace Djpsu = 555 if IDNumber == 4000803
replace Djstrata = 525 if IDNumber == 4000803


** Harvest variables pertaining to the research questions. **

keep IDNumber Djhgrsp04 Djhgprim Djhgmag5 Djhgagc MjHGsx1 DjHGag1 MjPsuvw MjPsuva MjPsuvd MjPSanck01 MjPSanck02 MjPSanck03 MjPSanck04 MjPSanck05 MjPSanck06 MjPSanck07 MjPSanck08 MjPSanck09 MjPSanck10 MjPSanck11 MjPSanck12 MjPSanck13 MjPSanck14 MjPSanck15 MjPSanck24 MjPSan01 MjPSan02 MjPSan03 MjPSan04 MjPSan05 MjPSan06 MjPSan07 MjPSan08 MjPSan09 MjPSan10 MjPSan11 MjPSan12 MjPSan13 MjPSan14 MjPSan15 MjPSan16 MjPSan94 MjSatnd MjSRpda2 MjSRpda3 MjSRpda4 MjSRpda5 MjSRpda6 MjHgen01 MjHlsi05 MjHlsiDa MjHlsi06 MjHlsiEa MjHlsi07 MjHlsiFa MjHlsi08 MjHlsiGa MjHlsiA MjHldaAa MjHlsiB MjHldaBa MjHlsiC MjHldaCa MjBInfDis MjBHsPrbM MjBHlsiac MjBHsPrbM2 MjBHlsiac2 MjBHsPrbM3 MjBHlsiac3 MjAlkaf MjAlkaft MjAlkBC MjAlkBCt MjWlyr01 MjWevr01 MjWnow01 MjWloo04 MjWloo02 MjBWest01 MjBWest02 MjBWest03 MjBWest04 MjBWest05 MjBWest06 MjBWest07 MjBWest08 MjBWest09 MjBWest10 MjBWest11 MjBWest12 MjYlyr01 MjYevr01 MjYnow01 MjYloo04 MjWYlo02 Djmsec01 Djysec01 Djmsec10 Djmsta01 Djmsta02 Djysta01 Djysta02 Djwsta02 Djwsta03 MjMedu01 MjYedu01 DjMedu01 DjMedu02 DjMedu03 DjMedu04 Djyedu01 Djyedu02 Djyedu03 Djyedu04 Djmedu10 MjMorg01 MjRUKTiA MjZspe01 Djmeth07 Djyeth07 Djmfai02 Djyfai02 MjWInc09 Djwinc02 MjWincCo MjWinCoI Djmcclem Djeqvinc Djeqv5 DjZTen02 MjZhou01 MjHlsi03 MjHlsi04 MjHlthFam MjHwkhe MjHwkwh1 MjHwkwh2 MjHwkwh3 MjHwkwh4 MjHwkwh5 MjHwkwh6 MjHwkwh7 MjHwkwh8 MjHwkwh9 MjPSasEd CjTVScd CjRegAct1 CjRegAct2 CjRegAct3 CjRegAct4 CjRegAct5 CjRegAct6 CjRegAct7 CjActYth1 CjActYth2 CjActYth3 CjActYth4 CjActYth5 CjActYth6 CjActYth7 CjSSch CjSchYr CjSch3 CjSch2 CjSch1 CjSch14 CjSch18 CjSch22 CjSchWeb CjSch3C CjSch2C CjSch1C CjSch14C CjSch18C CjSch22C CjSchSk CjSchSkC CjSchp CjSchEng CjSchMat CjCasE CjCasAS CjCasEC CjCasEOC CjCasCh CjCasChH CjCasASC CjCaACh CjCaAchH CjGenId CjSexId CjGHt CjGHt DjSCSco DjEVSco PjPsuvw PjPsuva PjPsuvd PjHlsi03 PjHlsi04 PjSPpda2 PjSPpda3 PjSPpda4 PjSPpda5 ALjsimdq20v2 ALjrural ALjsimdq16 Djwtbth2f Djwtbrthf Djwtchldf Djwtchd2f Djwtchlda Djwtchd2a Djwtpa Djwtbrtha Djwtbth2a Djpsu Djstrata MjHGsx1 MjMorgP1

	 
* add number labels
numlabel _all, add

* gen id
gen id=IDNumber

* gen sweep
gen sweepl=1

* save as temporary dataset
save "$temp/l_gus_v1.dta", replace



*************************
* Working with Sweep 11. *
*************************

** Use GUS sweep 11 data. **

use "$data_raw/gus_bc1sweep11_protect", clear


** Harvest variables pertaining to the research questions. **

keep IDNumber MkHGsx1 MkHGmr1 MkHGlv1 DkHGmr1 DkHgagc DkHGag1 Dkhgmag5 DkHSize2b DkZTen01 DkZTen02 CkZliDa CkZLiWhi_1 CkZLiWhi_2 CkZLiWhi_3 CkZLiWhi_4 CkZLiWhi_5 CkZLiWhi_6 CkZLiWhi_7 CkZliDn CkPrmy_1 CkPrmy_2 CkPrmy_3 CkPrmy_4 CkPrmy_5 CkPrmy_6 CkPrmy_7 CkPrmy_8 CkPrmy_9 CkPrmy_10 CkAlkaf CkAlkaft CkHgen01 CkSSch2 CkSSlvw CkSSlvy_1 CkSSlvy_2 CkSSlvy_3 CkSSlvy_4 CkSSlvy_5 CkSSlvy_6 CkSSlvy_7 CkSSlvy_8 CkSSlvy_9 CkSSlvy_10 CkSSlvy_11 CkSchYr CkScht CkStchw CkStche CkStchu CkStcht CkSaco CkSala CkSawo CkSath CkSchp CkEduWo CkEduWoA DkSubChfN CkSubCfr_1 CkSubCfr_2 CkSubCfr_3 CkSubCfr_4 CkSubCfr_5 CkSubCfr_6 CkSubCfr_7 CkSubCfr_8 CkSubCfr_9 CkSubCfr_10 CkSubCfr_11 CkSubCfr_12 CkSubCfr_13 DkSubChsN CkSubCsr_1 CkSubCsr_2 CkSubCsr_3 CkSubCsr_4 CkSubCsr_5 CkSubCsr_6 CkSubCsr_7 CkSubCsr_8 CkSubCsr_9 CkSubCsr_10 CkSubCsr_11 CkSubCsr_12 CkSubCsr_13 CkSbwfo CkSbwfoy_1 CkSbwfoy_2 CkSbwfoy_3 CkSbwfoy_4 CkSbwfoy_5 CkSbwfoy_6 CkSbwFi CkSbwFiy_1 CkSbwFiy_2 CkSbwFiy_3 CkSbwFiy_4 CkSbwFiy_5 CkSbwFiy_6 CkSbwSi CkSbwSiy_1 CkSbwSiy_2 CkSbwSiy_3 CkSbwSiy_4 CkSbwSiy_5 CkSbwSiy_6 CkFhest CkFhepf CkFheq_1 CkFheq_2 CkFheq_3 CkFheq_4 CkFheq_5 CkFheq_6 CkFheq_7 CkFheq_8 CkFheq_9 CkFheq_10 CkFheq_11 CkEdtap_1 CkEdtap_2 CkEdtap_3 CkEdtap_4 CkEdtap_5 CkEdtap_6 CkEdtap_7 CkEdtap_8 CkEdtap_9 CkEdtap_10 CkEdtaa_1 CkEdtaa_2 CkEdtaa_3 CkEdtaa_4 CkEdtaa_5 CkEdtaa_6 CkEdtaa_7 CkEdtaa_8 CkEdtaa_9 CkEdtaa_10 DkEdtaa1 DkEdtaa2 DkEdtaa3 DkEdtaa4 DkEdtaa5 CkCasAS CkCrad_1 CkCrad_2 CkCrad_3 CkCrad_4 CkCrad_5 CkCrad_6 CkCrad_7 CkCrad_8 CkCrad_9 CkCrad_10 CkCrad_11 CkCrad_12 CkCradMn CkCrim_1 CkCrim_2 CkCrim_3 CkCrim_4 CkCrim_5 CkCrim_6 CkCrim_7 CkCrim_8 CkCrim_9 CkCrim_10 CkCrim_11 CkCrim_12 CkCasCh CkCasChH CkAprnt CkTraSch CkAppCol CkTrnCol CkAppTy CkApprsn CkTrarsn CkApppa CkJoPay CkEvAppT CkAppTFin CkTraTFin CkWevr01 CkWnow01 CkMaiAc_1 CkMaiAc_2 CkMaiAc_3 CkMaiAc_4 CkMaiAc_5 CkMaiAc_6 CkMaiAc_7 CkMaiAc_8 CkMaiAc_9 CkMaiAc_10 Dkcsec01 CkJoZero CkJoTy_1 CkJoTy_2 CkJoTy_3 CkJoTy_4 CkJoTy_5 CkJoTy_6 CkJoTy_7 CkJoTy_8 CkJofnd CkJoHowM CkCovAff_1 CkCovAff_2 CkCovAff_3 CkCovAff_4 CkCovAff_5 CkCovAff_6 CkCovAff_7 CkCovAff_8 CkCovAff_9 CkWoMo_1 CkWoMo_2 CkWoMo_3 CkWoMo_4 CkWoMo_5 CkWoMo_6 CkWoMo_7 CkWoMo_8 CkWoMo_9 CkWoMo_10 CkWoMo_11 CkWoMo_12 CkLkjb CkLkjwt_1 CkLkjwt_2 CkLkjwt_3 CkLkjwt_4 CkLkjwt_5 CkLkjwt_6 CkLkjwt_7 CkLkjwt_8 CkWknr_1 CkWknr_2 CkWknr_3 CkWknr_4 CkWknr_5 CkWknr_6 CkWknr_7 CkWknr_8 CkWksup CkWksupw_1 CkWksupw_2 CkWksupw_3 CkWksupw_4 CkWksupw_5 CkWksupw_6 CkWksupw_7 CkWksupw_8 CkWksupw_9 CkWksupw_10 CkFutca CkFutfa CkFutci CkFutbu CkFutbi CkTrsw DkCfai01 CkPreCh CkPreCur CkPreEv DkRVSco DkSCSco DkEVSco DkLCStSc MkCAdvs_1  MkCAdvs_2 MkCAdvs_3 MkCAdvs_4 MkCAdvs_5 MkCAdvs_6 MkCAdvs_7 MkCAdvs_8 MkCAdvs_9 MkCAdvs_10 MkCAdvs_11 MkCAdvs_12 MkCAdvw_1 MkCAdvw_2 MkCAdvw_3 MkCAdvw_4 MkCAdvw_5 MkCAdvw_6 MkCAdvw_7 MkCAdvw_8 MkCAdvw_9 MkCAdvw_10 MkCAdvw_11 MkCAdvw_12 MkCAdvw_13 MkCAdvw_14 MkOpsps_1 MkOpsps_2 MkOpsps_3 MkOpsps_4 MkOpsps_5 MkOpsps_6 MkOpsps_7 MkOpsps_8 MkOpsps_9 MkOpsps_10 MkPasps MkPSas_1 MkPSas_2 MkPSas_3 MkPSas_4 MkPSas_5 MkPSas_6 MkPSas_7 MkPSas_8 MkPSas_9 MkPSas_10 MkPSas_11 MkPSas_12 MkPSas_13 MkPsas_14 MkPsas_15 MkPsas_16 MkHlsi03 MkHlsi04 MkHlsiA MkHldaAa MkHlsiB MkHldaBa MkHlsiC MkHldaCa MkWrkLsYr2 MkWrkEv3 MkWrkNow3 MkJbHrs4 MkJbHrs5 DkMJbHrs MkPrWkLsYr MkPrCurrWk MkPrJbHrs2 MkPrJbHrs DkYJbHrs Dkmsta01 Dkmsta10 Dkwsta02 Dkmsta02 Dkysta01 Dkysta02 Dkmsec01 Dkysec01 Dkmsec10 MkInct MkWincwe MkWincMo MkWincAn MkWInc09 Dkeqv5 Dkeqvinc MkEducFin DkYEdu01 DkMedu04 Dkyedu04 Dkmedu10 MkMorg01 MkRUKTiA MkMorgP1 MkPUKTiA Dkmeth07 Dkyeth07 ALksimdq2020 ALkurin2 DkWTbrth DkWTbth2 DkWTchld DkWTchd2 DkPSU DkStrata MkHGsx1


* add number labels
numlabel _all, add

* gen id
gen id=IDNumber

* gen sweep
gen sweepm=1

* save as temporary dataset
save "$temp/m_gus_v1.dta", replace



**********************************
* Combine the prepared datasets. *
**********************************

** Combine the datasets with a looped 'append' function. **

use "$temp/a_gus_v1"

foreach sweep in b c d e f g h i j h i j k l ///
	{
	sort id
	merge 1:1 id using "$temp/`sweep'_gus_v1.dta"
	sort id
	drop _merge
	}

** Save the dataset containing harvested variables from all waves. **
	
save "$data_clean/gus_wide_v1.dta", replace



**********************
* Use combined data. *
**********************

use "$data_clean/gus_wide_v1.dta", clear

codebook, compact



**************************************
* Preparing variables for modelling. *
**************************************

*** young person's aspirations

tab CjCasAS, m
replace CjCasAS=. if CjCasAS==-1
tab CjCasAS, m

tab CjCasASC, m
replace CjCasASC=. if CjCasASC==-1
tab CjCasASC, m

* cheking how many answered pre-/post- covid
sum id if !missing(CjCasAS) | !missing(CjCasASC)
sum id if !missing(CjCasAS) & missing(CjCasASC)
sum id if missing(CjCasAS) & !missing(CjCasASC)

gen post_school_plans=.
replace post_school_plans=1 if (CjCasAS==1) | (CjCasASC==1)
replace post_school_plans=2 if (CjCasAS==2) | (CjCasASC==2)
replace post_school_plans=3 if (CjCasAS==3) | (CjCasASC==3)
replace post_school_plans=4 if (CjCasAS==4) | (CjCasASC==4)
replace post_school_plans=5 if (CjCasAS==6) | (CjCasASC==6)

la de l_post_school_plans 1 "I want to go to University" ///
						  2 "I want to go to College" ///
						  3 "I want to begin an apprenticeship, or some other vocational training course" ///
						  4 "I want to begin full-time work" ///
						  5 "Not Sure"
la val post_school_plans l_post_school_plans

la var post_school_plans "Plans for after leaving school."

tab post_school_plans, m

*** parental aspiration ***

* check previous vars and adjust missing values

* w9
tab MiPSasEd, m
replace MiPSasEd=. if MiPSasEd<0
tab MiPSasEd, m

* w10
tab MjPSasEd, m
replace MjPSasEd=. if MjPSasEd<0
tab MjPSasEd, m

tab MiPSasEd MjPSasEd, m

* for longitudinal reasons I am most interested in w9 responses
* but I will use w10 responses in sensitivity analysis

* gen new variable to capture post-school parental aspirations with nicer labels

gen p_asp=.
replace p_asp=0 if MiPSasEd==1
replace p_asp=0 if MiPSasEd==2
replace p_asp=1 if MiPSasEd==3
replace p_asp=2 if MiPSasEd==4
replace p_asp=3 if MiPSasEd==5

la de p_asp_l 0 "secondary school qualifications" ///
              1 "further education" ///
			  2 "higher education" ///
			  3 "don't really mind"
la val p_asp p_asp_l
la var p_asp "How far parental respondent would like child to go in education."
tab p_asp, missing

* same but for w10 responses

gen p_asp_s=.
replace p_asp_s=0 if MjPSasEd==1
replace p_asp_s=0 if MjPSasEd==2
replace p_asp_s=1 if MjPSasEd==3
replace p_asp_s=2 if MjPSasEd==4
replace p_asp_s=3 if MjPSasEd==5

la de p_asp_s_l 0 "secondary school qualifications" ///
              1 "further education" ///
			  2 "higher education" ///
			  3 "don't really mind"
la val p_asp_s p_asp_s_l
la var p_asp_s "How far parental respondent would like child to go in education. (w10)"
tab p_asp_s, missing


*** NS-SEC ***

** Checking missing values properly defined.

* respondent, w1
tab DaMsec01, m
replace DaMsec01=. if DaMsec01==-2
tab DaMsec01, m

* respondent, w2
tab DbMsec01, m

* respondent, w3
tab DcMsec01, m

* respondent, w4
tab DdMsec01, m

* respondent, w5
tab DeMsec01, m

* respondent, w6
tab DfMsec01, m

* respondent, w7
tab DgMsec01, m

* respondent, w8
tab DhMsec01, m
replace DhMsec01=. if DhMsec01==-3
tab DhMsec01, m

* respondent, w9
tab DiMsec01, m
replace DiMsec01=. if DiMsec01==-3
tab DiMsec01, m

* respondent, w10
tab Djmsec01, m
replace Djmsec01=. if Djmsec01==-3
tab Djmsec01, m

* partner, w1
tab DaYsec01, m
replace DaYsec01=. if DaYsec01<0
tab DaYsec01, m

* partner, w2
tab DbYsec01, m
replace DbYsec01=. if DbYsec01<0
tab DbYsec01, m

* partner, w3
tab DcYsec01, m
replace DcYsec01=. if DcYsec01<0
tab DcYsec01, m

* partner, w4
tab DdYsec01, m
replace DdYsec01=. if DdYsec01<0
tab DdYsec01, m

* partner, w5
tab DeYsec01, m
replace DeYsec01=. if DeYsec01<0
tab DeYsec01, m

* partner, w6
tab DfYsec01, m
replace DfYsec01=. if DfYsec01<0
tab DfYsec01, m

* partner, w7
tab DgYsec01, m
replace DgYsec01=. if DgYsec01<0
tab DgYsec01, m

* partner, w8
tab DhYsec01, m
replace DhYsec01=. if DhYsec01<0
tab DhYsec01, m

* partner, w9
tab DiYsec01, m
replace DiYsec01=. if DiYsec01<0
tab DiYsec01, m

* partner, w10
tab Djysec01, m
replace Djysec01=. if Djysec01<0
tab Djysec01, m

* create new var with highest household ns-sec - prefer w9, but if missing
* take w10, w8, w7... etc. to reduce missingness

gen nssec_high=.

replace nssec_high=DiMsec01 if DiMsec01<=DiYsec01
replace nssec_high=DiYsec01 if DiYsec01<DiMsec01

tab nssec_high if sweepj==1, m

replace nssec_high=Djmsec01 if Djmsec01<=Djysec01 & missing(nssec_high)
replace nssec_high=Djysec01 if Djysec01<Djmsec01 & missing(nssec_high)

tab nssec_high if sweepj==1, m

replace nssec_high=DhMsec01 if DhMsec01<=DhYsec01 & missing(nssec_high)
replace nssec_high=DhYsec01 if DhYsec01<DhMsec01 & missing(nssec_high)

tab nssec_high if sweepj==1, m

replace nssec_high=DgMsec01 if DgMsec01<=DgYsec01 & missing(nssec_high)
replace nssec_high=DgYsec01 if DgYsec01<DgMsec01 & missing(nssec_high)

tab nssec_high if sweepj==1, m

replace nssec_high=DfMsec01 if DfMsec01<=DfYsec01 & missing(nssec_high)
replace nssec_high=DfYsec01 if DfYsec01<DfMsec01 & missing(nssec_high)

tab nssec_high if sweepj==1, m

replace nssec_high=DeMsec01 if DeMsec01<=DeYsec01 & missing(nssec_high)
replace nssec_high=DeYsec01 if DeYsec01<DeMsec01 & missing(nssec_high)

tab nssec_high if sweepj==1, m
* no more missing

la de l_nssec_high 1 "managerial and professional occupations" ///
				   2 "intermediate occupations" ///
				   3 "small employers and own account workers" ///
				   4 "lower supervisory and technical occupations" ///
				   5 "semi-routine and routine occupations" ///
				   6 "never worked"
				  
la val nssec_high l_nssec_high

la var nssec_high "Highest NS-SEC in household."

tab nssec_high, m


** uni degree vars
* respondent:
* w10
tab DjMedu01, m
replace DjMedu01=. if DjMedu01==-3
tab DjMedu01, m

*w9
tab DiMedu01, m
replace DiMedu01=. if DiMedu01==-3
tab DiMedu01, m

*w8
tab DhMedu01, m
replace DhMedu01=. if DhMedu01==-3
tab DhMedu01, m

*w7
tab DgMedu01, m
replace DgMedu01=. if DgMedu01==-3
tab DgMedu01, m

*w6
tab DfMedu01, m
replace DfMedu01=. if DfMedu01==-3
tab DfMedu01, m

*w5
tab DeMedu01, m
replace DeMedu01=. if DeMedu01==-3
tab DeMedu01, m

*w4
tab DdMedu01, m
replace DdMedu01=. if DdMedu01==-3
tab DdMedu01, m

*w3
tab DcMedu01, m
replace DcMedu01=. if DcMedu01==-3
tab DcMedu01, m

*w2
tab DbMedu01, m
replace DbMedu01=. if DbMedu01==-1
tab DbMedu01, m

*w1
tab DaMedu01, m
replace DaMedu01=. if DaMedu01==-1
tab DaMedu01, m


gen resp_degree=.
replace resp_degree=0 if DiMedu01>1 & !missing(DiMedu01)
replace resp_degree=1 if DiMedu01==1
tab resp_degree, m

replace resp_degree=0 if DhMedu01>1 & missing(resp_degree) & !missing(DhMedu01)
replace resp_degree=1 if DhMedu01==1 & missing(resp_degree)
tab resp_degree, m

replace resp_degree=0 if DgMedu01>1 & missing(resp_degree) & !missing(DgMedu01)
replace resp_degree=1 if DgMedu01==1 & missing(resp_degree)
tab resp_degree, m

replace resp_degree=0 if DfMedu01>1 & missing(resp_degree) & !missing(DfMedu01)
replace resp_degree=1 if DfMedu01==1 & missing(resp_degree)
tab resp_degree, m

replace resp_degree=0 if DeMedu01>1 & missing(resp_degree) & !missing(DeMedu01)
replace resp_degree=1 if DeMedu01==1 & missing(resp_degree)
tab resp_degree, m

replace resp_degree=0 if DdMedu01>1 & missing(resp_degree) & !missing(DdMedu01)
replace resp_degree=1 if DdMedu01==1 & missing(resp_degree)
tab resp_degree, m

replace resp_degree=0 if DcMedu01>1 & missing(resp_degree) & !missing(DcMedu01)
replace resp_degree=1 if DcMedu01==1 & missing(resp_degree)
tab resp_degree, m

replace resp_degree=0 if DbMedu01>1 & missing(resp_degree) & !missing(DbMedu01)
replace resp_degree=1 if DbMedu01==1 & missing(resp_degree)
tab resp_degree, m

replace resp_degree=0 if DaMedu01>1 & missing(resp_degree) & !missing(DaMedu01)
replace resp_degree=1 if DaMedu01==1 & missing(resp_degree)
tab resp_degree, m

la de l_resp_degree 0 "No" 1 "Yes"
la val resp_degree l_resp_degree
la var resp_degree "Does main respondent have a degree or equivalent?"
tab resp_degree, m


* partner:
* w10
tab Djyedu01, m
replace Djyedu01=. if Djyedu01<0
tab Djyedu01, m

* w9
tab DiYedu01, m
replace DiYedu01=. if DiYedu01<0
tab DiYedu01, m

* w8
tab DhYedu01, m
replace DhYedu01=. if DhYedu01<0
tab DhYedu01, m

* w7
tab DgYedu01, m
replace DgYedu01=. if DgYedu01<0
tab DgYedu01, m

* w6
tab DfYedu01, m
replace DfYedu01=. if DfYedu01<0
tab DfYedu01, m

* w5
tab DeYedu01, m
replace DeYedu01=. if DeYedu01<0
tab DeYedu01, m

*w4
tab DdYedu01, m
replace DdYedu01=. if DdYedu01<0
tab DdYedu01, m

*w3
tab DcYedu01, m
replace DcYedu01=. if DcYedu01<0
tab DcYedu01, m

*w2
tab DbYedu01, m
replace DbYedu01=. if DbYedu01<0
tab DbYedu01, m

* w1
tab DaYedu01, m
replace DaYedu01=. if DaYedu01<0
tab DaYedu01, m


gen part_degree=.
replace part_degree=0 if DiYedu01>1 & !missing(DiYedu01) 
replace part_degree=1 if DiYedu01==1
tab part_degree, m

replace part_degree=0 if DhYedu01>1 & missing(part_degree) & !missing(DhYedu01)
replace part_degree=1 if DhYedu01==1 & missing(part_degree)
tab part_degree, m

replace part_degree=0 if DgYedu01>1 & missing(part_degree) & !missing(DgYedu01)
replace part_degree=1 if DgYedu01==1 & missing(part_degree)
tab part_degree, m

replace part_degree=0 if DfYedu01>1 & missing(part_degree) & !missing(DfYedu01)
replace part_degree=1 if DfYedu01==1 & missing(part_degree)
tab part_degree, m

replace part_degree=0 if DeYedu01>1 & missing(part_degree) & !missing(DeYedu01)
replace part_degree=1 if DeYedu01==1 & missing(part_degree)
tab part_degree, m

replace part_degree=0 if DdYedu01>1 & missing(part_degree) & !missing(DdYedu01)
replace part_degree=1 if DdYedu01==1 & missing(part_degree)
tab part_degree, m

replace part_degree=0 if DcYedu01>1 & missing(part_degree) & !missing(DcYedu01)
replace part_degree=1 if DcYedu01==1 & missing(part_degree)
tab part_degree, m

replace part_degree=0 if DbYedu01>1 & missing(part_degree) & !missing(DbYedu01)
replace part_degree=1 if DbYedu01==1 & missing(part_degree)
tab part_degree, m

replace part_degree=0 if DaYedu01>1 & missing(part_degree) & !missing(DaYedu01)
replace part_degree=1 if DaYedu01==1 & missing(part_degree)
tab part_degree, m

la de l_part_degree 0 "No" 1 "Yes"
la val part_degree l_part_degree
la var part_degree "Does partner have a degree or equivalent?"
tab part_degree, m

tab resp_degree part_degree, m
display 700+447
* 1,147 households where one partner has a degree and one does not

** generate new variable for the number of parents with a degree

gen n_parent_degree=.
replace n_parent_degree=2 if resp_degree==1 & part_degree==1
replace n_parent_degree=1 if resp_degree==1 & part_degree==0
replace n_parent_degree=1 if resp_degree==0 & part_degree==1
replace n_parent_degree=0 if missing(n_parent_degree) & resp_degree==0
tab n_parent_degree, m


*** income quintile

* w1
tab DaEqv5, m
replace DaEqv5=. if DaEqv5==-1
tab DaEqv5, m

* w2
tab DbEqv5, m
replace DbEqv5=. if DbEqv5==-1
tab DbEqv5, m

* w3
tab DcEqv5, m
replace DcEqv5=. if DcEqv5==-1
tab DcEqv5, m

* w4
tab DdEqv5, m
replace DdEqv5=. if DdEqv5==-1
tab DdEqv5, m

* w5 
tab DeEqv5, m
replace DeEqv5=. if DeEqv5==-1
tab DeEqv5, m

* w6
tab DfEqv5, m
replace DfEqv5=. if DfEqv5==-1
tab DfEqv5, m

* w7
tab DgEqv5, m
replace DgEqv5=. if DgEqv5==-1
tab DgEqv5, m

* w8
tab DhEqv5, m
replace DhEqv5=. if DhEqv5==-1
tab DhEqv5, m

* w9
tab DiEqv5, m
replace DiEqv5=. if DiEqv5==-1
tab DiEqv5 if sweepj==1 & missing(Djeqv5), m

* w10
tab Djeqv5, m
replace Djeqv5=. if Djeqv5==-1
tab Djeqv5 if sweepj==1, m


* backfill (w9, w10, w8, w7, w6, etc.) to reduce missingness

gen income=.

replace income=DiEqv5 if !missing(DiEqv5)
tab income if sweepj==1, m

replace income=Djeqv5 if missing(income) & !missing(Djeqv5)
tab income if sweepj==1, m

replace income=DhEqv5 if missing(income) & !missing(DhEqv5)
tab income if sweepj==1, m

replace income=DgEqv5 if missing(income) & !missing(DgEqv5)
tab income if sweepj==1, m

replace income=DfEqv5 if missing(income) & !missing(DfEqv5)
tab income if sweepj==1, m

replace income=DeEqv5 if missing(income) & !missing(DeEqv5)
tab income if sweepj==1, m

replace income=DdEqv5 if missing(income) & !missing(DdEqv5)
tab income if sweepj==1, m

replace income=DcEqv5 if missing(income) & !missing(DcEqv5)
tab income if sweepj==1, m

replace income=DbEqv5 if missing(income) & !missing(DbEqv5)
tab income if sweepj==1, m

replace income=DaEqv5 if missing(DaEqv5) & !missing(DaEqv5)
tab income if sweepj==1, m
* 5 missing

la de l_income 1 "Bottom Quintile" 2 "2nd Quintile" 3 "3rd Quintile" ///
			   4 "4th Quintile" 5 "Top Quintile"
la val income l_income
la var income "Equivalised income - quintiles"
tab income, m


*** concerted cultivation - request meeting at school

tab MfPSpt09, missing

gen cc_school=.
replace cc_school=1 if MfPSpt09==1
replace cc_school=1 if MfPSpt09==3
replace cc_school=0 if MfPSpt09==2
replace cc_school=0 if MfPSpt09==4
tab cc_school, missing


*** concerted cultivation - parental driver of activities

tab MgAclbw7, missing

gen cc_schedule=.
replace cc_schedule=1 if MgAclbw7==1
replace cc_schedule=0 if MgAclbw7==0
tab cc_schedule, missing


*** concerted cultivation - hours per week in activities

tab MhAcStruc, missing

gen cc_acthrs=MhAcStruc
replace cc_acthrs=. if cc_acthrs<0
tab cc_acthrs, m

*** young person's sex

tab MjHGsx1, m

gen male=.
replace male=1 if MjHGsx1==1
replace male=0 if MjHGsx1==2
tab male, m

la de l_male 0 "female" 1 "male"
la val male l_male

la var male "Sex"

tab male, m




*** ethnic minority markers

* due to sample size limitations doing some collapsing of variables here
* though I know this is not ideal - future research should make an effort
* to oversample ethnic minority groups in Scotland and/or investigate these
* questions qualitatively for these groups


* ethnicity - not asked of booster sample
tab DaEthGpC, m


* home languages
tab MaZspe01, m
tab MbZspe01, m
tab McZspe01, m
tab MdZspe01, m
tab MeZspe01, m
tab MgZspe01, m
tab MiZspe01, m
tab MjZspe01, m

gen home_eng=1
replace home_eng=0 if MaZspe01==2 | MaZspe01==3 | ///
					  MbZspe01==2 | MbZspe01==3 | ///
					  McZspe01==2 | McZspe01==3 | ///
					  MdZspe01==2 | MdZspe01==3 | ///
					  MeZspe01==2 | MeZspe01==3 | ///
					  MgZspe01==2 | MgZspe01==3 | ///
					  MiZspe01==2 | MiZspe01==3 | ///
					  MjZspe01==2 | MjZspe01==3
replace home_eng=. if missing(MaZspe01) & missing(MbZspe01) & ///
					  missing(McZspe01) & missing(MdZspe01) & ///
					  missing(MeZspe01) & missing(MgZspe01) & ///
					  missing(MiZspe01) & missing(MjZspe01)
tab home_eng, m


* parental immigrant status

* respondent sweep 10
tab MjMorg01, m
replace MjMorg01=. if MjMorg01==-1
tab MjMorg01, m

* partner sweep 10
tab MjMorgP1, m
replace MjMorgP1=. if MjMorgP1==-1
tab MjMorgP1, m

tab MjMorg01 MjMorgP1, m

gen immigrant_parent=.
replace immigrant_parent=1 if MjMorg01==5 | MjMorg01==6 | ///
							  MjMorgP1==5 | MjMorg01==6
replace immigrant_parent=0 if immigrant_parent~=1 & MjMorg01~=.

la de l_immigrant_parent 0 "No" 1 "Yes"
la val immigrant_parent l_immigrant_parent
la var immigrant_parent "Does child have a parent who immigrated to the UK?"

tab immigrant_parent, m


* bringing ethnic minority variables together

gen minority=.
replace minority=0 if immigrant_parent==0 & DaEthGpC==1 & home_eng==1
replace minority=1 if immigrant_parent==1 | DaEthGpC==2 | home_eng==0
tab minority, m



*** child disability status

tab MiPSanck01, m
tab MjPSanck01, m
tab MiPSanck02, m
tab MjPSanck02, m
tab MiPSanck07, m
tab MjPSanck07, m
tab MiPSanck08, m
tab MjPSanck08, m
tab MiPSanck09, m
tab MjPSanck09, m
tab MiPSanck11, m
tab MjPSanck11, m
tab MePSan02, m
tab MfPSan02, m
tab MgPSan02, m
tab MhPSan02, m
tab MiPSan02, m
tab MjPSan02, m
tab MePSan03, m
tab MfPSan03, m
tab MgPSan03, m
tab MhPSan03, m
tab MiPSan03, m
tab MjPSan03, m
tab MePSan08, m
tab MfPSan08, m
tab MgPSan08, m
tab MhPSan08, m
tab MiPSan08, m
tab MjPSan08, m
tab MePSan09, m
tab MfPSan09, m
tab MgPSan09, m
tab MhPSan09, m
tab MiPSan09, m
tab MjPSan09, m
tab MePSan10, m
tab MfPSan10, m
tab MgPSan10, m
tab MhPSan10, m
tab MiPSan10, m
tab MjPSan10, m
tab MePSan12, m
tab MfPSan12, m
tab MgPSan12, m
tab MhPSan12, m
tab MiPSan12, m
tab MjPSan12, m
tab MiPSanck03, m
tab MjPSanck03, m
tab MiPSanck04, m
tab MjPSanck04, m
tab MiPSanck06, m
tab MjPSanck06, m
tab MiPSanck10, m
tab MjPSanck10, m
tab MePSan04, m
tab MfPSan04, m
tab MgPSan04, m
tab MhPSan04, m
tab MiPSan04, m
tab MjPSan04, m
tab MePSan05, m
tab MfPSan05, m
tab MgPSan05, m
tab MhPSan05, m
tab MiPSan05, m
tab MjPSan05, m
tab MePSan07, m
tab MfPSan07, m
tab MgPSan07, m
tab MhPSan07, m
tab MiPSan07, m
tab MjPSan07, m
tab MePSan11, m
tab MfPSan11, m
tab MgPSan11, m
tab MhPSan11, m
tab MiPSan11, m
tab MjPSan11, m

gen disability=0
replace disability=1 if MiPSanck01==1 | MjPSanck01==1 | MiPSanck02==1 | ///
						MjPSanck02==1 | MiPSanck07==1 | MjPSanck07==1 | ///
						MiPSanck08==1 | MjPSanck08==1 | MiPSanck09==1 | ///
						MjPSanck09==1 | MiPSanck11==1 | MjPSanck11==1 | ///
						MePSan02==1 | MfPSan02==1 | MgPSan02==1 | ///
						MhPSan02==1 | MiPSan02==1 | MjPSan02==1 | ///
						MePSan03==1 | MfPSan03==1 | MgPSan03==1 | ///
						MhPSan03==1 | MiPSan03==1 | MjPSan03==1 | ///
						MePSan08==1 | MfPSan08==1 | MgPSan08==1 | ///
						MhPSan08==1 | MiPSan08==1 | MjPSan08==1 | ///
						MePSan09==1 | MfPSan09==1 | MgPSan09==1 | ///
						MhPSan09==1 | MiPSan09==1 | MjPSan09==1 | ///
						MePSan10==1 | MfPSan10==1 | MgPSan10==1 | ///
						MhPSan10==1 | MiPSan10==1 | MjPSan10==1 | ///
						MePSan12==1 | MfPSan12==1 | MgPSan12==1 | ///
						MhPSan12==1 | MiPSan12==1 | MjPSan12==1 | ///
						MiPSanck03==1 | MjPSanck03==1 | MiPSanck04==1 | ///
						MjPSanck04==1 | MiPSanck06==1 | MjPSanck06==1 | ///
						MiPSanck10==1 | MjPSanck10==1 | MePSan04==1 | ///
						MfPSan04==1 | MgPSan04==1 | MhPSan04==1 | ///
						MiPSan04==1 | MjPSan04==1 | MePSan05==1 | ///
						MfPSan05==1 | MgPSan05==1 | MhPSan05==1 | ///
						MiPSan05==1 | MjPSan05==1 | MePSan07==1 | ///
						MfPSan07==1 | MgPSan07==1 | MhPSan07==1 | ///
						MiPSan07==1 | MjPSan07==1 | MePSan11==1 | ///
						MfPSan11==1 | MgPSan11==1 | MhPSan11==1 | ///
						MiPSan11==1 | MjPSan11==1
tab disability, m

la de disability_l 0 "No know disability" 1 "One or more known disabilities"
la val disability disability_l
la var disability "Does child have one or more known disabilities?"
tab disability, m



*** birth mother's age

tab Djhgmag5, m
replace Djhgmag5=. if Djhgmag5<0
tab Djhgmag5 if sweepj==1, m

* 294 missing - backfill where possible

* sweep 1
tab DaHGmag5, m
replace DaHGmag5=. if DaHGmag5==-3
tab DaHGmag5, m

* sweep 2
tab DbHGmag5, m

* sweep 3
tab DcHGmag5, m
replace DcHGmag5=. if DcHGmag5==-3
tab DcHGmag5, m

* sweep 4
tab DdHGmag5, m
replace DdHGmag5=. if DdHGmag5==-3
tab DdHGmag5, m

* sweep 5
tab DeHGmag5, m
replace DeHGmag5=. if DeHGmag5==-3
tab DeHGmag5, m

* sweep 6
tab DfHGmag5, m
replace DfHGmag5=. if DfHGmag5==-3
tab DfHGmag5, m

* sweep 7
tab DgHGmag5, m
replace DgHGmag5=. if DgHGmag5==-3
tab DgHGmag5, m

* sweep 8
tab DhHGmag5, m
replace DhHGmag5=. if DhHGmag5==-3
tab DhHGmag5, m

* sweep 9
tab DiHGmag5, m
replace DiHGmag5=. if DiHGmag5==-3
tab DiHGmag5, m

* creating new var

gen younger_mother=.

replace younger_mother=0 if Djhgmag5==3 | Djhgmag5==4
replace younger_mother=1 if Djhgmag5<3
tab younger_mother if sweepj==1, m

replace younger_mother=0 if DiHGmag5==3 | DiHGmag5==4
replace younger_mother=1 if DiHGmag5<3
tab younger_mother if sweepj==1, m

replace younger_mother=0 if DhHGmag5==3 | DhHGmag5==4
replace younger_mother=1 if DhHGmag5<3
tab younger_mother if sweepj==1, m

replace younger_mother=0 if DgHGmag5==3 | DgHGmag5==4
replace younger_mother=1 if DgHGmag5<3
tab younger_mother if sweepj==1, m

replace younger_mother=0 if DfHGmag5==3 | DfHGmag5==4
replace younger_mother=1 if DfHGmag5<3
tab younger_mother if sweepj==1, m

replace younger_mother=0 if DeHGmag5==3 | DeHGmag5==4
replace younger_mother=1 if DeHGmag5<3
tab younger_mother if sweepj==1, m
* no more missing



*** birth order

tab DaHGbord if sweepj==1, m
tab DbHGbord if sweepj==1, m
tab DcHGbord if sweepj==1, m
tab DdHGbord if sweepj==1, m
tab DeHGbord if sweepj==1, m
tab DfHGbord if sweepj==1, m
tab DgHGbord if sweepj==1, m
tab DhHGbord if sweepj==1, m
tab DiHgbord if sweepj==1, m

* backfilling to reduce missingness
gen first_born=.
replace first_born=1 if DiHgbord==1 & !missing(DiHgbord) & missing(first_born)
replace first_born=0 if DiHgbord>1 & !missing(DiHgbord) & missing(first_born)
tab first_born if sweepj==1, m

replace first_born=1 if DhHGbord==1 & !missing(DhHGbord) & missing(first_born)
replace first_born=0 if DhHGbord>1 & !missing(DhHGbord) & missing(first_born)
tab first_born if sweepj==1, m

replace first_born=1 if DgHGbord==1 & !missing(DgHGbord) & missing(first_born)
replace first_born=0 if DgHGbord>1 & !missing(DgHGbord) & missing(first_born)
tab first_born if sweepj==1, m

replace first_born=1 if DfHGbord==1 & !missing(DfHGbord) & missing(first_born)
replace first_born=0 if DfHGbord>1 & !missing(DfHGbord) & missing(first_born)
tab first_born if sweepj==1, m

replace first_born=1 if DeHGbord==1 & !missing(DeHGbord) & missing(first_born)
replace first_born=0 if DeHGbord>1 & !missing(DeHGbord) & missing(first_born)
tab first_born if sweepj==1, m
* no missing values


*** household type

tab DcHGrsp04, m
tab DdHGrsp04, m
tab DeHGrsp04, m
tab DfHGrsp04, m
tab DgHGrsp04, m
tab DhHGrsp04, m
tab DiHGrsp04, m
tab Djhgrsp04, m


gen singleparent=.

replace singleparent=1 if DiHGrsp04==0
replace singleparent=0 if DiHGrsp04==1 & missing(singleparent)
tab singleparent if sweepj==1, m

replace singleparent=1 if Djhgrsp04==0
replace singleparent=0 if Djhgrsp04==1 & missing(singleparent)
tab singleparent if sweepj==1, m

replace singleparent=1 if DhHGrsp04==0
replace singleparent=0 if DhHGrsp04==1 & missing(singleparent)
tab singleparent if sweepj==1, m

replace singleparent=1 if DgHGrsp04==0
replace singleparent=0 if DgHGrsp04==1 & missing(singleparent)
tab singleparent if sweepj==1, m

replace singleparent=1 if DfHGrsp04==0
replace singleparent=0 if DfHGrsp04==1 & missing(singleparent)
tab singleparent if sweepj==1, m

replace singleparent=1 if DeHGrsp04==0
replace singleparent=0 if DeHGrsp04==1 & missing(singleparent)
tab singleparent if sweepj==1, m
* no more missing


*** listening comprehension standard score (proxy for child ability)


tab DiLCStSc, missing

gen ability=DiLCStSc
replace ability=. if ability<0
tab ability, missing



*** urban/rural


tab ALaURin2, m
tab ALbURin2, m
tab DcURind2, m
tab ALdURin2, m
tab ALeURin2, m
tab ALfURin2, m
tab ALgURin2, m
tab ALhURin2, m

tab ALirural, m
tab ALjrural, m


* meanings of categories: https://www.gov.scot/publications/scottish-government-urban-rural-classification-2020/pages/2/

* make binary rural/not rural to match with waves 9 and 10
* not rural = 1-4, rural = 5-6
* backfill to reduce missingness: w9, w10, w8, w7, etc.

gen urban=.
replace urban=0 if ALirural==2 & missing(urban)
replace urban=1 if ALirural==1 & missing(urban)
tab urban if sweepj==1, m

replace urban=0 if ALjrural==2 & missing(urban)
replace urban=1 if ALjrural==1 & missing(urban)
tab urban if sweepj==1, m

replace urban=0 if ALhURin2>4 & missing(urban)
replace urban=1 if ALhURin2<5 & missing(urban)
tab urban if sweepj==1, m
* no more missing

*** Save as new dataset with only vars of interest

keep id post_school_plans p_asp p_asp_s nssec_high n_parent_degree income ///
	 cc_school cc_schedule cc_acthrs male minority disability ///
	 younger_mother first_born singleparent ability urban ///
	 Djwtchd2a Djstrata ///
	 sweepa sweepb sweepc sweepd sweepe sweepf sweepg sweeph sweepi sweepj
	 
numlabel _all, add

save "$data_clean/gus_parental_influence_modelling.dta", replace

********************************************************************************
********************************************************************************

**# Start from here for analysis

**************************
* Organising my session. *
**************************

clear all
macro drop _all
set more off

** Set main directory path.

* This should make it easier for others to replicate this do-file: simply
* replace the pathname with where you would like to save folders and files in
* this session.

* Note that on Mac machines the back slashes ('\') might need to be replaced with
* forward slashes ('/') throughout this do-file.

global directory "M:\01 PhD\02 parental influence paper"

cd "$global"


** Set directories as global paths.

global do "$directory\do_files"
global data_raw "$directory\data_raw"
global data_clean "$directory\data_clean"
global logs "$directory\logs"
global graphs "$directory\graphs"
global books "$directory\codebooks"
global temp "$directory\temp"


** Close any existing log files.

capture log close


** Open a new plain text log file.

log using "$logs\parental_influence_paper_v2", replace text

use "$data_clean\gus_parental_influence_modelling.dta", clear

svyset id [pweight = Djwtchd2a], strata(Djstrata)

codebook, compact


*** Running some weighted descriptives

** Univariate descriptives on all variables

dtable, svy factor(post_school_plans p_asp ///
			nssec_high n_parent_degree income ///
			cc_school cc_schedule ///
			male minority disability ///
			younger_mother first_born singleparent ///
			urban) continuous(ability cc_acthrs) ///
			export("$temp\weighted_descriptives.docx", replace)
			
histogram cc_acthrs, bin(35) percent xscale(range(0, 35)) ///
	title("Histogram of time young person spends in structured activities") ///
	ytitle("Percent of sample (%)") ///
	xtitle("Number of hours per week young person spends in structured activities") ///
	saving("$graphs\histogram_of_cc_acthrs", replace)
	
histogram ability, bin(30) percent xscale(range(0, 132)) ///
	title("Histogram of young person's Listening Comprehension Standard Score") ///
	ytitle("Percent of sample (%)") ///
	xtitle("Listening Comprehension Standardised Score") ///
	saving("$graphs\histogram_of_ability", replace)
			
** Univariate descriptives on all variables by gender

dtable, svy by(male) ///
			factor(post_school_plans p_asp ///
			nssec_high n_parent_degree income ///
			cc_school cc_schedule ///
			minority disability ///
			younger_mother first_born singleparent ///
			urban) continuous(ability cc_acthrs) ///
			export("$temp\weighted_descriptives_by_male.docx", replace)

histogram cc_acthrs, by(male) bin(35) percent xscale(range(0, 35)) ///
	title("Histogram of time young person spends in structured activities") ///
	ytitle("Percent of sample (%)") ///
	xtitle("Number of hours per week young person spends in structured activities")
	
histogram ability, by(male) bin(30) percent xscale(range(0, 132)) ///
	title("Histogram of young person's Listening Comprehension Standard Score") ///
	ytitle("Percent of sample (%)") ///
	xtitle("Listening Comprehension Standardised Score")
	
** Univariate descriptives on all variables by nssec_high

dtable, svy by(nssec_high) ///
			factor(post_school_plans p_asp ///
			n_parent_degree income ///
			cc_school cc_schedule ///
			male minority disability ///
			younger_mother first_born singleparent ///
			urban) continuous(ability cc_acthrs) ///
			export("$temp\weighted_descriptives_by_nssec_high.docx", replace)

histogram cc_acthrs, by(nssec_high) bin(35) percent xscale(range(0, 35)) ///
	title("Histogram of time young person spends in structured activities") ///
	ytitle("Percent of sample (%)") ///
	xtitle("Number of hours per week young person spends in structured activities")
	
histogram ability, by(nssec_high) bin(30) percent xscale(range(0, 132)) ///
	title("Histogram of young person's Listening Comprehension Standard Score") ///
	ytitle("Percent of sample (%)") ///
	xtitle("Listening Comprehension Standardised Score")
	
** Univariate descriptives on all variables by n_parent_degree

dtable, svy by(n_parent_degree) ///
			factor(post_school_plans p_asp ///
			nssec_high income ///
			cc_school cc_schedule ///
			male minority disability ///
			younger_mother first_born singleparent ///
			urban) continuous(ability cc_acthrs) ///
			export("$temp\weighted_descriptives_by_n_parent_degree.docx", replace)
			
histogram cc_acthrs, by(n_parent_degree) bin(35) percent xscale(range(0, 35)) ///
	title("Histogram of time young person spends in structured activities") ///
	ytitle("Percent of sample (%)") ///
	xtitle("Number of hours per week young person spends in structured activities")
	
histogram ability, by(n_parent_degree) bin(30) percent xscale(range(0, 132)) ///
	title("Histogram of young person's Listening Comprehension Standard Score") ///
	ytitle("Percent of sample (%)") ///
	xtitle("Listening Comprehension Standardised Score")		
	
** Univariate descriptives on all variables by income

dtable, svy by(income) ///
			factor(post_school_plans p_asp ///
			nssec_high n_parent_degree ///
			cc_school cc_schedule ///
			male minority disability ///
			younger_mother first_born singleparent ///
			urban) continuous(ability cc_acthrs) ///
			export("$temp\weighted_descriptives_by_income.docx", replace)

histogram cc_acthrs, by(income) bin(35) percent xscale(range(0, 35)) ///
	title("Histogram of time young person spends in structured activities") ///
	ytitle("Percent of sample (%)") ///
	xtitle("Number of hours per week young person spends in structured activities")
	
histogram ability, by(income) bin(30) percent xscale(range(0, 132)) ///
	title("Histogram of young person's Listening Comprehension Standard Score") ///
	ytitle("Percent of sample (%)") ///
	xtitle("Listening Comprehension Standardised Score")	
	
** Univariate descriptives on all variables by p_asp

dtable, svy by(p_asp) ///
			factor(post_school_plans ///
			nssec_high n_parent_degree income ///
			cc_school cc_schedule ///
			male minority disability ///
			younger_mother first_born singleparent ///
			urban) continuous(ability cc_acthrs) ///
			export("$temp\weighted_descriptives_by_p_asp.docx", replace)

histogram cc_acthrs, by(p_asp) bin(35) percent xscale(range(0, 35)) ///
	title("Histogram of time young person spends in structured activities") ///
	ytitle("Percent of sample (%)") ///
	xtitle("Number of hours per week young person spends in structured activities")
	
histogram ability, by(p_asp) bin(30) percent xscale(range(0, 132)) ///
	title("Histogram of young person's Listening Comprehension Standard Score") ///
	ytitle("Percent of sample (%)") ///
	xtitle("Listening Comprehension Standardised Score")	
	
** Univariate descriptives on all variables by post_school_plans

* factor variables
dtable, svy by(post_school_plans) ///
			factor(p_asp ///
			nssec_high n_parent_degree income ///
			cc_school cc_schedule ///
			male minority disability ///
			younger_mother first_born singleparent urban) ///
			export("$temp\weighted_descriptives_by_post_school_plans.docx", replace)
	
histogram cc_acthrs, by(post_school_plans) bin(35) percent xscale(range(0, 35)) ///
	title("Histogram of time young person spends in structured activities") ///
	ytitle("Percent of sample (%)") ///
	xtitle("Number of hours per week young person spends in structured activities")
	
histogram ability, by(post_school_plans) bin(30) percent xscale(range(0, 132)) ///
	title("Histogram of young person's Listening Comprehension Standard Score") ///
	ytitle("Percent of sample (%)") ///
	xtitle("Listening Comprehension Standardised Score")	
			
*** Unweighted correlations between all variables - significance

tab post_school_plans p_asp, chi2 // sig
tab post_school_plans nssec_high, chi2 // sig
tab post_school_plans n_parent_degree, chi2 // sig
tab post_school_plans income, chi2 // sig
tab post_school_plans cc_school, chi2 // not sig
tab post_school_plans cc_schedule, chi2 // sig
anova cc_acthrs post_school_plans // sig
tab post_school_plans male, chi2 // sig
tab post_school_plans minority, chi2 // sig
tab post_school_plans disability, chi2 // sig
tab post_school_plans younger_mother, chi2 // sig
tab post_school_plans first_born, chi2 // not sig
tab post_school_plans singleparent, chi2 // sig
anova ability post_school_plans // sig
tab post_school_plans urban, chi2 // sig

tab p_asp nssec_high, chi2 // sig
tab p_asp n_parent_degree, chi2 // sig
tab p_asp income, chi2 // sig
tab p_asp cc_school, chi2 // not sig
tab p_asp cc_schedule, chi2 // sig
anova cc_acthrs p_asp // sig
tab p_asp male, chi2 // sig
tab p_asp minority, chi2 // sig
tab p_asp disability, chi2 // sig
tab p_asp younger_mother, chi2 // sig
tab p_asp first_born, chi2 // sig -- interesting!!!
tab p_asp singleparent, chi2 // sig
anova ability p_asp // sig
tab p_asp urban, chi2 // sig

tab nssec_high n_parent_degree, chi2 // sig
tab nssec_high income, chi2 // sig
tab nssec_high cc_school, chi2 // not sig
tab nssec_high cc_schedule, chi2 // sig
anova cc_acthrs nssec_high // sig
tab nssec_high male, chi2 // not sig
tab nssec_high minority, chi2 // sig
tab nssec_high disability, chi2 // sig
tab nssec_high younger_mother, chi2 // sig
tab nssec_high first_born, chi2 // sig
tab nssec_high singleparent, chi2 // sig
anova ability nssec_high // sig
tab nssec_high urban, chi2 // not sig

tab n_parent_degree income, chi2 // sig
tab n_parent_degree cc_school, chi2 // sig
tab n_parent_degree cc_schedule, chi2 // sig
anova cc_acthrs n_parent_degree // sig
tab n_parent_degree male, chi2 // not sig
tab n_parent_degree minority, chi2 // sig
tab n_parent_degree disability, chi2 // not sig
tab n_parent_degree younger_mother, chi2 // sig
tab n_parent_degree first_born, chi2 // not sig
tab n_parent_degree singleparent, chi2 // sig
anova ability n_parent_degree // sig
tab n_parent_degree urban, chi2 // sig

tab income cc_school, chi2 // not sig
tab income cc_schedule, chi2 // sig
anova cc_acthrs income // sig
tab income male, chi2 // not sig
tab income minority, chi2 // sig
tab income disability, chi2 // sig
tab income younger_mother, chi2 // sig
tab income first_born, chi2 // sig
tab income singleparent, chi2 // sig
anova ability income // sig
tab income urban, chi2 // sig

tab cc_school cc_schedule, chi2 // not sig
anova cc_acthrs cc_school // not sig
tab cc_school male, chi2 // not sig
tab cc_school minority, chi2 // not sig
tab cc_school disability, chi2 // sig
tab cc_school younger_mother, chi2 // not sig
tab cc_school first_born, chi2 // sig
tab cc_school singleparent, chi2 // not sig
anova ability cc_school // sig
tab cc_school urban, chi2 // not sig

anova cc_acthrs cc_schedule // not sig
tab cc_schedule male, chi2 // not sig
tab cc_schedule minority, chi2 // not sig
tab cc_schedule disability, chi2 // not sig
tab cc_schedule younger_mother, chi2 // not sig
tab cc_schedule first_born, chi2 // not sig
tab cc_schedule singleparent, chi2 // not sig
anova ability cc_schedule // sig
tab cc_schedule urban, chi2 // not sig

anova cc_acthrs male // not sig
anova cc_acthrs minority // not sig
anova cc_acthrs disability // sig
anova cc_acthrs younger_mother // sig
anova cc_acthrs first_born // not sig
anova cc_acthrs singleparent // sig
pwcorr cc_acthrs ability, sig // sig
anova cc_acthrs urban // not sig

tab male minority, chi2 // not sig
tab male disability, chi2 // sig
tab male younger_mother, chi2 // sig
tab male first_born, chi2 // not sig
tab male singleparent, chi2 // not sig
anova ability male // sig
tab male urban, chi2 // not sig

tab minority disability, chi2 // sig
tab minority younger_mother, chi2 // sig
tab minority first_born, chi2 // not sig
tab minority singleparent, chi2 // not sig
anova ability minority // sig
tab minority urban, chi2 // sig

tab disability younger_mother, chi2 // sig
tab disability first_born, chi2 // not sig
tab disability singleparent, chi2 // sig
anova ability disability // sig
tab disability urban, chi2 // sig

tab younger_mother first_born, chi2 // sig
tab younger_mother singleparent, chi2 // sig
anova ability younger_mother // sig
tab younger_mother urban, chi2 // not sig

tab first_born singleparent, chi2 // sig
anova ability first_born // sig
tab first_born urban, chi2 // not sig

anova ability singleparent // sig
tab singleparent urban, chi2 // sig

anova ability urban // sig

*** Unweighted correlations between all variables - strength
/*
Cramers V interpretation:
0.00-0.10: negligible
0.10-0.20: weak
0.20-0.40: moderate
0.40-0.60: relatively strong
0.60-0.80: strong
0.80-1.00: very strong
*/

tab post_school_plans nssec_high, V // weak
tab post_school_plans n_parent_degree, V // weak
tab post_school_plans income, V // weak
tab post_school_plans p_asp, V // moderate
tab post_school_plans cc_schedule, V // negligible
tab post_school_plans male, V // moderate
tab post_school_plans minority, V // weak
tab post_school_plans disability, V // weak
tab post_school_plans younger_mother, V // weak
tab post_school_plans singleparent, V // weak
tab post_school_plans urban, V // negligible

tab nssec_high n_parent_degree, V // moderate
tab nssec_high income, V // moderate
tab nssec_high p_asp, V // weak
tab nssec_high cc_school, V // negligible
tab nssec_high cc_schedule, V // negligible
tab nssec_high minority, V // weak
tab nssec_high disability, V // weak
tab nssec_high younger_mother, V // moderate
tab nssec_high first_born, V // negligible
tab nssec_high singleparent, V // moderate

tab n_parent_degree income, V // moderate
tab n_parent_degree p_asp, V // weak
tab n_parent_degree cc_school, V // negligible
tab n_parent_degree cc_schedule, V // negligible
tab n_parent_degree minority, V // negligible
tab n_parent_degree younger_mother, V // moderate
tab n_parent_degree singleparent, V // moderate
tab n_parent_degree urban, V // negligible

tab income p_asp, V // weak
tab income cc_schedule, V // negligible
tab income minority, V // weak
tab income disability, V // weak
tab income younger_mother, V // moderate
tab income first_born, V // weak
tab income singleparent, V // relatively strong
tab income urban, V // negligible

tab p_asp cc_schedule, V // negligible
tab p_asp male, V // weak
tab p_asp minority, V // negligible
tab p_asp disability, V // moderate
tab p_asp younger_mother, V // weak
tab p_asp first_born, V // weak
tab p_asp singleparent, V // negligible
tab p_asp urban, V // negligible

tab cc_school disability, V // weak
tab cc_school first_born, V // negligible

tab male disability, V // weak
tab male younger_mother, V // negligible
tab male first_born, V // negligible

tab minority disability, V // negligible
tab minority younger_mother, V // negligible
tab minority urban, V // weak

tab disability younger_mother, V // negligible
tab disability singleparent, V // weak
tab disability urban, V // weak

tab younger_mother first_born, V // weak
tab younger_mother singleparent, V // weak

tab first_born singleparent, V // negligible
tab first_born urban, V // negligible

tab singleparent urban, V // negligible

/*
Eta interpretation:
0.00-0.10: negligible
0.10-0.24: small association
0.24-0.37: medium association
0.37-1.00: large association
*/ 

anova cc_acthrs post_school_plans
display sqrt(e(r2)) // small

anova cc_acthrs nssec_high
display sqrt(e(r2)) // medium

anova cc_acthrs n_parent_degree
display sqrt(e(r2)) // medium

anova cc_acthrs income
display sqrt(e(r2)) // medium

anova cc_acthrs p_asp
display sqrt(e(r2)) // small

anova cc_acthrs disability
display sqrt(e(r2)) // small

anova cc_acthrs younger_mother
display sqrt(e(r2)) // small

anova cc_acthrs singleparent
display sqrt(e(r2)) // small

anova ability post_school_plans
display sqrt(e(r2)) // small

anova ability nssec_high 
display sqrt(e(r2)) // medium

anova ability n_parent_degree
display sqrt(e(r2)) // medium

anova ability income
display sqrt(e(r2)) // medium

anova ability p_asp
display sqrt(e(r2)) // small

anova ability cc_school 
display sqrt(e(r2)) // negligible

anova ability cc_schedule
display sqrt(e(r2)) // negligible

anova ability male
display sqrt(e(r2)) // negligible

anova ability minority
display sqrt(e(r2)) // small

anova ability disability
display sqrt(e(r2)) // small

anova ability younger_mother
display sqrt(e(r2)) // small

anova ability first_born
display sqrt(e(r2)) // negligible

anova ability singleparent
display sqrt(e(r2)) // small

anova ability urban
display sqrt(e(r2)) // small

/*
Pearson's correlation interpretation:
0.00-0.20: very weak
0.20-0.40: weak
0.40-0.60: moderate
0.60-0.80: strong
0.80-1.00: very strong
*/ 

pwcorr cc_acthrs ability, sig star(0.05)


** Bivariate relationships to look at in more depth

svy: tab post_school_plans nssec_high, col row // weak
svy: tab post_school_plans n_parent_degree, col row // weak
svy: tab post_school_plans income, col row // weak
svy: tab p_asp nssec_high, col row // weak
svy: tab p_asp n_parent_degree, col row // weak
svy: tab p_asp income, col row // weak
svy: tab post_school_plans p_asp, col row // moderate

tab p_asp
tab post_school_plans

* parent aspires to N4s/N5s/Hs/AHs
svy: tab post_school_plans if p_asp==0

* parent aspires to FE
svy: tab post_school_plans if p_asp==1

* parent aspires to HE
svy: tab post_school_plans if p_asp==2

* parent doesn't mind
svy: tab post_school_plans if p_asp==3




**# model 1: demographics + SES **

svy: mlogit post_school_plans ///
            i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born ib0.singleparent ///
		    ib1.urban ///
			ability, rr
est store mlogit1
esttab mlogit1 using "$temp\gus_w10_post_school_aspirationsm1.rtf", replace se(2) b(2) nogaps stats(N r2) wide eform star(* 0.05 ** 0.01 *** 0.001)

** goodness of fit for model 1
mlogit post_school_plans ///
            i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born ib0.singleparent ///
		    ib1.urban ///
			ability, rr
fitstat

** model 2: demographics + SES + parental aspiration **

svy: mlogit post_school_plans ///
            ib2.p_asp  i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born ib0.singleparent ///
		    ib1.urban ///
			ability, rr
est store mlogit2
esttab mlogit2 using "$temp\gus_w10_post_school_aspirationsm2.rtf", replace se(2) nogaps b(2) stats(N r2) wide eform level(95) star(* 0.05 ** 0.01 *** 0.001)

** goodness of fit for model 2
mlogit post_school_plans ///
            ib2.p_asp  i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born ib0.singleparent ///
		    ib1.urban ///
			ability, rr
fitstat

** model 3: demographics + SES + concerted cultivation **

svy: mlogit post_school_plans ///
            i.cc_school i.cc_schedule cc_acthrs ///
			i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born ib0.singleparent ///
		    ib1.urban ///
			ability, rr
est store mlogit3
esttab mlogit3 using "$temp\gus_w10_post_school_aspirationsm3.rtf", replace se(2) nogaps b(2) stats(N r2) wide eform level(95) star(* 0.05 ** 0.01 *** 0.001)

** goodness of fit for model 3
mlogit post_school_plans ///
            i.cc_school i.cc_schedule cc_acthrs ///
			i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born ib0.singleparent ///
		    ib1.urban ///
			ability, rr
fitstat

**# Model 2 marginsplot

la de p_asp_l3 0 "N4s/N5s/Hs/AHs" 1 "Further Education" 2 "Higher Education" 3 "Don't really mind"
la val p_asp p_asp_l3


* parental aspiration
set scheme stmono1
graph set window fontface "Crimson Pro"
svy: mlogit post_school_plans ///
            ib2.p_asp  i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born ib0.singleparent ///
		    ib1.urban ///
			ability, rr
	 margins ib2.p_asp	 
	 mplotoffset, offset(0.1) ///
				  recast(scatter) ///
				  ylab(, nogrid) xlab(, nogrid) ///
				  xscale(range(-0.5 3.5) extend) ///
				  plot1opts(msymbol(O) msize(medium) dcol("none")) ///
				  plot2opts(msymbol(D) msize(medium) dcol("none")) ///
				  plot3opts(msymbol(T) msize(medium) dcol("none")) ///
				  plot4opts(msymbol(S) msize(medium) dcol("none")) ///
				  plot5opts(msymbol(X) msize(medium) dcol("none")) ///
				  xtitle("Parental aspiration for their child's education", size (*1)) ///
				  xlabel(0 "Secondary School Qualifications " 1 "Further Education" 2 "Higher Education" 3 "Don't Really Mind", labsize(small)) ///
				  ytitle("Predicted probability of young person's" "post-school aspiration", size (*1)) ///
				  title("") ///  
                  legend(size(*0.8) position(6) title("Key: young person's aspiration", size(*0.85)) row(1) ///
                      order(6 "University" 7 "College" 8 "Apprenticeship" 9 "Full-time work" 10 "Not sure") region(lstyle(solid))) ///
				  note("Controlling for: highest NS-SEC in household; number of parents with a degree; household income quintile; sex of child;" ///
					   "	ethnic minority; child disability status; age of natural mother at child's birth; child's birth order; household type; rurality" ///
					   "Note: Young people could choose only one of the five categories presented as their post-school aspiration")
	 quietly graph export "$graphs\parental_aspiration.svg", replace

**

** missingness checking
tab post_school_plans
 
* model 1
tab post_school_plans if ///
		 nssec_high!=. & n_parent_degree!=. & income!=. & ///
		 male!=. & minority!=. & disability!=. & ///
		 younger_mother!=. & first_born!=. & singleparent!=. & ///
		 ability!=. & urban!=. 

* model 2
tab post_school_plans if p_asp!=. & ///
		 nssec_high!=. & n_parent_degree!=. & income!=. & ///
		 male!=. & minority!=. & disability!=. & ///
		 younger_mother!=. & first_born!=. & singleparent!=. & ///
		 ability!=. & urban!=. 
		 
* model 3
tab post_school_plans if p_asp!=. & ///
		 nssec_high!=. & n_parent_degree!=. & income!=. & ///
		 cc_school!=. & cc_schedule!=. & cc_acthrs!=. & ///
		 male!=. & minority!=. & disability!=. & ///
		 younger_mother!=. & first_born!=. & singleparent!=. & ///
		 ability!=. & urban!=.


**# Sensitivity testing

* parental aspirations were also asked in Sweep 10 - how do these compare?
tab p_asp
tab p_asp_s
tab p_asp p_asp_s, col row // look similar

* model 2 w10	

svy: mlogit post_school_plans ///
            ib2.p_asp_s  i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born ib0.singleparent ///
		    ib1.urban ///
			ability, rr
est store mlogit2
esttab mlogit2 using "$temp\gus_w10_post_school_aspirations.rtf", replace se(2) nogaps b(2) stats(N r2) wide eform level(95) star(* 0.05 ** 0.01 *** 0.001)

** goodness of fit for model 2 w10
mlogit post_school_plans ///
            ib2.p_asp_s  i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born ib0.singleparent ///
		    ib1.urban ///
			ability, rr
fitstat
		
svy: mlogit post_school_plans ///
            ib2.p_asp_s  i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born ib0.singleparent ///
		    ib1.urban ///
			ability, rr	
	 margins ib2.p_asp_s	  
	 mplotoffset, offset(0.1) ///
				  recast(scatter) ///
				  ylab(, nogrid) xlab(, nogrid) ///
				  xscale(range(-0.5 3.5) extend) ///
				  plot1opts(msymbol(O) msize(medium) dcol("none")) ///
				  plot2opts(msymbol(D) msize(medium) dcol("none")) ///
				  plot3opts(msymbol(T) msize(medium) dcol("none")) ///
				  plot4opts(msymbol(S) msize(medium) dcol("none")) ///
				  plot5opts(msymbol(X) msize(medium) dcol("none")) ///
				  xtitle("Parental aspiration for their child's education (wave 10)", size (*1)) ///
				  xlabel(0 "Secondary School Qualifications " 1 "Further Education" 2 "Higher Education" 3 "Don't Really Mind", labsize(small)) ///
				  ytitle("Predicted probability of young person's" "post-school aspiration", size (*1)) ///
				  title("") ///  
                  legend(size(*0.8) position(6) title("Key: young person's aspiration", size(*0.85)) row(1) ///
                      order(6 "University" 7 "College" 8 "Apprenticeship" 9 "Full-time work" 10 "Not sure") region(lstyle(solid))) ///
				  note("Controlling for: highest NS-SEC in household; number of parents with a degree; household income quintile; sex of child;" ///
					   "	ethnic minority; child disability status; age of natural mother at child's birth; child's birth order; household type; rurality" ///
					   "Note: Young people could choose only one of the five categories presented as their post-school aspiration")
	 quietly graph export "$graphs\parental_aspiration_sensitivity_w10.svg", replace
	 
	 
* only real notable difference: parents who aspire for their children to go to 
* further education less likely to have a child who aspires to go to uni

*** What about Model 3 without SES variables?

svy: mlogit post_school_plans ///
            i.cc_school i.cc_schedule cc_acthrs ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born ib0.singleparent ///
		    ib1.urban ///
			ability, rr
est store mlogit3
esttab mlogit3 using "$temp\gus_w10_post_school_aspirationsm3_no_ses.rtf", replace se(2) nogaps b(2) stats(N r2) wide eform level(95) star(* 0.05 ** 0.01 *** 0.001)

** goodness of fit for model 3 w/o SES
mlogit post_school_plans ///
            i.cc_school i.cc_schedule cc_acthrs ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born ib0.singleparent ///
		    ib1.urban ///
			ability, rr
fitstat

*** Stepwise addition of variables to monitor effect sizes

********************************************************************************
** model 1: demographics + SES **

svy: mlogit post_school_plans ///
            i.nssec_high, rr
est store mlogit_s1_1
esttab mlogit_s1_1 using "$temp\gus_w10_post_school_aspirationsm1_s1.rtf", replace se(2) b(2) nogaps stats(N r2) wide eform star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            i.nssec_high ib2.n_parent_degree, rr
est store mlogit_s1_2
esttab mlogit_s1_2 using "$temp\gus_w10_post_school_aspirationsm1_s2.rtf", replace se(2) b(2) nogaps stats(N r2) wide eform star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            i.nssec_high ib2.n_parent_degree ib5.income, rr
est store mlogit_s1_3
esttab mlogit_s1_3 using "$temp\gus_w10_post_school_aspirationsm1_s3.rtf", replace se(2) b(2) nogaps stats(N r2) wide eform star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male, rr
est store mlogit_s1_4
esttab mlogit_s1_4 using "$temp\gus_w10_post_school_aspirationsm1_s4.rtf", replace se(2) b(2) nogaps stats(N r2) wide eform star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority, rr
est store mlogit_s1_5
esttab mlogit_s1_5 using "$temp\gus_w10_post_school_aspirationsm1_s5.rtf", replace se(2) b(2) nogaps stats(N r2) wide eform star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability, rr
est store mlogit_s1_6
esttab mlogit_s1_6 using "$temp\gus_w10_post_school_aspirationsm1_s6.rtf", replace se(2) b(2) nogaps stats(N r2) wide eform star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother, rr
est store mlogit_s1_7
esttab mlogit_s1_7 using "$temp\gus_w10_post_school_aspirationsm1_s7.rtf", replace se(2) b(2) nogaps stats(N r2) wide eform star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born, rr
est store mlogit_s1_8
esttab mlogit_s1_8 using "$temp\gus_w10_post_school_aspirationsm1_s8.rtf", replace se(2) b(2) nogaps stats(N r2) wide eform star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born ib0.singleparent, rr
est store mlogit_s1_9
esttab mlogit_s1_9 using "$temp\gus_w10_post_school_aspirationsm1_s9.rtf", replace se(2) b(2) nogaps stats(N r2) wide eform star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born ib0.singleparent ///
		    ib1.urban, rr
est store mlogit_s1_10
esttab mlogit_s1_10 using "$temp\gus_w10_post_school_aspirationsm1_s10.rtf", replace se(2) b(2) nogaps stats(N r2) wide eform star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born ib0.singleparent ///
		    ib1.urban ///
			ability, rr
est store mlogit_s1_11
esttab mlogit_s1_11 using "$temp\gus_w10_post_school_aspirationsm1_s11.rtf", replace se(2) b(2) nogaps stats(N r2) wide eform star(* 0.05 ** 0.01 *** 0.001)

********************************************************************************
** model 2: demographics + SES + parental aspiration **

svy: mlogit post_school_plans ///
            ib2.p_asp, rr
est store mlogit2_s2_1
esttab mlogit2_s2_1 using "$temp\gus_w10_post_school_aspirationsm2_s2_1.rtf", replace se(2) nogaps b(2) stats(N r2) wide eform level(95) star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            ib2.p_asp  i.nssec_high, rr
est store mlogit2_s2_2
esttab mlogit2_s2_2 using "$temp\gus_w10_post_school_aspirationsm2_s2_2.rtf", replace se(2) nogaps b(2) stats(N r2) wide eform level(95) star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            ib2.p_asp  i.nssec_high ib2.n_parent_degree, rr
est store mlogit2_s2_3
esttab mlogit2_s2_3 using "$temp\gus_w10_post_school_aspirationsm2_s2_3.rtf", replace se(2) nogaps b(2) stats(N r2) wide eform level(95) star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            ib2.p_asp  i.nssec_high ib2.n_parent_degree ib5.income, rr
est store mlogit2_s2_4
esttab mlogit2_s2_4 using "$temp\gus_w10_post_school_aspirationsm2_s2_4.rtf", replace se(2) nogaps b(2) stats(N r2) wide eform level(95) star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            ib2.p_asp  i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male, rr
est store mlogit2_s2_5
esttab mlogit2_s2_5 using "$temp\gus_w10_post_school_aspirationsm2_s2_5.rtf", replace se(2) nogaps b(2) stats(N r2) wide eform level(95) star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            ib2.p_asp  i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority, rr
est store mlogit2_s2_6
esttab mlogit2_s2_6 using "$temp\gus_w10_post_school_aspirationsm2_s2_6.rtf", replace se(2) nogaps b(2) stats(N r2) wide eform level(95) star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            ib2.p_asp  i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability, rr
est store mlogit2_s2_7
esttab mlogit2_s2_7 using "$temp\gus_w10_post_school_aspirationsm2_s2_7.rtf", replace se(2) nogaps b(2) stats(N r2) wide eform level(95) star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            ib2.p_asp  i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother, rr
est store mlogit2_s2_8
esttab mlogit2_s2_8 using "$temp\gus_w10_post_school_aspirationsm2_s2_8.rtf", replace se(2) nogaps b(2) stats(N r2) wide eform level(95) star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            ib2.p_asp  i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born, rr
est store mlogit2_s2_9
esttab mlogit2_s2_9 using "$temp\gus_w10_post_school_aspirationsm2_s2_9.rtf", replace se(2) nogaps b(2) stats(N r2) wide eform level(95) star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            ib2.p_asp  i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born ib0.singleparent, rr
est store mlogit2_s2_10
esttab mlogit2_s2_10 using "$temp\gus_w10_post_school_aspirationsm2_s2_10.rtf", replace se(2) nogaps b(2) stats(N r2) wide eform level(95) star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            ib2.p_asp  i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born ib0.singleparent ///
		    ib1.urban, rr
est store mlogit2_s2_11
esttab mlogit2_s2_11 using "$temp\gus_w10_post_school_aspirationsm2_s2_11.rtf", replace se(2) nogaps b(2) stats(N r2) wide eform level(95) star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            ib2.p_asp  i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born ib0.singleparent ///
		    ib1.urban ///
			ability, rr
est store mlogit2_s2_12
esttab mlogit2_s2_12 using "$temp\gus_w10_post_school_aspirationsm2_s2_12.rtf", replace se(2) nogaps b(2) stats(N r2) wide eform level(95) star(* 0.05 ** 0.01 *** 0.001)


********************************************************************************
** model 3: demographics + SES + parenting style **

svy: mlogit post_school_plans ///
            i.cc_school, rr
est store mlogit3_s3_1
esttab mlogit3_s3_1 using "$temp\gus_w10_post_school_aspirationsm3_s3_1.rtf", replace se(2) nogaps b(2) stats(N r2) wide eform level(95) star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            i.cc_school i.cc_schedule, rr
est store mlogit3_s3_2
esttab mlogit3_s3_2 using "$temp\gus_w10_post_school_aspirationsm3_s3_2.rtf", replace se(2) nogaps b(2) stats(N r2) wide eform level(95) star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            i.cc_school i.cc_schedule cc_acthrs, rr
est store mlogit3_s3_3
esttab mlogit3_s3_3 using "$temp\gus_w10_post_school_aspirationsm3_s3_3.rtf", replace se(2) nogaps b(2) stats(N r2) wide eform level(95) star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            i.cc_school i.cc_schedule cc_acthrs ///
			i.nssec_high, rr
est store mlogit3_s3_4
esttab mlogit3_s3_4 using "$temp\gus_w10_post_school_aspirationsm3_s3_4.rtf", replace se(2) nogaps b(2) stats(N r2) wide eform level(95) star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            i.cc_school i.cc_schedule cc_acthrs ///
			i.nssec_high ib2.n_parent_degree, rr
est store mlogit3_s3_5
esttab mlogit3_s3_5 using "$temp\gus_w10_post_school_aspirationsm3_s3_5.rtf", replace se(2) nogaps b(2) stats(N r2) wide eform level(95) star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            i.cc_school i.cc_schedule cc_acthrs ///
			i.nssec_high ib2.n_parent_degree ib5.income, rr
est store mlogit3_s3_6
esttab mlogit3_s3_6 using "$temp\gus_w10_post_school_aspirationsm3_s3_6.rtf", replace se(2) nogaps b(2) stats(N r2) wide eform level(95) star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            i.cc_school i.cc_schedule cc_acthrs ///
			i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male, rr
est store mlogit3_s3_7
esttab mlogit3_s3_7 using "$temp\gus_w10_post_school_aspirationsm3_s3_7.rtf", replace se(2) nogaps b(2) stats(N r2) wide eform level(95) star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            i.cc_school i.cc_schedule cc_acthrs ///
			i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority, rr
est store mlogit3_s3_8
esttab mlogit3_s3_8 using "$temp\gus_w10_post_school_aspirationsm3_s3_8.rtf", replace se(2) nogaps b(2) stats(N r2) wide eform level(95) star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            i.cc_school i.cc_schedule cc_acthrs ///
			i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability, rr
est store mlogit3_s3_9
esttab mlogit3_s3_9 using "$temp\gus_w10_post_school_aspirationsm3_s3_9.rtf", replace se(2) nogaps b(2) stats(N r2) wide eform level(95) star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            i.cc_school i.cc_schedule cc_acthrs ///
			i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother, rr
est store mlogit3_s3_10
esttab mlogit3_s3_10 using "$temp\gus_w10_post_school_aspirationsm3_s3_10.rtf", replace se(2) nogaps b(2) stats(N r2) wide eform level(95) star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            i.cc_school i.cc_schedule cc_acthrs ///
			i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born, rr
est store mlogit3_s3_11
esttab mlogit3_s3_11 using "$temp\gus_w10_post_school_aspirationsm3_s3_11.rtf", replace se(2) nogaps b(2) stats(N r2) wide eform level(95) star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            i.cc_school i.cc_schedule cc_acthrs ///
			i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born ib0.singleparent, rr
est store mlogit3_s3_12
esttab mlogit3_s3_12 using "$temp\gus_w10_post_school_aspirationsm3_s3_12.rtf", replace se(2) nogaps b(2) stats(N r2) wide eform level(95) star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            i.cc_school i.cc_schedule cc_acthrs ///
			i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born ib0.singleparent ///
		    ib1.urban, rr
est store mlogit3_s3_13
esttab mlogit3_s3_13 using "$temp\gus_w10_post_school_aspirationsm3_s3_13.rtf", replace se(2) nogaps b(2) stats(N r2) wide eform level(95) star(* 0.05 ** 0.01 *** 0.001)

svy: mlogit post_school_plans ///
            i.cc_school i.cc_schedule cc_acthrs ///
			i.nssec_high ib2.n_parent_degree ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born ib0.singleparent ///
		    ib1.urban ///
			ability, rr
est store mlogit3_s3_14
esttab mlogit3_s3_14 using "$temp\gus_w10_post_school_aspirationsm3_s3_14.rtf", replace se(2) nogaps b(2) stats(N r2) wide eform level(95) star(* 0.05 ** 0.01 *** 0.001)


**** sensitivity testing - only one measure of social class


* model 1 nssec
svy: mlogit post_school_plans ///
            i.nssec_high ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born ib0.singleparent ///
		    ib1.urban ///
			ability, rr
est store mlogit_s1_nssec
esttab mlogit_s1_nssec using "$temp\gus_w10_post_school_aspirationsm1_nssec.rtf", replace se(2) b(2) nogaps stats(N r2) wide eform star(* 0.05 ** 0.01 *** 0.001)

* model 1 parental education
svy: mlogit post_school_plans ///
            ib2.n_parent_degree ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born ib0.singleparent ///
		    ib1.urban ///
			ability, rr
est store mlogit_s1_edu
esttab mlogit_s1_edu using "$temp\gus_w10_post_school_aspirationsm1_edu.rtf", replace se(2) b(2) nogaps stats(N r2) wide eform star(* 0.05 ** 0.01 *** 0.001)

* model 1 income
svy: mlogit post_school_plans ///
            ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born ib0.singleparent ///
		    ib1.urban ///
			ability, rr
est store mlogit_s1_income
esttab mlogit_s1_income using "$temp\gus_w10_post_school_aspirationsm1_income.rtf", replace se(2) b(2) nogaps stats(N r2) wide eform star(* 0.05 ** 0.01 *** 0.001)

* model 2 nssec
svy: mlogit post_school_plans ///
            ib2.p_asp i.nssec_high ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born ib0.singleparent ///
		    ib1.urban ///
			ability, rr
est store mlogit_s2_nssec
esttab mlogit_s2_nssec using "$temp\gus_w10_post_school_aspirationsm2_nssec.rtf", replace se(2) b(2) nogaps stats(N r2) wide eform star(* 0.05 ** 0.01 *** 0.001)

* model 2 parental education
svy: mlogit post_school_plans ///
            ib2.p_asp ib2.n_parent_degree ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born ib0.singleparent ///
		    ib1.urban ///
			ability, rr
est store mlogit_s2_edu
esttab mlogit_s2_edu using "$temp\gus_w10_post_school_aspirationsm2_edu.rtf", replace se(2) b(2) nogaps stats(N r2) wide eform star(* 0.05 ** 0.01 *** 0.001)

* model 2 income
svy: mlogit post_school_plans ///
            ib2.p_asp ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born ib0.singleparent ///
		    ib1.urban ///
			ability, rr
est store mlogit_s2_income
esttab mlogit_s2_income using "$temp\gus_w10_post_school_aspirationsm2_income.rtf", replace se(2) b(2) nogaps stats(N r2) wide eform star(* 0.05 ** 0.01 *** 0.001)

* model 3 nssec
svy: mlogit post_school_plans ///
            i.cc_school i.cc_schedule cc_acthrs ///
			i.nssec_high ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born ib0.singleparent ///
		    ib1.urban ///
			ability, rr
est store mlogit_s3_nssec
esttab mlogit_s3_nssec using "$temp\gus_w10_post_school_aspirationsm3_nssec.rtf", replace se(2) b(2) nogaps stats(N r2) wide eform star(* 0.05 ** 0.01 *** 0.001)

* model 3 parental education
svy: mlogit post_school_plans ///
            i.cc_school i.cc_schedule cc_acthrs ///
			ib2.n_parent_degree ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born ib0.singleparent ///
		    ib1.urban ///
			ability, rr
est store mlogit_s3_edu
esttab mlogit_s3_edu using "$temp\gus_w10_post_school_aspirationsm3_edu.rtf", replace se(2) b(2) nogaps stats(N r2) wide eform star(* 0.05 ** 0.01 *** 0.001)

* model 3 income
svy: mlogit post_school_plans ///
            i.cc_school i.cc_schedule cc_acthrs ///
			ib5.income ///
			ib0.male ///
			ib0.minority ib0.disability ib0.younger_mother ///
			ib1.first_born ib0.singleparent ///
		    ib1.urban ///
			ability, rr
est store mlogit_s3_income
esttab mlogit_s3_income using "$temp\gus_w10_post_school_aspirationsm3_income.rtf", replace se(2) b(2) nogaps stats(N r2) wide eform star(* 0.05 ** 0.01 *** 0.001)


********************************************************************************
**# END OF DO-FILE