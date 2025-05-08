SPOOL "log/create_schema_dmi_user.log"

PROMPT '>> Nettoyage écran'
HOST CLS

PROMPT '>> Connexion en tant que SYSDBA'
CONNECT system

-- Décommenter si besoin de suppression
/*
PROMPT '>> Suppression de l\'utilisateur dmi_user existant'
DROP USER dmi_user CASCADE;

PROMPT '>> Suppression des tablespaces existants'
DROP TABLESPACE DATA_DMI INCLUDING CONTENTS AND DATAFILES;
DROP TABLESPACE INDEX_DMI INCLUDING CONTENTS AND DATAFILES;
*/

PROMPT '>> Création Utilisateur dmi_user'
CREATE USER dmi_user IDENTIFIED BY dmi_user;

PROMPT '>> Affectation tbs par défaut'
ALTER USER dmi_user DEFAULT TABLESPACE DATA_DMI;
ALTER USER dmi_user QUOTA UNLIMITED ON DATA_DMI;
ALTER USER dmi_user QUOTA UNLIMITED ON INDEX_DMI;

PROMPT '>> Attribution des privilèges à dmi_user'
GRANT CONNECT TO dmi_user;
GRANT CREATE TABLE TO dmi_user;
GRANT CREATE VIEW TO dmi_user;
GRANT CREATE ANY INDEX TO dmi_user;
GRANT CREATE SYNONYM TO dmi_user;
GRANT CREATE SEQUENCE TO dmi_user;

DISCONNECT
SPOOL OFF
