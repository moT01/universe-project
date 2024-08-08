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
-- Name: distance_from_earth; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.distance_from_earth (
);


ALTER TABLE public.distance_from_earth OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name_galaxy character varying(30),
    number_galxy integer,
    year_galxy integer,
    planet_contain integer
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name_moon character varying(30),
    description text,
    planet_id integer,
    moon_status_in_month character varying(60)
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
    name_planet character varying(30),
    age_in_millions_of_years numeric(4,2),
    is_spherical boolean,
    star_id integer
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name_star character varying(30),
    has_life boolean,
    galaxy_id integer,
    star_constellation character varying(60)
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
-- Data for Name: distance_from_earth; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Lacte', 1, 1900, NULL);
INSERT INTO public.galaxy VALUES (2, 'Lact', 2, 1902, NULL);
INSERT INTO public.galaxy VALUES (3, 'Land', 3, 1903, NULL);
INSERT INTO public.galaxy VALUES (4, 'Lait', 4, 1904, NULL);
INSERT INTO public.galaxy VALUES (5, 'Jaune', 5, 1905, NULL);
INSERT INTO public.galaxy VALUES (6, 'Leet', 6, 1906, NULL);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Nouvelle Lune', 'La nouvelle lune.', 1, NULL);
INSERT INTO public.moon VALUES (2, 'Premier C', 'Le premier croissant.', 2, NULL);
INSERT INTO public.moon VALUES (3, 'Premier Q', 'Le premier quartier.', 3, NULL);
INSERT INTO public.moon VALUES (4, 'Croissante gibbeuse', 'La lune croissante gibbeuse.', 4, NULL);
INSERT INTO public.moon VALUES (5, 'Pleine', 'La pleine lune.', 5, NULL);
INSERT INTO public.moon VALUES (6, 'gibbeuse decroissante', 'La lune gibbeuse decroissante .', 6, NULL);
INSERT INTO public.moon VALUES (7, 'Dernier Q', 'Le dernier quartier.', 7, NULL);
INSERT INTO public.moon VALUES (8, 'Dernier C', 'Le dernier croissant.', 8, NULL);
INSERT INTO public.moon VALUES (9, 'Nouvelle Lune', 'La nouvelle lune.', 9, NULL);
INSERT INTO public.moon VALUES (10, 'Nouvelle Lune', 'La nouvelle lune.', 10, NULL);
INSERT INTO public.moon VALUES (11, 'Nouvelle Lune', 'La nouvelle lune.', 11, NULL);
INSERT INTO public.moon VALUES (12, 'Nouvelle Lune', 'La nouvelle lune.', 12, NULL);
INSERT INTO public.moon VALUES (13, 'Pleine', 'La pleine lune.', 3, NULL);
INSERT INTO public.moon VALUES (14, 'Pleine', 'La pleine lune.', 4, NULL);
INSERT INTO public.moon VALUES (15, 'Pleine', 'La pleine lune.', 6, NULL);
INSERT INTO public.moon VALUES (16, 'Pleine', 'La pleine lune.', 8, NULL);
INSERT INTO public.moon VALUES (17, 'Pleine', 'La pleine lune.', 10, NULL);
INSERT INTO public.moon VALUES (18, 'Pleine', 'La pleine lune.', 12, NULL);
INSERT INTO public.moon VALUES (19, 'Pleine', 'La pleine lune.', 1, NULL);
INSERT INTO public.moon VALUES (20, 'Pleine', 'La pleine lune.', 9, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Terre', 42.60, true, 1);
INSERT INTO public.planet VALUES (2, 'Mercure', 45.99, false, 2);
INSERT INTO public.planet VALUES (3, 'Venus', 5.09, true, 3);
INSERT INTO public.planet VALUES (4, 'Terre', 65.99, true, 4);
INSERT INTO public.planet VALUES (5, 'Mars', 15.99, false, 5);
INSERT INTO public.planet VALUES (6, 'Jupiter', 48.99, true, 6);
INSERT INTO public.planet VALUES (7, 'Saturne', 35.99, false, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 55.99, true, 2);
INSERT INTO public.planet VALUES (9, 'Neptune', 5.99, false, 3);
INSERT INTO public.planet VALUES (10, 'Pluton', 25.99, true, 4);
INSERT INTO public.planet VALUES (11, 'Mercure', 78.99, false, 5);
INSERT INTO public.planet VALUES (12, 'Venus', 56.99, true, 6);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Accacia', true, 1, NULL);
INSERT INTO public.star VALUES (2, 'ALL', true, 2, NULL);
INSERT INTO public.star VALUES (3, 'Red', true, 3, NULL);
INSERT INTO public.star VALUES (4, 'Shiny', false, 4, NULL);
INSERT INTO public.star VALUES (5, 'Light', true, 5, NULL);
INSERT INTO public.star VALUES (6, 'Lower', false, 6, NULL);


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
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

