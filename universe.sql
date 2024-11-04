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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: creator; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.creator (
    creator_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.creator OWNER TO freecodecamp;

--
-- Name: creator_creator_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.creator_creator_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.creator_creator_id_seq OWNER TO freecodecamp;

--
-- Name: creator_creator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.creator_creator_id_seq OWNED BY public.creator.creator_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    creator_id integer,
    name character varying(20) NOT NULL,
    distance_in_light numeric NOT NULL,
    description text,
    size integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer,
    name character varying(40) NOT NULL,
    distance_in_light numeric NOT NULL,
    description text,
    size integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    name character varying(40) NOT NULL,
    distance_in_light numeric NOT NULL,
    description text,
    populated boolean,
    population integer NOT NULL,
    has_water boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying(40) NOT NULL,
    distance_in_light numeric NOT NULL,
    description text,
    size integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: creator creator_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creator ALTER COLUMN creator_id SET DEFAULT nextval('public.creator_creator_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: creator; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.creator VALUES (1, 'God', 'Hard to describe it');
INSERT INTO public.creator VALUES (2, 'Big Bang', 'This can be described but nobody saw');
INSERT INTO public.creator VALUES (3, 'Alien', 'Hey, this is all a simulation right? Right??');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 1, 'Flower Galaxy', 350000, 'Where flowers bloom, but nobody smells. Maybe thats why it survived?', 3000);
INSERT INTO public.galaxy VALUES (2, 2, 'GalaxEye', 1983, 'Big ol eyes float around. They are very friendly, but scary none the less.', 2300);
INSERT INTO public.galaxy VALUES (3, 3, 'Freako Galaxy', 666, 'This is the place where you DONT wana mess around, seriously.', 666);
INSERT INTO public.galaxy VALUES (4, 1, 'Moonlight Serenata', 99999, 'This place is empty. I mean, is what empty means. The place where beings can be alone.', 3000);
INSERT INTO public.galaxy VALUES (5, 1, 'Familaxy', 22, 'Where beings gather and enjoy life, no matter how life is.', 0);
INSERT INTO public.galaxy VALUES (6, 2, 'Randomverse', 3000, 'Everything random!', 5000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Zorak', 3.14, 'A mysterious moon with unknown origins', 1234);
INSERT INTO public.moon VALUES (2, 2, 'Xenon', 2.71, 'A moon with a glowing surface', 567);
INSERT INTO public.moon VALUES (3, 3, 'Quasar', 1.62, 'A moon known for its rapid rotation', 890);
INSERT INTO public.moon VALUES (4, 4, 'Nebula', 4.20, 'A moon shrouded in thick clouds', 3456);
INSERT INTO public.moon VALUES (5, 5, 'Pulsar', 0.98, 'A moon with a pulsating light', 789);
INSERT INTO public.moon VALUES (6, 6, 'Vortex', 2.34, 'A moon with swirling storms', 456);
INSERT INTO public.moon VALUES (7, 7, 'Aether', 1.23, 'A moon with a thin atmosphere', 678);
INSERT INTO public.moon VALUES (8, 8, 'Blazar', 3.56, 'A moon emitting high-energy particles', 2345);
INSERT INTO public.moon VALUES (9, 9, 'Draco', 2.89, 'A moon with dragon-like terrain', 123);
INSERT INTO public.moon VALUES (10, 10, 'Eclipse', 1.11, 'A moon that frequently causes eclipses', 987);
INSERT INTO public.moon VALUES (11, 11, 'Frost', 4.56, 'A moon covered in ice', 654);
INSERT INTO public.moon VALUES (12, 12, 'Glimmer', 0.77, 'A moon that sparkles in the night sky', 321);
INSERT INTO public.moon VALUES (13, 1, 'Halo', 3.33, 'A moon with a bright halo', 876);
INSERT INTO public.moon VALUES (14, 2, 'Inferno', 2.22, 'A moon with volcanic activity', 543);
INSERT INTO public.moon VALUES (15, 3, 'Jewel', 1.44, 'A moon with gem-like formations', 210);
INSERT INTO public.moon VALUES (16, 4, 'Krypton', 4.44, 'A moon with a strong magnetic field', 987);
INSERT INTO public.moon VALUES (17, 5, 'Lunar', 0.55, 'A moon with a reflective surface', 654);
INSERT INTO public.moon VALUES (18, 6, 'Mystic', 2.22, 'A moon with mystical properties', 321);
INSERT INTO public.moon VALUES (19, 7, 'Nova', 1.99, 'A moon that shines brightly', 876);
INSERT INTO public.moon VALUES (20, 8, 'Orbit', 3.88, 'A moon with an unusual orbit', 543);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Seedz', 4500, 'Hey, pretty neat place. Everybody cooling, growing and learning.', true, 30000, true);
INSERT INTO public.planet VALUES (2, 1, 'ToadLand', 4800, 'Mushrooms everywhere, but none is alive.', false, 0, true);
INSERT INTO public.planet VALUES (3, 2, 'Visiones', 900, 'No walls, no hiding. Everyone sees everything here.', true, 50000, false);
INSERT INTO public.planet VALUES (4, 2, 'Orus', 15000, 'The oldest planet in this galaxy. They contacted humans in ancient times.', true, 3, true);
INSERT INTO public.planet VALUES (5, 3, 'SilentHills', 30000, 'Dont think daytime lasts forever.', true, 0, false);
INSERT INTO public.planet VALUES (6, 3, 'Olok', 40000, 'Nobody who got there ever returned. Soooo, no info.', true, 1, false);
INSERT INTO public.planet VALUES (7, 4, 'Jazzy Blues', 5000, 'My first and last stop when it is vacation time. Cool people, cool music and spectacular food.', true, 100000, true);
INSERT INTO public.planet VALUES (8, 4, 'Melodie', 5400, 'Burial place. So sad, but so beautiful at the same time.', false, 0, false);
INSERT INTO public.planet VALUES (9, 5, 'Love', 4000, 'Do you really need a description?', true, 5, true);
INSERT INTO public.planet VALUES (10, 5, 'Care', 4000, 'Thank God!', true, 5, true);
INSERT INTO public.planet VALUES (11, 6, 'LongLongJohnson', 100000, 'Meeeeooooow!', true, 1, true);
INSERT INTO public.planet VALUES (12, 6, 'AntonioNunes', 5000, 'Slap my tight and Im not high', true, 1, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sunflower', 3000, 'Pretty, really pretty!', 2000);
INSERT INTO public.star VALUES (2, 2, 'Sauron', 4000, 'Yeah, you shall not pass!', 300);
INSERT INTO public.star VALUES (3, 3, 'Pentagram', 666, 'Baphomet in ya face!', 666);
INSERT INTO public.star VALUES (4, 4, 'Franky', 50, 'Fly me to the moon, my dear. Oh, we already a star!', 3456);
INSERT INTO public.star VALUES (5, 5, 'Mama', 63, 'The most humble and giving star in the whole universe.', 123);
INSERT INTO public.star VALUES (6, 6, 'CPX009U8_', 409, 'Born in 409XC, is the only survivor of an legion of human-like stars', 10);


--
-- Name: creator_creator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.creator_creator_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: creator creator_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creator
    ADD CONSTRAINT creator_name_key UNIQUE (name);


--
-- Name: creator creator_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.creator
    ADD CONSTRAINT creator_pkey PRIMARY KEY (creator_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_creator_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_creator_id_fkey FOREIGN KEY (creator_id) REFERENCES public.creator(creator_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

