select * from users
select * from artists 
select * from playlist 
select * from song 
-----------EXAMPLE 1
create or replace function song_title (title varchar)
returns varchar as $$
declare s_title text;
begin

	   IF title LIKE 'W%' THEN
        s_title := 'title is found';
	  elseif title like 't%' then 
	    s_title := 'title is found';
	 else s_title :='not found';
	  end if;
	  return s_title ;
	  
end
$$ language plpgsql;

select song_title('W') 

select song_title('t') 

select song_id,title,duration,song_title(title) from song


alter table song add column song_title varchar

select * from song

update song set song_title = song_title (title)

select * from song 


------------ EXAMPLE 2

select * from playlist_tracks

CREATE OR REPLACE FUNCTION playlist_tracks (date_added date)
RETURNS varchar AS $$
DECLARE
    p_date text; 
BEGIN

    IF EXTRACT(YEAR FROM date_added) = 2025 THEN
        p_date := 'New Song';
    ELSIF EXTRACT(YEAR FROM date_added) = 2023 THEN
        p_date := 'Old Song';
    ELSE
        p_date := 'Venerable';
    END IF;
    
    RETURN p_date;

END;
$$ LANGUAGE plpgsql;

SELECT playlist_tracks('2025-01-15'::date);

SELECT playlist_tracks('2022-01-15'::date);

SELECT playlist_tracks('2023-01-15'::date);

alter table playlist_tracks add column p_date varchar;

select * from playlist_tracks

UPDATE playlist_tracks SET p_date = playlist_tracks(date_added);

select * from playlist_tracks
