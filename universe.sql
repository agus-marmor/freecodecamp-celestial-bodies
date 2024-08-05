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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    star_count integer,
    description text
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
    name character varying(255) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric(10,2)
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
    planet_id integer,
    has_ice boolean DEFAULT false NOT NULL,
    diameter numeric(10,2),
    distance_from_planet numeric(10,2)
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
    star_id integer,
    has_rings boolean DEFAULT false NOT NULL,
    distance_from_star numeric(10,2),
    age_in_millions_of_years integer
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
    name character varying(255) NOT NULL,
    galaxy_id integer,
    has_life boolean DEFAULT false NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL,
    luminosity numeric(10,2)
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

INSERT INTO public.constellation VALUES (1, 'Orion', 1, 5, 'A prominent constellation located on the celestial equator');
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 1, 7, 'A constellation in the northern sky, known for the Big Dipper');
INSERT INTO public.constellation VALUES (3, 'Cassiopeia', 1, 5, 'A constellation in the northern sky, resembling a W or M shape');
INSERT INTO public.constellation VALUES (4, 'Scorpius', 1, 6, 'A constellation in the southern sky representing a scorpion');
INSERT INTO public.constellation VALUES (5, 'Leo', 1, 6, 'A constellation representing a lion, known for its prominent star Regulus');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'A spiral galaxy containing our solar system', 13000, 0.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'A spiral galaxy nearest to the Milky Way', 10000, 2500000.00);
INSERT INTO public.galaxy VALUES (3, 'Messier 81', 'A spiral galaxy in the constellation Ursa Major', 12000, 12000000.00);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 'A spiral galaxy in the constellation Canes Venatici', 15000, 23000000.00);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'A spiral galaxy in the constellation Virgo', 16000, 28000000.00);
INSERT INTO public.galaxy VALUES (6, 'Triangulum Galaxy', 'A spiral galaxy in the constellation Triangulum', 11000, 30000000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, true, 3474.80, 384400.00);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, false, 22.40, 9377.00);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, false, 12.40, 23460.00);
INSERT INTO public.moon VALUES (4, 'Europa', 3, true, 3121.60, 670900.00);
INSERT INTO public.moon VALUES (5, 'Ganymede', 3, true, 5268.20, 1070400.00);
INSERT INTO public.moon VALUES (6, 'Io', 3, false, 3643.20, 421800.00);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, true, 4820.60, 1882700.00);
INSERT INTO public.moon VALUES (8, 'Titan', 4, true, 5150.00, 1221700.00);
INSERT INTO public.moon VALUES (9, 'Rhea', 4, true, 1527.60, 527000.00);
INSERT INTO public.moon VALUES (10, 'Iapetus', 4, true, 1469.00, 356000.00);
INSERT INTO public.moon VALUES (11, 'Dione', 4, true, 1122.60, 377400.00);
INSERT INTO public.moon VALUES (12, 'Tethys', 4, true, 1060.00, 294660.00);
INSERT INTO public.moon VALUES (13, 'Enceladus', 4, true, 504.20, 238000.00);
INSERT INTO public.moon VALUES (14, 'Mimas', 4, true, 396.00, 185520.00);
INSERT INTO public.moon VALUES (15, 'Miranda', 5, true, 471.60, 129700.00);
INSERT INTO public.moon VALUES (16, 'Ariel', 5, true, 1158.80, 191020.00);
INSERT INTO public.moon VALUES (17, 'Umbriel', 5, true, 1169.00, 266000.00);
INSERT INTO public.moon VALUES (18, 'Titania', 5, true, 1577.60, 436300.00);
INSERT INTO public.moon VALUES (19, 'Oberon', 5, true, 1522.80, 583520.00);
INSERT INTO public.moon VALUES (20, 'Triton', 6, true, 2706.80, 354800.00);
INSERT INTO public.moon VALUES (21, 'Proteus', 6, true, 418.60, 117600.00);
INSERT INTO public.moon VALUES (22, 'Nereid', 6, true, 170.80, 551200.00);
INSERT INTO public.moon VALUES (23, 'Despina', 6, true, 148.00, 52700.00);
INSERT INTO public.moon VALUES (24, 'Galatea', 6, true, 158.00, 49200.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, false, 1.00, 4500);
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, 1.50, 4500);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, true, 5.20, 4600);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, true, 9.50, 4600);
INSERT INTO public.planet VALUES (5, 'Uranus', 1, true, 19.80, 4600);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, true, 30.10, 4600);
INSERT INTO public.planet VALUES (7, 'Mercury', 1, false, 0.39, 4600);
INSERT INTO public.planet VALUES (8, 'Venus', 1, false, 0.72, 4600);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, true, 39.50, 4600);
INSERT INTO public.planet VALUES (10, 'Eris', 1, true, 96.40, 4600);
INSERT INTO public.planet VALUES (11, 'Ceres', 1, true, 2.77, 4600);
INSERT INTO public.planet VALUES (12, 'Haumea', 1, true, 43.10, 4600);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, true, true, 1.00);
INSERT INTO public.star VALUES (2, 'Sirius', 1, false, true, 25.40);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, false, true, 120000.00);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, false, true, 0.00);
INSERT INTO public.star VALUES (5, 'Vega', 1, false, true, 40.12);
INSERT INTO public.star VALUES (6, 'Altair', 1, false, true, 10.60);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: constellation constellation_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

