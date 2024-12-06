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

--
-- Name: color; Type: TYPE; Schema: public; Owner: freecodecamp
--

CREATE TYPE public.color AS ENUM (
    'Yellow',
    'Blue',
    'Red',
    'Orange',
    'White'
);


ALTER TYPE public.color OWNER TO freecodecamp;

--
-- Name: shape; Type: TYPE; Schema: public; Owner: freecodecamp
--

CREATE TYPE public.shape AS ENUM (
    'spiral',
    'irregular',
    'spheroidal',
    'elliptical'
);


ALTER TYPE public.shape OWNER TO freecodecamp;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(15) NOT NULL,
    nasa_abbrev character varying(4) NOT NULL,
    meaning text,
    brightest_star character varying(15),
    visual_mag numeric(3,2)
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    reference_number character varying(15) NOT NULL,
    dist_in_ly integer,
    is_dwarf boolean,
    shape public.shape,
    nearby_constellation character varying(15)
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
    name character varying(15) NOT NULL,
    ref_id character varying(5) NOT NULL,
    radius_km integer,
    axis_km integer,
    retrograde boolean,
    discovered integer,
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
    name character varying(10) NOT NULL,
    discovered integer,
    lm_from_earth numeric(5,2),
    approximate_radius integer,
    rotation_period_d integer,
    orbital_period_y integer,
    surface_temp_k integer,
    moons integer,
    rings boolean,
    atmosphere text,
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
    name character varying(10) NOT NULL,
    reference_id character varying(10) NOT NULL,
    distance_in_ly integer,
    nearby_constellation character varying(10),
    color public.color,
    solar_radius numeric(4,1),
    visual_magnitude numeric(4,2),
    apparent_magnitude numeric(4,2),
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Dorado', 'Dora', 'dolphinfish', 'Alpha Doradus', 3.28);
INSERT INTO public.constellation VALUES (2, 'Hydrus', 'Hydi', 'lesser water snake', 'Beta Hydri', 2.80);
INSERT INTO public.constellation VALUES (3, 'Andromeda', 'Andr', 'the chained maiden', 'Alpheratz', 2.06);
INSERT INTO public.constellation VALUES (4, 'Leo', 'Leon', 'lion', 'Regulus', 1.35);
INSERT INTO public.constellation VALUES (5, 'Centaurus', 'Cent', 'centaur', 'Alpha Centauri', -0.27);
INSERT INTO public.constellation VALUES (6, 'Ursa Minor', 'UMaj', 'great bear', 'Alioth', 1.77);
INSERT INTO public.constellation VALUES (7, 'Ursa Major', 'UMin', 'lesser bear', 'Polaris', 1.98);
INSERT INTO public.constellation VALUES (8, 'Cygnus', 'Cygn', 'swan', 'Deneb', 1.25);
INSERT INTO public.constellation VALUES (9, 'Cassiopeia', 'Cass', 'Queen Cassiopeia', 'Schedar', 2.24);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'MW 1', 27000, false, 'spiral', 'Local');
INSERT INTO public.galaxy VALUES (2, 'LMC', 'PGC 17223', 179000, true, 'irregular', 'Dorado');
INSERT INTO public.galaxy VALUES (3, 'SMC', 'PGC 3085', 210000, true, 'irregular', 'Hydra');
INSERT INTO public.galaxy VALUES (4, 'Andromeda', 'PGC 2557', 2500000, false, 'spiral', 'Andromeda');
INSERT INTO public.galaxy VALUES (5, 'Leo I', 'PGC 29488', 820000, true, 'spheroidal', 'Leo');
INSERT INTO public.galaxy VALUES (6, 'Southern Pinwheel', 'PGC 48082', 14700000, false, 'spiral', 'Hydra');
INSERT INTO public.galaxy VALUES (7, 'Ursa Minor Dwarf', 'PGC 54074', 225000, true, 'spheroidal', 'Ursa Minor');
INSERT INTO public.galaxy VALUES (8, 'Bodes', 'PGC 28630', 118000000, false, 'spiral', 'Ursa Major');
INSERT INTO public.galaxy VALUES (9, 'Cygnus A', 'PCC 63932', 760000000, false, 'elliptical', 'Cygnus');
INSERT INTO public.galaxy VALUES (10, 'Starburst', 'PGC 1305', 2500000, true, 'irregular', 'Cassiopeia');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Amalthea', 'JUP05', 84, 181400, false, 1892, 5);
INSERT INTO public.moon VALUES (2, 'Ariel', 'URA01', 579, 190900, false, 1851, 7);
INSERT INTO public.moon VALUES (3, 'Callisto', 'JUP04', 2410, 1882700, false, 1610, 5);
INSERT INTO public.moon VALUES (4, 'Charon', 'PLU01', 606, 19591, false, 1978, 9);
INSERT INTO public.moon VALUES (5, 'Deimos', 'MAR02', 6, 23460, false, 1877, 4);
INSERT INTO public.moon VALUES (6, 'Despina', 'NEP05', 78, 52526, false, 1989, 8);
INSERT INTO public.moon VALUES (7, 'Dione', 'SAT04', 561, 377420, false, 1684, 6);
INSERT INTO public.moon VALUES (8, 'Enceladus', 'SAT02', 252, 238040, false, 1789, 6);
INSERT INTO public.moon VALUES (9, 'Europa', 'JUP02', 1561, 671100, false, 1610, 5);
INSERT INTO public.moon VALUES (10, 'Ganymede', 'JUP03', 2634, 1070400, false, 1610, 5);
INSERT INTO public.moon VALUES (11, 'Hydra', 'PLU03', 28, 64698, false, 2005, 9);
INSERT INTO public.moon VALUES (12, 'Io', 'JUP01', 1822, 421800, false, 1610, 5);
INSERT INTO public.moon VALUES (13, 'Kerberos', 'PLU04', 7, 57729, false, 2011, 9);
INSERT INTO public.moon VALUES (14, 'Mimas', 'SAT01', 198, 185540, false, 1789, 6);
INSERT INTO public.moon VALUES (15, 'Miranda', 'URA05', 236, 129900, false, 1948, 7);
INSERT INTO public.moon VALUES (16, 'Moon', 'EAR01', 1738, 384399, false, 0, 3);
INSERT INTO public.moon VALUES (17, 'Naiad', 'NEP03', 30, 48224, false, 1989, 8);
INSERT INTO public.moon VALUES (18, 'Nereid', 'NEP02', 179, 5513820, false, 1949, 8);
INSERT INTO public.moon VALUES (19, 'Nix', 'PLU02', 23, 48671, false, 2005, 9);
INSERT INTO public.moon VALUES (20, 'Oberon', 'URA04', 761, 583500, false, 1787, 7);
INSERT INTO public.moon VALUES (21, 'Phobos', 'MAR01', 11, 9380, false, 1877, 4);
INSERT INTO public.moon VALUES (22, 'Rhea', 'SAT05', 764, 527070, false, 1672, 6);
INSERT INTO public.moon VALUES (23, 'Styx', 'PLU05', 6, 42393, false, 2012, 9);
INSERT INTO public.moon VALUES (24, 'Tethys', 'SAT03', 533, 294670, false, 1684, 6);
INSERT INTO public.moon VALUES (25, 'Thalassa', 'NEP04', 41, 50075, false, 1989, 8);
INSERT INTO public.moon VALUES (26, 'Titania', 'URA03', 789, 436300, false, 1787, 7);
INSERT INTO public.moon VALUES (27, 'Triton', 'NEP01', 1353, 354800, true, 1846, 8);
INSERT INTO public.moon VALUES (28, 'Umbriel', 'URA02', 585, 266000, false, 1851, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, 5.07, 2441, 59, 0, 440, 0, false, 'He, Na+', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0, 2.33, 6052, 243, 1, 730, 0, false, 'CO2, N2, SO2', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 0, 0.00, 6378, 1, 1, 287, 1, false, 'N2, O2, Ar, CO2', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 0, 4.33, 3396, 1, 2, 227, 2, false, 'CO2, N2', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 0, 34.93, 71492, 0, 12, 152, 95, true, 'H2, He', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 0, 70.86, 60268, 0, 29, 134, 146, true, 'H2, He', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 1904, 151.45, 25559, 1, 84, 76, 28, true, 'H2, He', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 1905, 241.19, 24764, 1, 165, 73, 16, true, 'H2, He', 1);
INSERT INTO public.planet VALUES (9, 'Ceres', 1904, 29.52, 473, 0, 5, 167, 0, false, 'H2O', 1);
INSERT INTO public.planet VALUES (10, 'Pluto', 1905, 297.76, 1188, 6, 248, 40, 5, false, 'N2, CH4, CO', 1);
INSERT INTO public.planet VALUES (11, 'Haumea', 1905, 420.84, 816, 0, 284, 50, 2, true, 'unknown', 1);
INSERT INTO public.planet VALUES (12, 'Makemake', 1905, 441.87, 715, 1, 306, 30, 1, false, 'N2, CH4', 1);
INSERT INTO public.planet VALUES (13, 'Eris', 1905, 789.77, 1163, 16, 559, 30, 1, false, 'N2, CH4', 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'SUN1', 0, 'Local', 'Yellow', 1.0, -26.74, 4.83, 1);
INSERT INTO public.star VALUES (2, 'S Dor', 'HD35343', 160000, 'Dorado', 'Blue', 400.0, 10.40, -9.60, 2);
INSERT INTO public.star VALUES (3, 'Beta Hydri', 'HD2151', 24, 'Hydrus', 'Yellow', 1.8, 2.80, 3.50, 3);
INSERT INTO public.star VALUES (4, 'Mirach', 'HD6860', 197, 'Andromeda', 'Red', 89.0, 2.06, -1.60, 4);
INSERT INTO public.star VALUES (5, 'Regulus', 'HD87901', 79, 'Leo', 'Blue', 3.8, 1.35, -0.57, 5);
INSERT INTO public.star VALUES (6, 'Menkent', 'HD123139', 61, 'Centaurus', 'Orange', 10.6, 2.06, 0.93, 6);
INSERT INTO public.star VALUES (7, 'Pherkad', 'HD137422', 487, 'Ursa Minor', 'White', 15.0, 3.00, -1.50, 7);
INSERT INTO public.star VALUES (8, 'Dubhe', 'HD95689', 124, 'Ursa Major', 'Yellow', 30.0, 1.79, -1.10, 8);
INSERT INTO public.star VALUES (9, 'Deneb', 'HD197345', 2600, 'Cygnus', 'White', 203.0, 1.25, -8.40, 9);
INSERT INTO public.star VALUES (10, 'Caph', 'HD432', 55, 'Cassiopeia', 'White', 3.4, 2.28, 1.00, 10);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 9, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 28, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: constellation constellation_nasa_abbrev_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_nasa_abbrev_key UNIQUE (nasa_abbrev);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_reference_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_reference_number_key UNIQUE (reference_number);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_ref_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_ref_id_key UNIQUE (ref_id);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_reference_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_reference_id_key UNIQUE (reference_id);


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

