SPOOL "log/create_tbs_DMI.log"

PROMPT '>> Nettoyage écran'
HOST CLS

PROMPT '>> Connexion en tant que SYSDBA'
CONNECT system

PROMPT '>> Création du tablespace DATA_DMI'
CREATE TABLESPACE DATA_DMI 
    DATAFILE 'C:/Apps/oracle/oradata/PISE/DATA_DMI.dbf' SIZE 256M
    SEGMENT SPACE MANAGEMENT AUTO;

PROMPT '>> Création du tablespace INDEX_DMI'
CREATE TABLESPACE INDEX_DMI 
    DATAFILE 'C:/Apps/oracle/oradata/PISE/INDEX_DMI.dbf' SIZE 256M
    SEGMENT SPACE MANAGEMENT AUTO;

SPOOL OFF
