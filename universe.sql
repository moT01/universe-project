--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)n

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
    name character varying(30) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_year integer,
    distance_from_earth numeric(5,3),
    galaxy_types character varying(30),
    description text NOT NULL
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
    name character varying(30) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_year integer,
    distance_from_earth numeric(5,3),
    planet_types character varying(30),
    description text NOT NULL,
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
    name character varying(30) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_year integer,
    distance_from_earth numeric(5,3),
    planet_types character varying(30),
    description text NOT NULL,
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
-- Name: sistema_solare; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.sistema_solare (
    sistema_solare_id character varying(30) NOT NULL,
    num_pianeti integer NOT NULL,
    anni integer,
    name character varying(30)
);


ALTER TABLE public.sistema_solare OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_year integer,
    distance_from_earth numeric(5,3),
    description text NOT NULL,
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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'via lattea', true, false, 1110, 0.000, NULL, 'nostra galassia');
INSERT INTO public.galaxy VALUES (3, 'Andromeda', false, true, 10000, 0.000, 'Spiral', 'Galassia vicina');
INSERT INTO public.galaxy VALUES (4, 'Triangulum', false, true, 3000, 0.000, 'Spiral', 'Piccola galassia di spirale');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', false, true, 5000, 0.000, 'Spiral', 'Galassia a spirale con bracci ben definiti');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', false, true, 6000, 0.000, 'Spiral', 'Galassia simile a un cappello da cowboy');
INSERT INTO public.galaxy VALUES (7, 'Cartwheel', false, true, 1500, 0.000, 'Ring', 'Galassia a ruota con un grande anello');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'luna', false, true, 100, 37.000, NULL, 'LUNAA', 4);
INSERT INTO public.moon VALUES (2, 'Europa', false, true, 4500, 0.000, 'Moon', 'Una delle lune di Giove', 7);
INSERT INTO public.moon VALUES (3, 'Io', false, true, 4600, 0.000, 'Moon', 'Luna vulcanica di Giove', 7);
INSERT INTO public.moon VALUES (4, 'Ganymede', false, true, 4700, 0.000, 'Moon', 'La luna più grande del sistema solare', 7);
INSERT INTO public.moon VALUES (5, 'Callisto', false, true, 4600, 0.000, 'Moon', 'Grande luna di Giove', 7);
INSERT INTO public.moon VALUES (6, 'Titan', false, true, 4500, 0.000, 'Moon', 'Luna di Saturno', 8);
INSERT INTO public.moon VALUES (7, 'Rhea', false, true, 4600, 0.000, 'Moon', 'Luna di Saturno', 8);
INSERT INTO public.moon VALUES (8, 'Enceladus', false, true, 4700, 0.000, 'Moon', 'Luna di Saturno con geyser di acqua', 8);
INSERT INTO public.moon VALUES (9, 'Mimas', false, true, 4600, 0.000, 'Moon', 'Luna di Saturno', 8);
INSERT INTO public.moon VALUES (10, 'Triton', false, true, 4600, 0.000, 'Moon', 'Luna di Nettuno', 9);
INSERT INTO public.moon VALUES (11, 'Miranda', false, true, 4500, 0.000, 'Moon', 'Luna di Urano', 9);
INSERT INTO public.moon VALUES (12, 'Ariel', false, true, 4500, 0.000, 'Moon', 'Luna di Urano', 9);
INSERT INTO public.moon VALUES (13, 'Umbriel', false, true, 4500, 0.000, 'Moon', 'Luna di Urano', 9);
INSERT INTO public.moon VALUES (14, 'Titania', false, true, 4500, 0.000, 'Moon', 'Luna di Urano', 9);
INSERT INTO public.moon VALUES (15, 'Oberon', false, true, 4500, 0.000, 'Moon', 'Luna di Urano', 9);
INSERT INTO public.moon VALUES (16, 'Phoebe', false, true, 4500, 0.000, 'Moon', 'Luna di Saturno', 8);
INSERT INTO public.moon VALUES (17, 'Charon', false, true, 4600, 0.000, 'Moon', 'Luna di Plutone', 9);
INSERT INTO public.moon VALUES (18, 'Io II', false, true, 4500, 0.000, 'Moon', 'Luna di Giove', 7);
INSERT INTO public.moon VALUES (19, 'Ganymede II', false, true, 4500, 60.000, 'Moon', 'Luna di Giove', 7);
INSERT INTO public.moon VALUES (20, 'Titan III', false, true, 4500, 0.000, 'Moon', 'Luna di Saturno', 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'terra', true, true, 100, 37.000, NULL, 'pianeta abitato', 3);
INSERT INTO public.planet VALUES (4, 'venere', true, true, 100, 37.000, NULL, 'pianeta abitato', 4);
INSERT INTO public.planet VALUES (5, 'Mars', true, true, 4000, 0.000, 'Terrestrial', 'Pianeta rosso', 3);
INSERT INTO public.planet VALUES (6, 'Jupiter', false, true, 4600, 0.000, 'Gas Giant', 'Pianeta gigante', 3);
INSERT INTO public.planet VALUES (7, 'Saturn', false, true, 4500, 0.000, 'Gas Giant', 'Pianeta con anelli', 3);
INSERT INTO public.planet VALUES (8, 'Uranus', false, true, 4600, 0.000, 'Ice Giant', 'Pianeta ghiacciato', 3);
INSERT INTO public.planet VALUES (9, 'Neptune', false, true, 4700, 0.000, 'Ice Giant', 'Pianeta blu', 3);
INSERT INTO public.planet VALUES (10, 'Venus', true, true, 4000, 0.000, 'Terrestrial', 'Pianeta simile alla Terra', 4);
INSERT INTO public.planet VALUES (11, 'Mercury', false, true, 4500, 0.000, 'Terrestrial', 'Pianeta roccioso', 4);
INSERT INTO public.planet VALUES (12, 'Earth', true, true, 4500, 0.000, 'Terrestrial', 'Pianeta abitato', 4);
INSERT INTO public.planet VALUES (13, 'Saturnus', false, true, 4600, 0.000, 'Gas Giant', 'Pianeta ricco di anelli', 4);
INSERT INTO public.planet VALUES (14, 'Ganymede', false, true, 4500, 0.000, 'Gas Giant', 'Pianeta con giganteschi anelli', 3);


