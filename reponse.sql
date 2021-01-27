--exo 11
declare
    v_titre film.titre%type;
    v_e film.entree%type;
begin
    select titre, ENTREE into v_titre, v_e from film where entree = (select max(ENTREE) from FILM);
    DBMS_OUTPUT.PUT_LINE('film le plus populaire : ' || v_titre);
    DBMS_OUTPUT.PUT_LINE('Titre : ' || v_titre);
    DBMS_OUTPUT.PUT_LINE('Nombre d entrées : ' || v_e);
end;
--exo12
declare
    v_idfilm FILM.idfilm%type;
    v_titre FILM.titre%type;
    v_note number(2);
    nb NUMBER(1);
    toto varchar(12);
begin
    v_idfilm:=:numero;
    select count(*) into nb from FILM where idfilm=v_idfilm;

    if nb<> 0 then
        select avg(note) into v_note from Notation
            where idFilm=v_idfilm;
        select titre into v_titre from FILM where IDFILM=v_idfilm;

        if v_note<=10 and v_note >=8 then DBMS_OUTPUT.PUT_LINE(v_titre||': ' || v_note || ': très bon');
        elsif v_note between 5 and 8 then DBMS_OUTPUT.PUT_LINE(v_titre||': ' || v_note || ': bon');
        else DBMS_OUTPUT.PUT_LINE(v_titre||v_note||' moyen');
        end if;

        else DBMS_OUTPUT.PUT_LINE('film inexistant');
        end if;
end;
