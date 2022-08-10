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
-- Name: branch_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.branch_types (
    id integer NOT NULL,
    name character varying(11) NOT NULL
);


--
-- Name: branch_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.branch_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: branch_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.branch_types_id_seq OWNED BY public.branch_types.id;


--
-- Name: branches; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.branches (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    address character varying(70) NOT NULL,
    phone character varying(25),
    whatsapp character varying(25),
    branch_type_id integer
);


--
-- Name: branches_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.branches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: branches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.branches_id_seq OWNED BY public.branches.id;


--
-- Name: branches_workers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.branches_workers (
    id integer NOT NULL,
    worker_id integer,
    branch_id integer
);


--
-- Name: branches_workers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.branches_workers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: branches_workers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.branches_workers_id_seq OWNED BY public.branches_workers.id;


--
-- Name: positions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.positions (
    id integer NOT NULL,
    name character varying(25) NOT NULL
);


--
-- Name: positions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.positions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: positions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.positions_id_seq OWNED BY public.positions.id;


--
-- Name: priorities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.priorities (
    id integer NOT NULL,
    name character varying(25) NOT NULL
);


--
-- Name: priorities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.priorities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: priorities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.priorities_id_seq OWNED BY public.priorities.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: service_tickets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.service_tickets (
    id integer NOT NULL,
    ticket_id integer
);


--
-- Name: service_tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.service_tickets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: service_tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.service_tickets_id_seq OWNED BY public.service_tickets.id;


--
-- Name: service_tickets_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.service_tickets_types (
    id integer NOT NULL,
    service_ticket_id integer,
    service_type_id integer
);


--
-- Name: service_tickets_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.service_tickets_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: service_tickets_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.service_tickets_types_id_seq OWNED BY public.service_tickets_types.id;


--
-- Name: service_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.service_types (
    id integer NOT NULL,
    name character varying(40) NOT NULL
);


--
-- Name: service_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.service_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: service_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.service_types_id_seq OWNED BY public.service_types.id;


--
-- Name: states; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.states (
    id integer NOT NULL,
    name character varying(25) NOT NULL
);


--
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.states_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;


--
-- Name: ticket_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ticket_files (
    id integer NOT NULL,
    description character varying(150) NOT NULL,
    url character varying(60) NOT NULL,
    ticket_id integer NOT NULL
);


--
-- Name: ticket_files_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ticket_files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ticket_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ticket_files_id_seq OWNED BY public.ticket_files.id;


--
-- Name: ticket_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ticket_types (
    id integer NOT NULL,
    name character varying(25) NOT NULL
);


--
-- Name: ticket_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ticket_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ticket_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ticket_types_id_seq OWNED BY public.ticket_types.id;


--
-- Name: tickets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tickets (
    id integer NOT NULL,
    created timestamp without time zone NOT NULL,
    edited timestamp without time zone,
    resume character varying(30) NOT NULL,
    description text NOT NULL,
    worker_id integer,
    priority_id integer,
    branch_id integer,
    state_id integer,
    ticket_type_id integer
);


--
-- Name: tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tickets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tickets_id_seq OWNED BY public.tickets.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    "user" character varying(145) NOT NULL,
    password character varying(145) NOT NULL,
    last_login timestamp without time zone,
    worker_id integer,
    activation_key character varying(25),
    reset_key character varying(25)
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: workers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.workers (
    id integer NOT NULL,
    names character varying(45) NOT NULL,
    last_names character varying(45) NOT NULL,
    email character varying(45) NOT NULL,
    phone character varying(25),
    position_id integer
);


--
-- Name: vw_tickets; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vw_tickets AS
 SELECT t.id,
    t.resume,
    to_char(t.created, '%Y/%m/%d'::text) AS created,
    to_char(t.edited, '%Y/%m/%d'::text) AS edited,
    t.worker_id,
    concat(w.last_names, ', ', w.names) AS worker_name,
    t.priority_id,
    p.name AS priority_name,
    t.state_id,
    s.name AS state_name,
    t.ticket_type_id,
    tt.name AS ticket_type_name,
    t.branch_id,
    concat(bt.name, ', ', b.name) AS branch_name
   FROM ((((((public.tickets t
     JOIN public.workers w ON ((w.id = t.worker_id)))
     JOIN public.priorities p ON ((p.id = t.priority_id)))
     JOIN public.states s ON ((s.id = t.state_id)))
     JOIN public.branches b ON ((b.id = t.branch_id)))
     JOIN public.ticket_types tt ON ((tt.id = t.ticket_type_id)))
     JOIN public.branch_types bt ON ((b.branch_type_id = bt.id)))
  ORDER BY t.created;


--
-- Name: workers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.workers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: workers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.workers_id_seq OWNED BY public.workers.id;


--
-- Name: branch_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.branch_types ALTER COLUMN id SET DEFAULT nextval('public.branch_types_id_seq'::regclass);


--
-- Name: branches id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.branches ALTER COLUMN id SET DEFAULT nextval('public.branches_id_seq'::regclass);


--
-- Name: branches_workers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.branches_workers ALTER COLUMN id SET DEFAULT nextval('public.branches_workers_id_seq'::regclass);


--
-- Name: positions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.positions ALTER COLUMN id SET DEFAULT nextval('public.positions_id_seq'::regclass);


--
-- Name: priorities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.priorities ALTER COLUMN id SET DEFAULT nextval('public.priorities_id_seq'::regclass);


--
-- Name: service_tickets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_tickets ALTER COLUMN id SET DEFAULT nextval('public.service_tickets_id_seq'::regclass);