--
-- Data for Name: sistema_solare; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.sistema_solare VALUES ('Sistema Solare', 8, 0, NULL);
INSERT INTO public.sistema_solare VALUES ('Sistema Alpha Centauri', 7, 0, NULL);
INSERT INTO public.sistema_solare VALUES ('Sistema Beta Lyrae', 7, 0, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'sole', false, true, 100, 37.000, 'stella più luminosa', 2);
INSERT INTO public.star VALUES (4, 'orsa', false, true, 100, 37.000, 'stella più luminosa', 2);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', false, true, 4500, 0.000, 'Stella più vicina alla Terra', 2);
INSERT INTO public.star VALUES (6, 'Sirius', false, true, 200, 0.000, 'La stella più luminosa del cielo', 2);
INSERT INTO public.star VALUES (7, 'Alpha Centauri A', false, true, 6000, 0.000, 'Sistema stellare triplo', 2);
INSERT INTO public.star VALUES (8, 'Betelgeuse', false, true, 10000, 0.000, 'Gigante rossa', 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: sistema_solare sistema_solare_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sistema_solare
    ADD CONSTRAINT sistema_solare_name_unique UNIQUE (sistema_solare_id);


--
-- Name: sistema_solare sistema_solare_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sistema_solare
    ADD CONSTRAINT sistema_solare_pkey PRIMARY KEY (sistema_solare_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_start; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_start FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

