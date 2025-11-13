--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    meaning character varying(40),
    star_id integer
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
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    is_visible boolean
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
    year_discovered integer,
    diam_km integer,
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
    orb_period_yrs numeric(6,2),
    rot_period_days numeric(6,2),
    gravity_m_s2 numeric(6,2),
    has_moon boolean,
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
    name character varying(30) NOT NULL,
    dist_light_yrs numeric(7,2),
    brightness numeric(6,2),
    age_million_yrs integer,
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

INSERT INTO public.constellation VALUES (1, 'Aquarius', 'water-bearer', 2);
INSERT INTO public.constellation VALUES (2, 'Aries', 'ram', 3);
INSERT INTO public.constellation VALUES (3, 'Bootes', 'herdsman', 4);
INSERT INTO public.constellation VALUES (4, 'Taurus', 'bull', 5);
INSERT INTO public.constellation VALUES (5, 'Leo', 'lion', 6);
INSERT INTO public.constellation VALUES (6, 'Virgo', 'virgin or maiden', 7);
INSERT INTO public.constellation VALUES (7, 'Pegasus', 'pegasus (mythological winged horse)', 8);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Backward Galaxy', 'It seems to rotate in the opposite direction', false, false);
INSERT INTO public.galaxy VALUES (2, 'Black Eye Galaxy', 'It looks like an eye with a dark stripe underneath', false, false);
INSERT INTO public.galaxy VALUES (3, 'Milky Way', 'The galaxy that includes our solar system', true, true);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'A galaxy in the constellation of Centaurus', false, false);
INSERT INTO public.galaxy VALUES (5, 'Hercules A', 'A supergiant elliptical galaxy', false, false);
INSERT INTO public.galaxy VALUES (6, 'Andromeda', 'Also known as Messier 31', false, true);
INSERT INTO public.galaxy VALUES (7, 'Cygnus A', 'One of the strongest radio sources in the sky', false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, 3476, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 1877, 23, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 1877, 13, 4);
INSERT INTO public.moon VALUES (4, 'Io', 1610, 3630, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 1610, 3630, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1610, 5262, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 1610, 4800, 5);
INSERT INTO public.moon VALUES (8, 'Rhea', 1672, 1530, 6);
INSERT INTO public.moon VALUES (9, 'Titan', 1655, 5150, 6);
INSERT INTO public.moon VALUES (10, 'Hyperion', 1848, 270, 6);
INSERT INTO public.moon VALUES (11, 'Ariel', 1851, 1190, 7);
INSERT INTO public.moon VALUES (12, 'Umbriel', 1851, 1190, 7);
INSERT INTO public.moon VALUES (13, 'Titania', 1787, 1610, 7);
INSERT INTO public.moon VALUES (14, 'Oberon', 1787, 1550, 7);
INSERT INTO public.moon VALUES (15, 'Miranda', 1548, 485, 7);
INSERT INTO public.moon VALUES (16, 'Puck', 1985, 170, 7);
INSERT INTO public.moon VALUES (17, 'Triton', 1846, 2720, 8);
INSERT INTO public.moon VALUES (18, 'Galetea', 1989, 340, 8);
INSERT INTO public.moon VALUES (19, 'Larissa', 1981, 400, 8);
INSERT INTO public.moon VALUES (20, 'Charon', 1978, 1200, 11);
INSERT INTO public.moon VALUES (21, 'Hydra', 2005, 61, 11);
INSERT INTO public.moon VALUES (22, 'Kerberos', 2011, 28, 11);
INSERT INTO public.moon VALUES (23, 'Styx', 2012, 20, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.24, 58.65, 3.70, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0.62, 243.02, 8.87, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1.00, 1.00, 9.81, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1.88, 1.03, 3.71, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 11.86, 0.41, 24.92, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 29.45, 0.44, 10.44, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 84.02, 0.72, 8.87, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 164.79, 0.67, 11.15, true, 1);
INSERT INTO public.planet VALUES (9, 'Ceres', 4.60, 0.38, 0.27, false, NULL);
INSERT INTO public.planet VALUES (10, 'Orcus', 247.50, NULL, 0.18, true, NULL);
INSERT INTO public.planet VALUES (11, 'Pluto', 247.90, 6.39, 0.62, true, 1);
INSERT INTO public.planet VALUES (12, 'Haumea', 283.80, 0.16, 0.40, true, NULL);
INSERT INTO public.planet VALUES (13, 'Makemake', 306.20, 0.95, 0.50, true, NULL);
INSERT INTO public.planet VALUES (14, 'Gonggong', 552.50, 0.93, 0.31, true, NULL);
INSERT INTO public.planet VALUES (15, 'Eris', 559.00, 14.56, 0.82, true, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0.00, -26.74, 4603, 3);
INSERT INTO public.star VALUES (2, 'Sadalsund', 612.00, 2.90, 110, 3);
INSERT INTO public.star VALUES (3, 'Hamal', 66.00, 2.01, 3400, 3);
INSERT INTO public.star VALUES (4, 'Arcturus', 37.00, 0.05, 7105, 3);
INSERT INTO public.star VALUES (5, 'Aldebaran', 65.23, 0.85, 6605, 3);
INSERT INTO public.star VALUES (6, 'Regulus', 77.00, 1.36, 70, 3);
INSERT INTO public.star VALUES (7, 'Spica', 260.90, 1.04, 12, 3);
INSERT INTO public.star VALUES (8, 'Enif', 688.20, 2.40, 20, 3);
INSERT INTO public.star VALUES (9, 'Beteigeuze', 642.50, 0.58, 10, 3);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 7, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