--
-- Name: service_tickets_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_tickets_types ALTER COLUMN id SET DEFAULT nextval('public.service_tickets_types_id_seq'::regclass);


--
-- Name: service_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_types ALTER COLUMN id SET DEFAULT nextval('public.service_types_id_seq'::regclass);


--
-- Name: states id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);


--
-- Name: ticket_files id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket_files ALTER COLUMN id SET DEFAULT nextval('public.ticket_files_id_seq'::regclass);


--
-- Name: ticket_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket_types ALTER COLUMN id SET DEFAULT nextval('public.ticket_types_id_seq'::regclass);


--
-- Name: tickets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tickets ALTER COLUMN id SET DEFAULT nextval('public.tickets_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: workers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workers ALTER COLUMN id SET DEFAULT nextval('public.workers_id_seq'::regclass);


--
-- Name: branch_types branch_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.branch_types
    ADD CONSTRAINT branch_types_pkey PRIMARY KEY (id);


--
-- Name: branches branches_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT branches_pkey PRIMARY KEY (id);


--
-- Name: branches_workers branches_workers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.branches_workers
    ADD CONSTRAINT branches_workers_pkey PRIMARY KEY (id);


--
-- Name: positions positions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.positions
    ADD CONSTRAINT positions_pkey PRIMARY KEY (id);


--
-- Name: priorities priorities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.priorities
    ADD CONSTRAINT priorities_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: service_tickets service_tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_tickets
    ADD CONSTRAINT service_tickets_pkey PRIMARY KEY (id);


--
-- Name: service_tickets_types service_tickets_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_tickets_types
    ADD CONSTRAINT service_tickets_types_pkey PRIMARY KEY (id);


--
-- Name: service_types service_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_types
    ADD CONSTRAINT service_types_pkey PRIMARY KEY (id);


--
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: ticket_files ticket_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket_files
    ADD CONSTRAINT ticket_files_pkey PRIMARY KEY (id);


--
-- Name: ticket_types ticket_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket_types
    ADD CONSTRAINT ticket_types_pkey PRIMARY KEY (id);


--
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: workers workers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workers
    ADD CONSTRAINT workers_pkey PRIMARY KEY (id);


--
-- Name: branches branches_branch_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT branches_branch_type_id_fkey FOREIGN KEY (branch_type_id) REFERENCES public.branch_types(id) ON DELETE CASCADE;


--
-- Name: branches_workers branches_workers_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.branches_workers
    ADD CONSTRAINT branches_workers_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branches(id) ON DELETE CASCADE;


--
-- Name: branches_workers branches_workers_worker_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.branches_workers
    ADD CONSTRAINT branches_workers_worker_id_fkey FOREIGN KEY (worker_id) REFERENCES public.workers(id) ON DELETE CASCADE;


--
-- Name: service_tickets service_tickets_ticket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_tickets
    ADD CONSTRAINT service_tickets_ticket_id_fkey FOREIGN KEY (ticket_id) REFERENCES public.tickets(id) ON DELETE CASCADE;


--
-- Name: service_tickets_types service_tickets_types_service_ticket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_tickets_types
    ADD CONSTRAINT service_tickets_types_service_ticket_id_fkey FOREIGN KEY (service_ticket_id) REFERENCES public.service_tickets(id) ON DELETE CASCADE;


--
-- Name: service_tickets_types service_tickets_types_service_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_tickets_types
    ADD CONSTRAINT service_tickets_types_service_type_id_fkey FOREIGN KEY (service_type_id) REFERENCES public.service_types(id) ON DELETE CASCADE;


--
-- Name: ticket_files ticket_files_ticket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket_files
    ADD CONSTRAINT ticket_files_ticket_id_fkey FOREIGN KEY (ticket_id) REFERENCES public.tickets(id) ON DELETE CASCADE;


--
-- Name: tickets tickets_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branches(id) ON DELETE CASCADE;


--
-- Name: tickets tickets_priority_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_priority_id_fkey FOREIGN KEY (priority_id) REFERENCES public.priorities(id) ON DELETE CASCADE;


--
-- Name: tickets tickets_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_state_id_fkey FOREIGN KEY (state_id) REFERENCES public.states(id) ON DELETE CASCADE;


--
-- Name: tickets tickets_ticket_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_ticket_type_id_fkey FOREIGN KEY (ticket_type_id) REFERENCES public.ticket_types(id) ON DELETE CASCADE;


--
-- Name: tickets tickets_worker_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_worker_id_fkey FOREIGN KEY (worker_id) REFERENCES public.workers(id) ON DELETE CASCADE;


--
-- Name: users users_worker_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_worker_id_fkey FOREIGN KEY (worker_id) REFERENCES public.workers(id) ON DELETE CASCADE;


--
-- Name: workers workers_position_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workers
    ADD CONSTRAINT workers_position_id_fkey FOREIGN KEY (position_id) REFERENCES public.positions(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--


--
-- Dbmate schema migrations
--

INSERT INTO public.schema_migrations (version) VALUES
    ('20220726004204'),
    ('20220726004355'),
    ('20220726004657'),
    ('20220726010927'),
    ('20220726012021'),
    ('20220726012027'),
    ('20220726012215'),
    ('20220726012220'),
    ('20220726012231'),
    ('20220726012236'),
    ('20220726013756'),
    ('20220726013801'),
    ('20220726013802'),
    ('20220726014143'),
    ('20220726014334'),
    ('20220726014954'),
    ('20220726015002'),
    ('20220726015834'),
    ('20220726020758'),
    ('20220726020959'),
    ('20220726230401'),
    ('20220729030323'),
    ('20220804151900'),
    ('20220804160935');
