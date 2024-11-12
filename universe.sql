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
    name character varying(255) NOT NULL,
    description text,
    age_in_millions_of_years numeric NOT NULL,
    galaxy_types character varying(100),
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL
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
    name character varying(255) NOT NULL,
    description text,
    planet_id integer NOT NULL,
    distance_from_earth integer,
    is_spherical boolean NOT NULL
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
    name character varying(255) NOT NULL,
    description text,
    star_id integer NOT NULL,
    planet_types character varying(100),
    distance_from_earth integer,
    is_spherical boolean NOT NULL
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    origin_id integer,
    age_in_millions_of_years numeric,
    has_life boolean
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years numeric,
    has_life boolean NOT NULL,
    distance_from_earth integer NOT NULL
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
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our galaxy', 13600, 'Spiral', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Neighbor galaxy', 10000, 'Spiral', false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Distant galaxy', 8000, 'Spiral', false, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral galaxy', 5000, 'Spiral', false, true);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 'Face-on spiral galaxy', 10000, 'Spiral', false, true);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Unusual galaxy', 11000, 'Spiral', false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Photos', 'Larger Moon of Mars', 2, 1, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Larger moon of Mars', 2, 1, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Smaller moon of Mars', 2, 1, true);
INSERT INTO public.moon VALUES (4, 'Io', 'Volcanically active moon of Jupiter', 3, 5, true);
INSERT INTO public.moon VALUES (5, 'Europa', 'Icy moon with potential for life', 3, 5, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Largest moon in the solar system', 3, 5, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Heavily cratered moon of Jupiter', 3, 5, true);
INSERT INTO public.moon VALUES (8, 'Titan', 'Largest moon of Saturn', 4, 10, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Icy moon with geysers', 4, 10, true);
INSERT INTO public.moon VALUES (10, 'Mimas', 'Moon with large crater', 4, 10, true);
INSERT INTO public.moon VALUES (11, 'Tethys', 'Large icy moon', 4, 10, true);
INSERT INTO public.moon VALUES (12, 'Dione', 'Icy moon with canyons', 4, 10, true);
INSERT INTO public.moon VALUES (13, 'Rhea', 'Second largest moon of Saturn', 4, 10, true);
INSERT INTO public.moon VALUES (14, 'Titania', 'Largest moon of Uranus', 6, 19, true);
INSERT INTO public.moon VALUES (15, 'Oberon', 'Outermost moon of Uranus', 6, 19, true);
INSERT INTO public.moon VALUES (16, 'Miranda', 'Smallest and closest moon of Uranus', 6, 19, true);
INSERT INTO public.moon VALUES (17, 'Triton', 'Largest moon of Neptune', 5, 30, true);
INSERT INTO public.moon VALUES (18, 'Nereid', 'Outer moon of Neptune', 5, 30, true);
INSERT INTO public.moon VALUES (19, 'Charon', 'Largest moon of Pluto', 7, 40, true);
INSERT INTO public.moon VALUES (20, 'Styx', 'Small moon of Pluto', 7, 40, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Our home planet', 1, 'Terrestrial', 0, true);
INSERT INTO public.planet VALUES (2, 'Mars', 'Red planet', 1, 'Terrestrial', 1, true);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Gas giant', 1, 'Gas giant', 5, true);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Ringed planet', 1, 'Gas giant', 10, true);
INSERT INTO public.planet VALUES (5, 'Neptune', 'Ice giant', 1, 'Ice giant', 30, true);
INSERT INTO public.planet VALUES (6, 'Uranus', 'Ice giant', 1, 'Ice giant', 19, true);
INSERT INTO public.planet VALUES (7, 'Proxima b', 'Closest exoplanet', 4, 'Exoplanet', 4, true);
INSERT INTO public.planet VALUES (8, 'Alpha Centauri Bb', 'Nearby exoplanet', 2, 'Exoplanet', 4, true);
INSERT INTO public.planet VALUES (9, 'HD 209458 b', 'First known transiting exoplanet', 3, 'Gas giant', 150, true);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 'Earth-like exoplanet', 3, 'Super-Earth', 600, true);
INSERT INTO public.planet VALUES (11, 'GJ 1214 b', 'Watery exoplanet', 3, 'Mini-Neptune', 40, true);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1d', 'Potentially habitable', 4, 'Terrestrial', 39, true);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Galileo', 'A space probe to Jupiter', 3, 0.2, false);
INSERT INTO public.satellite VALUES (2, 'Hubble', 'Space telescope', 1, 33, false);
INSERT INTO public.satellite VALUES (3, 'Voyager 1', 'Space probe launched to study the outer solar system', 3, 46, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our sun', 1, 4600, true, 0);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 'Nearest star system', 1, 5000, false, 4);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red supergiant star', 2, 8000, false, 642);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'Closest known star', 1, 4900, false, 4);
INSERT INTO public.star VALUES (5, 'Sirius', 'Bright star in Milky Way', 1, 3000, false, 8);
INSERT INTO public.star VALUES (6, 'Rigel', 'Bright blue supergiant', 3, 7000, false, 860);


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
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


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

