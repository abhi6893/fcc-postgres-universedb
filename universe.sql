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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(50) NOT NULL,
    distance_from_sun numeric NOT NULL,
    composition text,
    is_dangerous boolean NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type text NOT NULL,
    distance_from_earth_in_light_years numeric,
    has_life boolean NOT NULL,
    discription text,
    age_in_million_in_years integer
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
    name character varying(50) NOT NULL,
    planet_id integer,
    moon_type text NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_planet numeric,
    description text
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
    name character varying(50) NOT NULL,
    star_id integer,
    planet_type text NOT NULL,
    has_life boolean NOT NULL,
    age_in_million_of_years integer NOT NULL,
    distance_from_star numeric,
    discription text
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
    name character varying(50) NOT NULL,
    galaxy_id integer,
    star_type text NOT NULL,
    age_in_million_in_years integer NOT NULL,
    distance_from_earth_in_light_years numeric,
    is_spherical boolean NOT NULL,
    discription text
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 413.7, 'Rock and ice', false);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 353.2, 'Rock', false);
INSERT INTO public.asteroid VALUES (3, 'Eros', 213.1, 'S-type', true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, true, 'Our home galaxy', 13600);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2500000, false, 'Nearest large galaxy to Milky Way', 10000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000000, false, 'Smaller spiral galaxy', 5000);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'Elliptical', 12000000, false, 'Active galaxy with a supermassive black hole', 13000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 31000000, false, 'Classic spiral galaxy', 400);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral', 28000000, false, 'Galaxy with a prominent dust lane', 9000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (41, 'Moon', 46, 'Rocky', true, 384400, 'Earths only natural satellite');
INSERT INTO public.moon VALUES (42, 'Phobos', 47, 'Irregular', true, 9377, 'Mars inner moon');
INSERT INTO public.moon VALUES (43, 'Deimos', 47, 'Irregular', true, 23460, 'Mars outer moon');
INSERT INTO public.moon VALUES (44, 'Io', 48, 'Volcanic', true, 421700, 'Jupiter inner moon, volcanically active');
INSERT INTO public.moon VALUES (45, 'Europa', 48, 'Icy', true, 671100, 'Jupiter moon with a possible subsurface ocean');
INSERT INTO public.moon VALUES (46, 'Ganymede', 48, 'Icy', true, 1070400, 'Largest moon in the solar system, Jupiter moon');
INSERT INTO public.moon VALUES (47, 'Callisto', 48, 'Icy', true, 1882700, 'Jupiter outermost Galilean moon');
INSERT INTO public.moon VALUES (48, 'Titan', 50, 'Icy', true, 1221870, 'Saturn largest moon, with a thick atmosphere');
INSERT INTO public.moon VALUES (49, 'Rhea', 50, 'Icy', true, 527108, 'Saturn second-largest moon');
INSERT INTO public.moon VALUES (50, 'Iapetus', 50, 'Icy', true, 3560820, 'Saturn moon with a two-toned appearance');
INSERT INTO public.moon VALUES (51, 'Dione', 50, 'Icy', true, 377396, 'Saturn moon with ice cliffs');
INSERT INTO public.moon VALUES (52, 'Tethys', 50, 'Icy', true, 294619, 'Saturn moon with a large impact crater');
INSERT INTO public.moon VALUES (53, 'Enceladus', 50, 'Icy', true, 238020, 'Saturn moon with cryovolcanoes');
INSERT INTO public.moon VALUES (54, 'Miranda', 56, 'Icy', true, 129872, 'Uranus moon with diverse terrain');
INSERT INTO public.moon VALUES (55, 'Ariel', 56, 'Icy', true, 190900, 'Uranus moon with valleys and ridges');
INSERT INTO public.moon VALUES (56, 'Umbriel', 56, 'Icy', true, 266000, 'Uranus darkest moon');
INSERT INTO public.moon VALUES (57, 'Titania', 56, 'Icy', true, 435910, 'Uranus largest moon');
INSERT INTO public.moon VALUES (58, 'Oberon', 56, 'Icy', true, 583520, 'Uranus outermost major moon');
INSERT INTO public.moon VALUES (59, 'Triton', 57, 'Icy', true, 354759, 'Neptune largest moon, cryovolcanoes');
INSERT INTO public.moon VALUES (60, 'Nereid', 57, 'Irregular', true, 5513400, 'Neptune outermost moon');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (46, 'Earth', 1, 'Terrestrial', true, 4543, 1, 'Our home planet');
INSERT INTO public.planet VALUES (47, 'Mars', 1, 'Terrestrial', false, 4603, 1.5, 'The Red Planet');
INSERT INTO public.planet VALUES (48, 'Jupiter', 1, 'Gas Giant', false, 4603, 5.2, 'Largest planet in our solar system');
INSERT INTO public.planet VALUES (49, 'Saturn', 1, 'Gas Giant', false, 4503, 9.5, 'Known for its rings');
INSERT INTO public.planet VALUES (50, 'Venus', 1, 'Terrestrial', false, 4503, 0.7, 'Hottest planet in our solar system');
INSERT INTO public.planet VALUES (51, 'Mercury', 1, 'Terrestrial', false, 4503, 0.4, 'Smallest planet in our solar system');
INSERT INTO public.planet VALUES (52, 'Kepler-186f', 5, 'Terrestrial', false, 500, 500, 'Exoplanet in the habitable zone');
INSERT INTO public.planet VALUES (53, 'Proxima Centauri b', 3, 'Terrestrial', false, 4000, 0.05, 'Exoplanet orbiting Proxima Centauri');
INSERT INTO public.planet VALUES (54, 'Gliese 581g', 5, 'Terrestrial', false, 7000, 100, 'Disputed exoplanet');
INSERT INTO public.planet VALUES (55, 'HD 209458 b', 6, 'Gas Giant', false, 5000, 0.047, 'Hot Jupiter exoplanet');
INSERT INTO public.planet VALUES (56, 'WASP-12b', 4, 'Gas Giant', false, 1000, 0.023, 'Very hot exoplanet');
INSERT INTO public.planet VALUES (57, '51 Pegasi b', 3, 'Gas Giant', false, 6000, 0.05, 'First exoplanet discovered around a sun-like star');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type main-sequence', 4600, 0, true, 'Our star');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A-type main-sequence', 242, 8.6, true, 'Brightest star in the night sky');
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, 'G-type main-sequence', 6520, 4.37, true, 'Part of a triple star system');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'Red Supergiant', 8, 643, true, 'A very large star');
INSERT INTO public.star VALUES (5, 'Vega', 1, 'A-type main-sequence', 455, 25, true, 'Bright star in Lyra constellation');
INSERT INTO public.star VALUES (6, 'Polaris', 1, 'Cepheid Variable', 70, 434, true, 'North Star');


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 60, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 57, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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

