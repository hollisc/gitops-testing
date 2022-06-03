
command="\
	
	curl -H \"Authorization: token $(echo $TOKENB64 | base64 --decode)\" -H \"Accept: application/vnd.github.v3.raw\" -O -L https://raw.github.ibm.com/data-elite/Demo-Assets/main/Demos/Healthcare/data/patients.csv; \

	db2 connect to bludb; \

	db2 \"CREATE TABLE PATIENTS(PATIENT_ID CHAR(36) NOT NULL ,BIRTHDATE DATE , DEATHDATE DATE , SSN CHAR(36), DRIVERS_LICENSE CHAR(36), PASSPORT CHAR(36),PREFIX CHAR(6),FIRST_NAME CHAR(36),LAST_NAME CHAR(36),SUFFIX CHAR(36),MAIDEN_NAME CHAR(36),MARITAL CHAR(36),RACE CHAR(36),ETHNICITY CHAR(36),GENDER CHAR(36),BIRTHPLACE CHAR(100),ADDRESS CHAR(36),CITY CHAR(36),STATE CHAR(36),COUNTY CHAR(36),ZIP CHAR(36),LAT DOUBLE,LON DOUBLE,HEALTHCARE_EXPENSES FLOAT,HEALTHCARE_COVERAGE FLOAT, PRIMARY KEY (PATIENT_ID))\";\

	db2 import from patients.csv of del skipcount 1 insert into db2inst1.patients;\

	db2 connect reset;"

source ~/.bashrc && /bin/su -c "$command" - db2inst1
