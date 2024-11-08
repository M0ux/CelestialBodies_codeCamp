--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    round character varying(100) NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (7, 2018, 270, 271, 4, 2, 'Final');
INSERT INTO public.games VALUES (8, 2018, 272, 273, 2, 0, 'Third Place');
INSERT INTO public.games VALUES (9, 2018, 271, 273, 2, 1, 'Semi-Final');
INSERT INTO public.games VALUES (10, 2018, 270, 272, 1, 0, 'Semi-Final');
INSERT INTO public.games VALUES (11, 2018, 271, 274, 3, 2, 'Quarter-Final');
INSERT INTO public.games VALUES (12, 2018, 273, 275, 2, 0, 'Quarter-Final');
INSERT INTO public.games VALUES (13, 2018, 272, 276, 2, 1, 'Quarter-Final');
INSERT INTO public.games VALUES (14, 2018, 270, 277, 2, 0, 'Quarter-Final');
INSERT INTO public.games VALUES (15, 2018, 273, 278, 2, 1, 'Eighth-Final');
INSERT INTO public.games VALUES (16, 2018, 275, 279, 1, 0, 'Eighth-Final');
INSERT INTO public.games VALUES (17, 2018, 272, 280, 3, 2, 'Eighth-Final');
INSERT INTO public.games VALUES (18, 2018, 276, 281, 2, 0, 'Eighth-Final');
INSERT INTO public.games VALUES (19, 2018, 271, 282, 2, 1, 'Eighth-Final');
INSERT INTO public.games VALUES (20, 2018, 274, 283, 2, 1, 'Eighth-Final');
INSERT INTO public.games VALUES (21, 2018, 277, 284, 2, 1, 'Eighth-Final');
INSERT INTO public.games VALUES (22, 2018, 270, 285, 4, 3, 'Eighth-Final');
INSERT INTO public.games VALUES (23, 2014, 286, 285, 1, 0, 'Final');
INSERT INTO public.games VALUES (24, 2014, 287, 276, 3, 0, 'Third Place');
INSERT INTO public.games VALUES (25, 2014, 285, 287, 1, 0, 'Semi-Final');
INSERT INTO public.games VALUES (26, 2014, 286, 276, 7, 1, 'Semi-Final');
INSERT INTO public.games VALUES (27, 2014, 287, 288, 1, 0, 'Quarter-Final');
INSERT INTO public.games VALUES (28, 2014, 285, 272, 1, 0, 'Quarter-Final');
INSERT INTO public.games VALUES (29, 2014, 276, 278, 2, 1, 'Quarter-Final');
INSERT INTO public.games VALUES (30, 2014, 286, 270, 1, 0, 'Quarter-Final');
INSERT INTO public.games VALUES (31, 2014, 276, 289, 2, 1, 'Eighth-Final');
INSERT INTO public.games VALUES (32, 2014, 278, 277, 2, 0, 'Eighth-Final');
INSERT INTO public.games VALUES (33, 2014, 270, 290, 2, 0, 'Eighth-Final');
INSERT INTO public.games VALUES (34, 2014, 286, 291, 2, 1, 'Eighth-Final');
INSERT INTO public.games VALUES (35, 2014, 287, 281, 2, 1, 'Eighth-Final');
INSERT INTO public.games VALUES (36, 2014, 288, 292, 2, 1, 'Eighth-Final');
INSERT INTO public.games VALUES (37, 2014, 285, 279, 1, 0, 'Eighth-Final');
INSERT INTO public.games VALUES (38, 2014, 272, 293, 2, 1, 'Eighth-Final');


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (270, 'France');
INSERT INTO public.teams VALUES (271, 'Croatia');
INSERT INTO public.teams VALUES (272, 'Belgium');
INSERT INTO public.teams VALUES (273, 'England');
INSERT INTO public.teams VALUES (274, 'Russia');
INSERT INTO public.teams VALUES (275, 'Sweden');
INSERT INTO public.teams VALUES (276, 'Brazil');
INSERT INTO public.teams VALUES (277, 'Uruguay');
INSERT INTO public.teams VALUES (278, 'Colombia');
INSERT INTO public.teams VALUES (279, 'Switzerland');
INSERT INTO public.teams VALUES (280, 'Japan');
INSERT INTO public.teams VALUES (281, 'Mexico');
INSERT INTO public.teams VALUES (282, 'Denmark');
INSERT INTO public.teams VALUES (283, 'Spain');
INSERT INTO public.teams VALUES (284, 'Portugal');
INSERT INTO public.teams VALUES (285, 'Argentina');
INSERT INTO public.teams VALUES (286, 'Germany');
INSERT INTO public.teams VALUES (287, 'Netherlands');
INSERT INTO public.teams VALUES (288, 'Costa Rica');
INSERT INTO public.teams VALUES (289, 'Chile');
INSERT INTO public.teams VALUES (290, 'Nigeria');
INSERT INTO public.teams VALUES (291, 'Algeria');
INSERT INTO public.teams VALUES (292, 'Greece');
INSERT INTO public.teams VALUES (293, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 38, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 293, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

