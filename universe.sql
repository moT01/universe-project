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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    galaxy_type character varying NOT NULL,
    distance_from_earth numeric,
    age_in_millions_of_years integer
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
    name character varying NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    planet_id integer
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
    name character varying NOT NULL,
    has_life boolean NOT NULL,
    planet_type character varying NOT NULL,
    age_in_millions_of_years integer,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    galaxy_id integer
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
-- Name: sun; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.sun (
    sun_id integer NOT NULL,
    name character varying NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    galaxy_id integer
);


ALTER TABLE public.sun OWNER TO freecodecamp;

--
-- Name: sun_sun_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.sun_sun_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sun_sun_id_seq OWNER TO freecodecamp;

--
-- Name: sun_sun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.sun_sun_id_seq OWNED BY public.sun.sun_id;


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
-- Name: sun sun_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun ALTER COLUMN sun_id SET DEFAULT nextval('public.sun_sun_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy where Earth resides', 'Spiral', 1000000, 13000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Closest spiral galaxy to the Milky Way', 'Spiral', 2530000, 12000);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'A supergiant elliptical galaxy', 'Elliptical', 55000000, 60000);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'Third-largest galaxy in the Local Group', 'Spiral', 3000000, 13000);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 'A face-on spiral galaxy', 'Spiral', 2500000, 20000);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'A ring galaxy', 'Ring', 50000000, 100000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', false, true, 4500, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', false, true, 4500, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', false, true, 4500, 2);
INSERT INTO public.moon VALUES (4, 'Ganymede', false, true, 4500, 3);
INSERT INTO public.moon VALUES (5, 'Europa', false, true, 4500, 3);
INSERT INTO public.moon VALUES (6, 'Io', false, true, 4500, 3);
INSERT INTO public.moon VALUES (7, 'Titan', false, true, 4500, 4);
INSERT INTO public.moon VALUES (8, 'Rhea', false, true, 4500, 5);
INSERT INTO public.moon VALUES (9, 'Iapetus', false, true, 4500, 5);
INSERT INTO public.moon VALUES (10, 'Triton', false, true, 4500, 6);
INSERT INTO public.moon VALUES (11, 'Titania', false, true, 4500, 7);
INSERT INTO public.moon VALUES (12, 'Oberon', false, true, 4500, 7);
INSERT INTO public.moon VALUES (13, 'Miranda', false, true, 4500, 7);
INSERT INTO public.moon VALUES (14, 'Charon', false, true, 4500, 8);
INSERT INTO public.moon VALUES (15, 'Dysnomia', false, true, 4500, 9);
INSERT INTO public.moon VALUES (16, 'Hiʻiaka', false, true, 4500, 10);
INSERT INTO public.moon VALUES (17, 'Namaka', false, true, 4500, 10);
INSERT INTO public.moon VALUES (18, 'Styx', false, true, 4500, 11);
INSERT INTO public.moon VALUES (19, 'Nix', false, true, 4500, 11);
INSERT INTO public.moon VALUES (20, 'Kerberos', false, true, 4500, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 'Terrestrial', 4500, 1);
INSERT INTO public.planet VALUES (2, 'Mars', false, 'Terrestrial', 4500, 1);
INSERT INTO public.planet VALUES (3, 'Venus', false, 'Terrestrial', 4500, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', false, 'Gas Giant', 4500, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', false, 'Gas Giant', 4500, 1);
INSERT INTO public.planet VALUES (6, 'Uranus', false, 'Ice Giant', 4500, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', false, 'Ice Giant', 4500, 1);
INSERT INTO public.planet VALUES (8, 'Mercury', false, 'Terrestrial', 4500, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', false, 'Dwarf', 4500, 1);
INSERT INTO public.planet VALUES (10, 'Eris', false, 'Dwarf', 4500, 1);
INSERT INTO public.planet VALUES (11, 'Haumea', false, 'Dwarf', 4500, 1);
INSERT INTO public.planet VALUES (12, 'Makemake', false, 'Dwarf', 4500, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', false, true, 4600, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', false, true, 8000, 1);
INSERT INTO public.star VALUES (3, 'Sirius', false, true, 250, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', false, true, 6000, 1);
INSERT INTO public.star VALUES (5, 'Vega', false, true, 455, 1);
INSERT INTO public.star VALUES (6, 'Arcturus', false, true, 725, 1);
INSERT INTO public.star VALUES (7, 'Proxima Centauri', false, true, 4500, 1);
INSERT INTO public.star VALUES (8, 'Polaris', false, true, 70, 1);
INSERT INTO public.star VALUES (9, 'Antares', false, true, 12000, 1);
INSERT INTO public.star VALUES (10, 'Rigel', false, true, 8600, 1);
INSERT INTO public.star VALUES (11, 'Aldebaran', false, true, 6600, 1);
INSERT INTO public.star VALUES (12, 'Deneb', false, true, 3200, 1);


--
-- Data for Name: sun; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.sun VALUES (1, 'Sun', false, true, 4600, 1);
INSERT INTO public.sun VALUES (2, 'Alpha Centauri A', false, true, 6000, 1);
INSERT INTO public.sun VALUES (3, 'Alpha Centauri B', false, true, 6000, 1);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: sun_sun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.sun_sun_id_seq', 3, true);


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
-- Name: sun sun_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_name_key UNIQUE (name);


--
-- Name: sun sun_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_pkey PRIMARY KEY (sun_id);


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
-- Name: sun sun_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--



