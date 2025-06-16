--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9 (Debian 16.9-1.pgdg120+1)
-- Dumped by pg_dump version 16.9 (Ubuntu 16.9-1.pgdg22.04+1)

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: eke
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO eke;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: transactions; Type: TABLE; Schema: public; Owner: eke
--

CREATE TABLE public.transactions (
    id integer NOT NULL,
    transaction_id character varying(100),
    external_transaction_id character varying(100),
    amount numeric(12,2) NOT NULL,
    t_status character varying(20) NOT NULL,
    transaction_type character varying(100) NOT NULL,
    description text,
    date_and_time timestamp without time zone NOT NULL,
    transaction_fee numeric(12,2),
    new_balance numeric(12,2),
    sender character varying(150),
    receiver character varying(150),
    sender_momo_id character varying(100),
    institution_vendor character varying(150),
    transaction_method character varying(100),
    agent character varying(150),
    withdrawer character varying(150),
    power_token character varying(50),
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.transactions OWNER TO eke;

--
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: eke
--

CREATE SEQUENCE public.transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transactions_id_seq OWNER TO eke;

--
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: eke
--

ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;


--
-- Name: transactions id; Type: DEFAULT; Schema: public; Owner: eke
--

ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions_id_seq'::regclass);


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: eke
--

COPY public.transactions (id, transaction_id, external_transaction_id, amount, t_status, transaction_type, description, date_and_time, transaction_fee, new_balance, sender, receiver, sender_momo_id, institution_vendor, transaction_method, agent, withdrawer, power_token, created_at) FROM stdin;
1756	TxId: 13947831685	47842929	25000.00	Completed	Third party transactions	Payment to DIRECT PAYMENT LTD  from MoMo	2024-05-14 21:01:09	0.00	4060.00	\N	DIRECT PAYMENT LTD 	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:25.47104
1757	TxId: 14262449979	c5e8bfeb	600.00	Completed	Third party transactions	Payment to INFORMATION TECHNOLOGY  ENGINEERING CONSTRUCTION   ITEC Ltd from MoMo	2024-06-06 16:19:08	0.00	230.00	\N	INFORMATION TECHNOLOGY  ENGINEERING CONSTRUCTION   ITEC Ltd	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:25.47104
1758	TxId: 14366722236	48214394	25000.00	Completed	Third party transactions	Payment to DIRECT PAYMENT LTD  from MoMo	2024-06-14 07:52:16	0.00	4750.00	\N	DIRECT PAYMENT LTD 	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:25.47104
1759	TxId: 14392932831	E39762254KPY1718479727	8000.00	Completed	Third party transactions	Payment to ESICIA LTD KPAY from MoMo	2024-06-15 21:29:05	0.00	4110.00	\N	ESICIA LTD KPAY	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:25.47104
1760	TxId: 14404189056	475e95b8a1d049c2ba9ee675401d9332	5000.00	Completed	Third party transactions	Payment to Future Dynamic  Innovations ltd from MoMo	2024-06-16 19:26:07	0.00	9350.00	\N	Future Dynamic  Innovations ltd	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:25.47104
1761	TxId: 14574631016	169587820240628223202678996	20000.00	Completed	Third party transactions	Payment to INTOUCH COMMUNICATIONS  LTD from MoMo	2024-06-29 00:32:25	0.00	21670.00	\N	INTOUCH COMMUNICATIONS  LTD	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:25.47104
1762	TxId: 14582579702	169710420240629140334182447	20000.00	Completed	Third party transactions	Payment to INTOUCH COMMUNICATIONS  LTD from MoMo	2024-06-29 16:07:00	0.00	45870.00	\N	INTOUCH COMMUNICATIONS  LTD	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:25.47104
1763	TxId: 15628862865	188160120240907231214390890	20000.00	Completed	Third party transactions	Payment to INTOUCH COMMUNICATIONS  LTD from MoMo	2024-09-08 01:12:49	0.00	103260.00	\N	INTOUCH COMMUNICATIONS  LTD	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:25.47104
1764	TxId: 15747282067	E42267291KPY1726433927	10500.00	Completed	Third party transactions	Payment to ESICIA LTD KPAY from MoMo	2024-09-15 22:59:12	0.00	24750.00	\N	ESICIA LTD KPAY	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:25.47104
1765	TxId: 15874896437	68d6367d	200.00	Completed	Third party transactions	Payment to INFORMATION TECHNOLOGY  ENGINEERING CONSTRUCTION   ITEC Ltd from MoMo	2024-09-24 18:38:00	0.00	1180.00	\N	INFORMATION TECHNOLOGY  ENGINEERING CONSTRUCTION   ITEC Ltd	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:25.47104
1766	TxId: 15940915096	E42831629KPY1727556993	13000.00	Completed	Third party transactions	Payment to ESICIA LTD KPAY from MoMo	2024-09-28 22:56:58	0.00	43210.00	\N	ESICIA LTD KPAY	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:25.47104
1767	TxId: 16030998575	881003055321	25000.00	Completed	Third party transactions	Payment to IREMBO Ltd from MoMo	2024-10-03 17:49:30	0.00	4012.00	\N	IREMBO Ltd	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:25.47104
1768	TxId: 16178728333	E43388184PYR1728648034	11600.00	Completed	Third party transactions	Payment to ESICIA LTD from MoMo	2024-10-11 14:05:43	0.00	69655.00	\N	ESICIA LTD	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:25.47104
1769	TxId: 16327063889	881019247301	5000.00	Completed	Third party transactions	Payment to IREMBO Ltd from MoMo	2024-10-19 11:50:37	0.00	10750.00	\N	IREMBO Ltd	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:25.47104
1770	TxId: 16519345888	N/A	8000.00	Completed	Third party transactions	Payment to third party individual	2024-10-29 13:18:42	0.00	36282.00	\N	Cynthia UMUGANWA (250790698110)	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:25.47104
1771	TxId: 16530676798	N/A	8400.00	Completed	Third party transactions	Payment to third party individual	2024-10-29 23:54:47	0.00	16612.00	\N	Dieudonne MUGIRANEZA (250789447277)	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:25.47104
1772	TxId: 16591010120	194832520241101224717179801	10000.00	Completed	Third party transactions	Payment to INTOUCH COMMUNICATIONS  LTD from MoMo	2024-11-02 00:47:51	0.00	14372.00	\N	INTOUCH COMMUNICATIONS  LTD	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:25.47104
1773	TxId: 17149096701	65c28253	200.00	Completed	Third party transactions	Payment to INFORMATION TECHNOLOGY  ENGINEERING CONSTRUCTION   ITEC Ltd from MoMo	2024-11-30 14:39:12	0.00	79492.00	\N	INFORMATION TECHNOLOGY  ENGINEERING CONSTRUCTION   ITEC Ltd	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:25.47104
1774	TxId: 17192081844	96218fc3	300.00	Completed	Third party transactions	Payment to INFORMATION TECHNOLOGY  ENGINEERING CONSTRUCTION   ITEC Ltd from MoMo	2024-12-02 16:22:41	0.00	122044.00	\N	INFORMATION TECHNOLOGY  ENGINEERING CONSTRUCTION   ITEC Ltd	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:25.47104
1775	TxId: 17219848993	6ed516b1	400.00	Completed	Third party transactions	Payment to INFORMATION TECHNOLOGY  ENGINEERING CONSTRUCTION   ITEC Ltd from MoMo	2024-12-03 21:17:25	0.00	20524.00	\N	INFORMATION TECHNOLOGY  ENGINEERING CONSTRUCTION   ITEC Ltd	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:25.47104
1776	TxId: 17236283233	2eb6d6d7	300.00	Completed	Third party transactions	Payment to INFORMATION TECHNOLOGY  ENGINEERING CONSTRUCTION   ITEC Ltd from MoMo	2024-12-04 18:17:23	0.00	15124.00	\N	INFORMATION TECHNOLOGY  ENGINEERING CONSTRUCTION   ITEC Ltd	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:25.47104
1777	TxId: 17278839589	9838017e	900.00	Completed	Third party transactions	Payment to INFORMATION TECHNOLOGY  ENGINEERING CONSTRUCTION   ITEC Ltd from MoMo	2024-12-06 19:22:52	0.00	9124.00	\N	INFORMATION TECHNOLOGY  ENGINEERING CONSTRUCTION   ITEC Ltd	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:25.47104
1778	TxId: 73214484437	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-10 16:31:46	0.00	1000.00	\N	Jane Smith 12845	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1779	TxId: 51732411227	\N	600.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-10 21:32:40	0.00	400.00	\N	Samuel Carter 95464	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1780	TxId: 17818959211	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-11 18:48:49	0.00	38400.00	\N	Samuel Carter 14965	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1781	TxId: 45434420466	\N	10900.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-12 13:26:20	0.00	14380.00	\N	Jane Smith 59543	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1782	TxId: 82113964658	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-12 13:34:32	0.00	10880.00	\N	Alex Doe 43810	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1783	TxId: 26614842768	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-12 17:58:34	0.00	9880.00	\N	Robert Brown 41193	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1784	TxId: 70497610538	\N	5000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-12 18:09:05	0.00	4880.00	\N	Linda Green 75028	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1785	TxId: 24227321992	\N	1600.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-14 21:29:09	0.00	2460.00	\N	Linda Green 14166	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1786	TxId: 18249226395	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-14 21:29:42	0.00	460.00	\N	Alex Doe 23199	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1787	TxId: 98755359894	\N	1800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-15 09:16:39	0.00	3660.00	\N	Alex Doe 73050	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1788	TxId: 65789139357	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-15 20:38:53	0.00	340.00	\N	Alex Doe 46904	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1789	TxId: 16913786322	\N	2150.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-16 21:35:44	0.00	3890.00	\N	Linda Green 20428	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1790	TxId: 30173936259	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-18 08:15:38	0.00	4190.00	\N	Robert Brown 52128	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1791	TxId: 38084447123	\N	6000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-18 08:48:35	0.00	3190.00	\N	Jane Smith 48045	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1792	TxId: 32894434269	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-20 16:55:42	0.00	2570.00	\N	Jane Smith 61445	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1793	TxId: 61189493387	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-22 13:45:08	0.00	2950.00	\N	Robert Brown 61316	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1794	TxId: 37467134419	\N	1800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-23 09:51:51	0.00	1150.00	\N	Robert Brown 28481	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1795	TxId: 12131092250	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-24 13:10:50	0.00	3250.00	\N	Samuel Carter 98117	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1796	TxId: 35617026753	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-24 16:41:10	0.00	1750.00	\N	Alex Doe 22692	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1797	TxId: 59168184137	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-24 23:07:50	0.00	3050.00	\N	Alex Doe 14717	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1798	TxId: 47570656030	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-25 04:55:30	0.00	1050.00	\N	Samuel Carter 23701	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1799	TxId: 95960893947	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-25 11:19:29	0.00	4050.00	\N	Samuel Carter 19954	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1800	TxId: 43786042083	\N	9300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-25 17:20:28	0.00	4750.00	\N	Jane Smith 15975	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1801	TxId: 51199793551	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-25 19:51:02	0.00	2750.00	\N	Samuel Carter 24729	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1802	TxId: 90057863776	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-25 23:48:00	0.00	1750.00	\N	Jane Smith 55799	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1803	TxId: 65035082869	\N	8000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-26 17:19:35	0.00	2450.00	\N	Jane Smith 51116	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1804	TxId: 23112980564	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-26 18:46:44	0.00	450.00	\N	Robert Brown 11803	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1805	TxId: 97391079490	\N	1700.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-27 08:01:54	0.00	3750.00	\N	Samuel Carter 71141	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1806	TxId: 28021128029	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-28 17:34:10	0.00	1400.00	\N	Alex Doe 44654	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1807	TxId: 59054859038	\N	1800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-30 12:14:38	0.00	3600.00	\N	Jane Smith 39230	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1808	TxId: 49894890981	\N	1700.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-31 09:39:42	0.00	4000.00	\N	Linda Green 61690	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1809	TxId: 36362293540	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-05-31 12:57:27	0.00	2500.00	\N	Jane Smith 80677	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1810	TxId: 38069282043	\N	4050.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-01 14:35:49	0.00	730.00	\N	Jane Smith 20505	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1811	TxId: 66215693108	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-01 19:46:54	0.00	14730.00	\N	Samuel Carter 81957	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1812	TxId: 37706238756	\N	900.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-01 19:48:12	0.00	13830.00	\N	Robert Brown 96964	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1813	TxId: 22989641020	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-01 19:51:45	0.00	2230.00	\N	Linda Green 38423	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1814	TxId: 28025360855	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-02 21:10:53	0.00	3130.00	\N	Alex Doe 65474	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1815	TxId: 32615649069	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-03 13:10:51	0.00	3030.00	\N	Jane Smith 14003	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1816	TxId: 21910499837	\N	4800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-03 18:57:35	0.00	3430.00	\N	Alex Doe 46942	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1817	TxId: 40412577651	\N	1300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-03 19:34:20	0.00	2130.00	\N	Samuel Carter 46893	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1818	TxId: 44021806588	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-04 09:32:53	0.00	630.00	\N	Linda Green 96637	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1819	TxId: 70782527436	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-04 13:52:33	0.00	2130.00	\N	Robert Brown 25426	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1820	TxId: 15037119744	\N	2100.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-04 21:20:27	0.00	30.00	\N	Alex Doe 72233	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1821	TxId: 25107231114	\N	24500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-05 17:19:55	0.00	830.00	\N	Alex Doe 27079	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1822	TxId: 19727516208	\N	600.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-05 22:17:27	0.00	1630.00	\N	Linda Green 76533	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1823	TxId: 36046721654	\N	800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-06 18:19:03	0.00	2830.00	\N	Robert Brown 84176	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1824	TxId: 94257743617	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-12 13:05:13	0.00	2710.00	\N	Robert Brown 39208	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1825	TxId: 28563784569	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-12 17:08:50	0.00	4610.00	\N	Alex Doe 39288	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1826	TxId: 16877151789	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-12 17:15:21	0.00	3110.00	\N	Alex Doe 44082	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1827	TxId: 49766645414	\N	800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-12 20:18:55	0.00	5670.00	\N	Linda Green 18881	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1828	TxId: 91799715733	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-12 22:08:45	0.00	4670.00	\N	Samuel Carter 70871	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1829	TxId: 42326639460	\N	1600.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-12 22:24:40	0.00	3070.00	\N	Jane Smith 37496	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1830	TxId: 18893569803	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-13 13:36:31	0.00	3650.00	\N	Alex Doe 45991	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1831	TxId: 10809435113	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-14 09:44:28	0.00	2750.00	\N	Linda Green 84094	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1832	TxId: 97328486237	\N	1800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-14 10:58:06	0.00	950.00	\N	Samuel Carter 31469	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1833	TxId: 20564153955	\N	2500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-14 13:07:51	0.00	3450.00	\N	Alex Doe 15064	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1834	TxId: 31051483102	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-14 13:28:48	0.00	1950.00	\N	Samuel Carter 28053	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1835	TxId: 17481776844	\N	1800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-14 15:52:28	0.00	5050.00	\N	Robert Brown 40227	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1836	TxId: 63344530197	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-14 20:04:17	0.00	3830.00	\N	Robert Brown 18321	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1837	TxId: 99134996997	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-15 13:11:46	0.00	4730.00	\N	Jane Smith 89064	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1838	TxId: 96723699988	\N	2100.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-15 13:20:15	0.00	1030.00	\N	Jane Smith 92936	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1839	TxId: 16545003631	\N	700.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-15 14:03:03	0.00	49610.00	\N	Alex Doe 29114	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1840	TxId: 61557468875	\N	23300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-15 15:37:44	0.00	26310.00	\N	Jane Smith 90360	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1841	TxId: 81945111303	\N	11000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-15 18:30:34	0.00	12110.00	\N	Alex Doe 15688	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1842	TxId: 59979980024	\N	900.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-16 12:29:02	0.00	3210.00	\N	Robert Brown 32983	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1843	TxId: 77021305535	\N	7000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-16 20:13:53	0.00	2350.00	\N	Linda Green 89531	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1844	TxId: 59491550845	\N	500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-16 21:48:18	0.00	850.00	\N	Samuel Carter 54211	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1845	TxId: 19524019964	\N	4500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-17 15:57:27	0.00	10630.00	\N	Linda Green 22964	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1846	TxId: 23764987164	\N	9900.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-17 16:27:07	0.00	42980.00	\N	Linda Green 57394	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1847	TxId: 41741931224	\N	2800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-17 16:35:26	0.00	40180.00	\N	Jane Smith 12146	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1848	TxId: 81779365319	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-17 22:14:15	0.00	15210.00	\N	Linda Green 31161	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1849	TxId: 12093489080	\N	2500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-18 13:32:59	0.00	10610.00	\N	Alex Doe 12185	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1850	TxId: 10919892030	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-18 13:47:39	0.00	9110.00	\N	Samuel Carter 54054	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1851	TxId: 92393353015	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-18 20:13:44	0.00	10810.00	\N	Alex Doe 12474	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1852	TxId: 70015105006	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-19 13:15:32	0.00	7310.00	\N	Robert Brown 29936	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1853	TxId: 11901062453	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-19 16:07:49	0.00	5810.00	\N	Samuel Carter 20955	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1854	TxId: 65472821949	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-21 16:01:09	0.00	2640.00	\N	Alex Doe 35808	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1855	TxId: 18526546570	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-21 19:03:02	0.00	4540.00	\N	Alex Doe 27861	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1856	TxId: 90823104833	\N	800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-21 21:08:23	0.00	3740.00	\N	Jane Smith 90263	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1857	TxId: 94029377235	\N	2500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-22 06:14:58	0.00	1240.00	\N	Alex Doe 38221	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1858	TxId: 38074910818	\N	6200.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-22 10:49:08	0.00	8740.00	\N	Linda Green 39756	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1859	TxId: 43333418094	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-22 11:41:02	0.00	6220.00	\N	Alex Doe 29218	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1860	TxId: 43349533054	\N	10000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-22 18:15:50	0.00	16220.00	\N	Samuel Carter 44047	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1861	TxId: 12723317674	\N	15000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-23 12:17:05	0.00	620.00	\N	Linda Green 94480	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1862	TxId: 29081551536	\N	600.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-23 13:56:08	0.00	20.00	\N	Jane Smith 74631	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1863	TxId: 55981011420	\N	800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-23 17:08:49	0.00	11120.00	\N	Jane Smith 67993	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1864	TxId: 67456128847	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-24 13:06:33	0.00	420.00	\N	Jane Smith 19682	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1865	TxId: 45238324104	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-24 15:03:53	0.00	1800.00	\N	Robert Brown 66886	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1866	TxId: 31373267832	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-24 17:39:12	0.00	800.00	\N	Jane Smith 97326	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1867	TxId: 99439041781	\N	4200.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-24 20:40:08	0.00	580.00	\N	Alex Doe 41367	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1868	TxId: 91628513434	\N	2400.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-24 21:06:22	0.00	3180.00	\N	Alex Doe 29405	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1869	TxId: 95997298432	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-25 13:32:56	0.00	17260.00	\N	Jane Smith 79876	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1870	TxId: 93272208136	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-25 13:57:38	0.00	10660.00	\N	Alex Doe 88360	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1871	TxId: 76500239822	\N	1200.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-25 19:03:23	0.00	7560.00	\N	Robert Brown 89730	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1872	TxId: 62680813443	\N	15000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-25 22:11:11	0.00	19960.00	\N	Jane Smith 27049	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1873	TxId: 60128198918	\N	2500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-25 22:12:18	0.00	17460.00	\N	Samuel Carter 28730	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1874	TxId: 45944658885	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-25 23:32:57	0.00	7360.00	\N	Jane Smith 50933	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1875	TxId: 95262102019	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-26 09:52:41	0.00	5360.00	\N	Robert Brown 69373	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1876	TxId: 87006296823	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-26 13:49:41	0.00	1760.00	\N	Robert Brown 96044	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1877	TxId: 31576470196	\N	2600.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-26 20:56:33	0.00	290.00	\N	Samuel Carter 26362	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1878	TxId: 73458718592	\N	1300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-26 21:15:07	0.00	3990.00	\N	Linda Green 68296	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1879	TxId: 38607418037	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-27 10:11:34	0.00	1990.00	\N	Samuel Carter 32097	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1880	TxId: 74528093189	\N	3000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-27 12:42:49	0.00	3990.00	\N	Samuel Carter 80358	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1881	TxId: 36124196268	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-28 11:57:53	0.00	2920.00	\N	Samuel Carter 53745	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1882	TxId: 12278530897	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-28 13:54:42	0.00	4420.00	\N	Alex Doe 24477	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1883	TxId: 80699538135	\N	38500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-28 23:17:32	0.00	1670.00	\N	Jane Smith 49279	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1884	TxId: 76219803114	\N	16500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-29 00:42:22	0.00	5170.00	\N	Alex Doe 31462	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1885	TxId: 49444119897	\N	12500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-29 01:16:14	0.00	42670.00	\N	Samuel Carter 80818	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1886	TxId: 23617183914	\N	11500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-29 01:54:32	0.00	31170.00	\N	Alex Doe 80450	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1887	TxId: 77242964085	\N	5000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-29 02:35:47	0.00	26170.00	\N	Linda Green 58573	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1888	TxId: 46513194998	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-29 02:55:05	0.00	24170.00	\N	Linda Green 29839	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1889	TxId: 91434725399	\N	5800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-29 13:17:19	0.00	98120.00	\N	Alex Doe 52731	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1890	TxId: 92465449198	\N	17000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-29 15:55:47	0.00	65870.00	\N	Jane Smith 48732	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1891	TxId: 73443153836	\N	4000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-29 18:25:28	0.00	25600.00	\N	Samuel Carter 93083	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1892	TxId: 36547564090	\N	15000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-29 20:14:55	0.00	98350.00	\N	Samuel Carter 33167	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1893	TxId: 74110530634	\N	3000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-29 20:26:39	0.00	95350.00	\N	Jane Smith 36439	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1894	TxId: 13627937199	\N	3000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-29 20:48:40	0.00	92350.00	\N	Samuel Carter 89385	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1895	TxId: 72441399952	\N	5000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-29 21:15:32	0.00	87350.00	\N	Robert Brown 56837	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1896	TxId: 61734495932	\N	3000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-29 22:00:18	0.00	84350.00	\N	Jane Smith 73232	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1897	TxId: 60128358762	\N	12000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-29 22:23:07	0.00	72350.00	\N	Jane Smith 57243	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1898	TxId: 65198686588	\N	3000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-29 23:01:04	0.00	69350.00	\N	Samuel Carter 43908	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1899	TxId: 74637643766	\N	3000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-29 23:55:18	0.00	66350.00	\N	Jane Smith 46155	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1900	TxId: 19291503186	\N	13000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-30 02:08:36	0.00	53350.00	\N	Robert Brown 66160	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1901	TxId: 89343929108	\N	1400.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-30 13:25:43	0.00	39680.00	\N	Robert Brown 39520	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1902	TxId: 59302716963	\N	12000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-30 15:00:35	0.00	27680.00	\N	Samuel Carter 23837	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1903	TxId: 26484890740	\N	500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-30 15:50:03	0.00	26660.00	\N	Alex Doe 14112	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1904	TxId: 28014849597	\N	4500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-30 16:51:43	0.00	20560.00	\N	Linda Green 10831	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1905	TxId: 26330194128	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-30 20:48:39	0.00	28490.00	\N	Jane Smith 46726	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1906	TxId: 55580359590	\N	32800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-06-30 22:09:50	0.00	13590.00	\N	Alex Doe 86390	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1907	TxId: 15722120949	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-01 10:31:38	0.00	11070.00	\N	Linda Green 77000	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1908	TxId: 13515849108	\N	24850.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-01 18:21:29	0.00	36220.00	\N	Robert Brown 88803	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1909	TxId: 91762592039	\N	500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-01 18:32:29	0.00	26620.00	\N	Robert Brown 62116	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1910	TxId: 10806359835	\N	16000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-01 20:01:12	0.00	10620.00	\N	Linda Green 78551	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1911	TxId: 72418341683	\N	2200.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-01 20:07:42	0.00	8420.00	\N	Alex Doe 88813	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1912	TxId: 36585848121	\N	1300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-02 10:01:17	0.00	7120.00	\N	Jane Smith 16905	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1913	TxId: 58456925124	\N	2500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-02 13:12:00	0.00	14370.00	\N	Alex Doe 28379	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1914	TxId: 52596922232	\N	500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-02 18:47:19	0.00	10870.00	\N	Linda Green 70581	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1915	TxId: 15105279544	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-02 18:48:38	0.00	9870.00	\N	Samuel Carter 46317	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1916	TxId: 30881509437	\N	40000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-03 09:56:44	0.00	9870.00	\N	Robert Brown 45612	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1917	TxId: 75410293151	\N	1300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-03 10:01:48	0.00	8570.00	\N	Samuel Carter 78656	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1918	TxId: 62824215473	\N	3000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-03 13:54:14	0.00	2970.00	\N	Alex Doe 54679	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1919	TxId: 45688985882	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-03 18:32:58	0.00	1320.00	\N	Jane Smith 87381	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1920	TxId: 16694058718	\N	600.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-03 19:51:55	0.00	720.00	\N	Robert Brown 37824	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1921	TxId: 99848480430	\N	16000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-04 16:30:44	0.00	6070.00	\N	Linda Green 29449	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1922	TxId: 35153028513	\N	2500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-05 13:10:45	0.00	16570.00	\N	Jane Smith 69781	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1923	TxId: 67511009036	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-05 13:16:20	0.00	15570.00	\N	Linda Green 66505	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1924	TxId: 34707153443	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-05 18:21:04	0.00	14570.00	\N	Robert Brown 62497	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1925	TxId: 38508422103	\N	6000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-06 00:11:31	0.00	15950.00	\N	Jane Smith 43089	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1926	TxId: 34521857854	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-06 00:45:18	0.00	14950.00	\N	Robert Brown 52619	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1927	TxId: 41545470202	\N	23000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-06 15:50:11	0.00	31950.00	\N	Jane Smith 46824	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1928	TxId: 11475000639	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-06 20:31:16	0.00	28350.00	\N	Alex Doe 19874	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1929	TxId: 56884759672	\N	700.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-06 22:28:56	0.00	25910.00	\N	Alex Doe 40378	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1930	TxId: 89252038095	\N	6000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-07 02:42:31	0.00	19910.00	\N	Alex Doe 72640	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1931	TxId: 78679877816	\N	13000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-07 15:21:43	0.00	4060.00	\N	Linda Green 88021	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1932	TxId: 81915290006	\N	1300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-08 11:08:20	0.00	7140.00	\N	Linda Green 30473	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1933	TxId: 72699451485	\N	3300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-08 13:37:53	0.00	3840.00	\N	Jane Smith 69362	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1934	TxId: 80209257569	\N	2500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-08 18:56:53	0.00	19690.00	\N	Samuel Carter 74506	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1935	TxId: 98284235113	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-08 19:37:12	0.00	18190.00	\N	Samuel Carter 94613	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1936	TxId: 84747563706	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-09 13:08:15	0.00	15390.00	\N	Linda Green 76164	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1937	TxId: 90348213649	\N	40000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-09 18:35:46	0.00	9270.00	\N	Linda Green 94438	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1938	TxId: 69649307640	\N	1300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-10 10:27:16	0.00	7970.00	\N	Robert Brown 10193	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1939	TxId: 53891623812	\N	3300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-10 13:56:14	0.00	4670.00	\N	Samuel Carter 12689	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1940	TxId: 50912955416	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-10 18:33:15	0.00	1170.00	\N	Alex Doe 29799	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1941	TxId: 74932161869	\N	500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-10 18:55:01	0.00	670.00	\N	Jane Smith 50454	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1942	TxId: 87090810360	\N	1300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-11 09:38:09	0.00	19040.00	\N	Samuel Carter 65775	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1943	TxId: 12980825408	\N	7000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-11 13:51:49	0.00	12040.00	\N	Jane Smith 65410	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1944	TxId: 87304861537	\N	400.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-11 20:54:34	0.00	10240.00	\N	Linda Green 86689	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1945	TxId: 16850663914	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-11 20:57:29	0.00	9240.00	\N	Alex Doe 97029	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1946	TxId: 85764457767	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-12 18:11:16	0.00	2640.00	\N	Jane Smith 70173	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1947	TxId: 29430841892	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-12 18:50:22	0.00	1640.00	\N	Robert Brown 98461	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1948	TxId: 72553027719	\N	18800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-14 17:07:45	0.00	8770.00	\N	Robert Brown 88017	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1949	TxId: 23386885212	\N	800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-14 17:32:19	0.00	7150.00	\N	Jane Smith 49790	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1950	TxId: 44609370529	\N	5000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-14 23:03:54	0.00	50110.00	\N	Robert Brown 42656	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1951	TxId: 90206827638	\N	40000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-14 23:06:21	0.00	10110.00	\N	Alex Doe 87860	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1952	TxId: 22146060402	\N	5000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-14 23:47:19	0.00	5110.00	\N	Samuel Carter 42579	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1953	TxId: 52332988443	\N	5000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-15 00:42:01	0.00	110.00	\N	Alex Doe 65209	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1954	TxId: 59668582919	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-16 18:11:26	0.00	11390.00	\N	Linda Green 42316	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1955	TxId: 89908606372	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-16 18:39:11	0.00	10390.00	\N	Robert Brown 78512	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1956	TxId: 46934619518	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-17 19:20:36	0.00	10440.00	\N	Alex Doe 70256	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1957	TxId: 66395034050	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-17 19:47:35	0.00	9440.00	\N	Alex Doe 43296	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1958	TxId: 69887702746	\N	1300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-18 09:42:36	0.00	8140.00	\N	Linda Green 88463	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1959	TxId: 63310525007	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-18 19:31:25	0.00	6120.00	\N	Linda Green 92026	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1960	TxId: 95583860245	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-19 11:05:37	0.00	4620.00	\N	Linda Green 89136	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1961	TxId: 66819031167	\N	1200.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-19 12:13:45	0.00	3420.00	\N	Samuel Carter 74866	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1962	TxId: 56567422826	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-19 12:48:06	0.00	9920.00	\N	Jane Smith 50730	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1963	TxId: 21105102493	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-19 20:46:46	0.00	8420.00	\N	Alex Doe 82226	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1964	TxId: 63176850070	\N	7300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-19 21:06:45	0.00	21120.00	\N	Robert Brown 71154	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1965	TxId: 55265011853	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-20 13:44:12	0.00	18020.00	\N	Samuel Carter 70896	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1966	TxId: 37017834113	\N	7910.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-20 15:59:57	0.00	8010.00	\N	Robert Brown 10994	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1967	TxId: 60895608806	\N	2850.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-20 18:07:29	0.00	1960.00	\N	Jane Smith 27904	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1968	TxId: 87797195810	\N	700.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-20 18:10:22	0.00	1260.00	\N	Samuel Carter 57410	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1969	TxId: 35751352205	\N	1300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-22 11:01:52	0.00	18760.00	\N	Jane Smith 99855	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1970	TxId: 90362526943	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-22 17:59:28	0.00	15360.00	\N	Robert Brown 12608	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1971	TxId: 41432289875	\N	1800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-22 18:05:27	0.00	13560.00	\N	Robert Brown 18604	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1972	TxId: 44149221556	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-22 20:18:57	0.00	12560.00	\N	Samuel Carter 49098	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1973	TxId: 33565890577	\N	1200.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-22 20:38:03	0.00	11360.00	\N	Linda Green 13794	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1974	TxId: 41602878997	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-23 20:30:07	0.00	540.00	\N	Robert Brown 47185	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1975	TxId: 14739625447	\N	7800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-24 13:07:29	0.00	1440.00	\N	Robert Brown 57161	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1976	TxId: 76672344043	\N	1200.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-24 18:08:26	0.00	240.00	\N	Linda Green 95561	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1977	TxId: 60173686359	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-24 19:23:45	0.00	8240.00	\N	Robert Brown 21206	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1978	TxId: 92109248895	\N	5600.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-24 19:31:51	0.00	2640.00	\N	Jane Smith 96776	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1979	TxId: 71788861419	\N	4000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-24 19:51:25	0.00	48640.00	\N	Alex Doe 26309	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1980	TxId: 88491836419	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-24 22:37:04	0.00	37540.00	\N	Samuel Carter 12849	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1981	TxId: 91472495825	\N	4000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-24 22:50:52	0.00	33540.00	\N	Samuel Carter 65578	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1982	TxId: 34195714002	\N	1300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-25 09:56:16	0.00	32240.00	\N	Linda Green 58279	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1983	TxId: 67819295386	\N	2500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-25 14:29:30	0.00	8520.00	\N	Samuel Carter 52533	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1984	TxId: 82065623976	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-25 23:22:06	0.00	6000.00	\N	Linda Green 37513	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1985	TxId: 42285606353	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-25 23:46:49	0.00	4000.00	\N	Alex Doe 19717	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1986	TxId: 36437958017	\N	7500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-26 00:13:54	0.00	14500.00	\N	Jane Smith 21807	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1987	TxId: 85850951309	\N	6600.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-26 00:50:12	0.00	7900.00	\N	Jane Smith 61012	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1988	TxId: 10296908600	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-26 00:50:56	0.00	6400.00	\N	Jane Smith 43509	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1989	TxId: 81424789154	\N	3000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-26 13:30:49	0.00	1750.00	\N	Samuel Carter 18082	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1990	TxId: 60914783301	\N	800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-26 13:37:47	0.00	950.00	\N	Jane Smith 15319	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1991	TxId: 82008869453	\N	3000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-27 17:49:53	0.00	9560.00	\N	Linda Green 66062	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1992	TxId: 40600429643	\N	20000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-28 18:15:06	0.00	89560.00	\N	Robert Brown 93437	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1993	TxId: 64055047273	\N	1800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-28 20:36:58	0.00	85660.00	\N	Linda Green 41843	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1994	TxId: 89491266162	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-29 11:22:35	0.00	84160.00	\N	Jane Smith 22271	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1995	TxId: 55841829409	\N	3000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-29 13:51:52	0.00	81160.00	\N	Robert Brown 78422	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1996	TxId: 88560738072	\N	1200.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-29 14:49:03	0.00	79960.00	\N	Samuel Carter 14297	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1997	TxId: 30752287352	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-29 18:18:21	0.00	78460.00	\N	Jane Smith 30062	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1998	TxId: 53255374349	\N	3300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-29 19:42:11	0.00	75160.00	\N	Alex Doe 22997	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
1999	TxId: 51995555513	\N	1800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-29 22:12:27	0.00	73360.00	\N	Samuel Carter 98562	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2000	TxId: 82523323504	\N	1300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-30 10:33:19	0.00	72060.00	\N	Linda Green 86341	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2001	TxId: 83243497448	\N	3300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-30 13:10:56	0.00	68760.00	\N	Robert Brown 81809	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2002	TxId: 18412104580	\N	4500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-30 17:49:33	0.00	62660.00	\N	Robert Brown 48490	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2003	TxId: 37742687948	\N	21000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-30 18:02:37	0.00	41660.00	\N	Alex Doe 71719	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2004	TxId: 88339887283	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-30 18:15:42	0.00	40660.00	\N	Linda Green 36072	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2005	TxId: 36652345884	\N	600.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-30 20:15:19	0.00	40060.00	\N	Samuel Carter 79989	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2006	TxId: 97102681312	\N	4000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-30 20:28:31	0.00	36060.00	\N	Samuel Carter 66573	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2007	TxId: 69262787089	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-31 10:25:34	0.00	34560.00	\N	Robert Brown 38667	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2008	TxId: 84450540041	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-31 13:07:19	0.00	31060.00	\N	Jane Smith 47666	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2009	TxId: 29940304846	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-07-31 18:08:41	0.00	29560.00	\N	Alex Doe 25299	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2010	TxId: 76571849631	\N	3300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-01 13:42:25	0.00	21660.00	\N	Alex Doe 12163	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2011	TxId: 84613735727	\N	700.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-01 16:17:25	0.00	710.00	\N	Robert Brown 25004	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2012	TxId: 67758041409	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-01 19:08:16	0.00	48710.00	\N	Linda Green 76096	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2013	TxId: 37095118662	\N	1300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-01 19:38:43	0.00	47410.00	\N	Samuel Carter 80498	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2014	TxId: 54529107912	\N	6000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-02 20:33:31	0.00	30440.00	\N	Samuel Carter 34176	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2015	TxId: 17312696676	\N	7000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-03 23:31:17	0.00	46340.00	\N	Jane Smith 55269	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2016	TxId: 44828677354	\N	27000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-04 19:52:28	0.00	6440.00	\N	Robert Brown 39166	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2017	TxId: 81849854541	\N	3000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-05 12:51:45	0.00	7390.00	\N	Alex Doe 20595	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2018	TxId: 68702182375	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-05 19:39:03	0.00	7290.00	\N	Alex Doe 80371	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2019	TxId: 35397483220	\N	1400.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-05 20:24:05	0.00	5890.00	\N	Linda Green 71208	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2020	TxId: 61050966433	\N	3000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-06 13:24:55	0.00	1290.00	\N	Jane Smith 25406	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2021	TxId: 17146568940	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-06 20:24:10	0.00	18790.00	\N	Samuel Carter 89134	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2022	TxId: 51244172238	\N	1300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-06 20:55:55	0.00	17490.00	\N	Jane Smith 25549	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2023	TxId: 42404795768	\N	700.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-06 21:18:24	0.00	16790.00	\N	Alex Doe 13104	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2024	TxId: 28724945380	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-06 21:26:57	0.00	4690.00	\N	Jane Smith 51892	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2025	TxId: 84355626350	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-07 12:50:36	0.00	49590.00	\N	Robert Brown 18531	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2026	TxId: 66942812945	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-07 16:41:19	0.00	45990.00	\N	Linda Green 20387	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2027	TxId: 44686423914	\N	40000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-07 16:50:39	0.00	5990.00	\N	Samuel Carter 88003	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2028	TxId: 90009446652	\N	4000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-07 18:03:05	0.00	48290.00	\N	Robert Brown 10818	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2029	TxId: 39711811703	\N	22400.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-07 18:21:30	0.00	25890.00	\N	Robert Brown 48951	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2030	TxId: 43449848103	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-07 20:25:20	0.00	23370.00	\N	Robert Brown 36649	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2031	TxId: 36806257641	\N	1200.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-07 20:59:20	0.00	22170.00	\N	Jane Smith 65429	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2032	TxId: 85705805836	\N	11600.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-08 14:37:37	0.00	10570.00	\N	Samuel Carter 57462	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2033	TxId: 98718398488	\N	1200.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-08 15:38:13	0.00	9370.00	\N	Linda Green 62587	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2034	TxId: 65794486507	\N	700.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-25 03:16:41	0.00	8100.00	\N	Robert Brown 95184	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2035	TxId: 54527566978	\N	2500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-25 05:37:57	0.00	5600.00	\N	Robert Brown 21510	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2036	TxId: 44085722067	\N	500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-25 19:15:14	0.00	42850.00	\N	Alex Doe 30039	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2037	TxId: 34840236831	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-25 19:20:02	0.00	39350.00	\N	Linda Green 44139	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2038	TxId: 33807026334	\N	700.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-25 19:24:22	0.00	38650.00	\N	Jane Smith 27398	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2039	TxId: 17685290715	\N	200.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-25 19:35:13	0.00	38450.00	\N	Jane Smith 94124	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2040	TxId: 30421279676	\N	2800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-26 14:20:51	0.00	23630.00	\N	Robert Brown 21529	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2041	TxId: 67810322933	\N	40000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-26 18:44:36	0.00	33630.00	\N	Samuel Carter 36220	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2042	TxId: 16477334750	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-26 19:28:47	0.00	32630.00	\N	Alex Doe 67381	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2043	TxId: 63168026131	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-26 19:55:12	0.00	30630.00	\N	Samuel Carter 81187	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2044	TxId: 37958581135	\N	800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-26 20:17:42	0.00	29830.00	\N	Alex Doe 51129	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2045	TxId: 32776707801	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-27 12:07:24	0.00	28330.00	\N	Jane Smith 98770	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2046	TxId: 16642246344	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-27 12:45:21	0.00	24830.00	\N	Samuel Carter 56630	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2047	TxId: 51287161721	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-27 20:31:28	0.00	14810.00	\N	Alex Doe 72777	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2048	TxId: 42143703095	\N	600.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-27 20:44:46	0.00	14210.00	\N	Robert Brown 99509	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2049	TxId: 19778042081	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-27 20:58:06	0.00	13210.00	\N	Jane Smith 47042	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2050	TxId: 65847057882	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-28 12:12:28	0.00	21460.00	\N	Linda Green 25980	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2051	TxId: 50837825539	\N	3300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-28 12:57:03	0.00	18160.00	\N	Linda Green 55509	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2052	TxId: 72819907564	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-28 19:48:01	0.00	15560.00	\N	Jane Smith 11731	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2053	TxId: 53433821307	\N	2300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-28 20:04:12	0.00	13260.00	\N	Alex Doe 79544	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2054	TxId: 58247627931	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-28 20:44:12	0.00	11260.00	\N	Linda Green 75600	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2055	TxId: 19153266137	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-30 12:13:08	0.00	99460.00	\N	Linda Green 74929	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2056	TxId: 39270807010	\N	5800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-30 14:28:41	0.00	92060.00	\N	Jane Smith 65531	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2057	TxId: 99076325019	\N	1300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-30 15:16:24	0.00	90760.00	\N	Linda Green 16289	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2058	TxId: 34261953989	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-30 19:30:26	0.00	85920.00	\N	Jane Smith 51632	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2059	TxId: 96185760887	\N	10000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-30 21:25:04	0.00	75920.00	\N	Samuel Carter 64575	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2060	TxId: 97313704025	\N	12100.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-31 17:20:34	0.00	16570.00	\N	Alex Doe 86311	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2061	TxId: 77555076585	\N	1200.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-31 18:44:58	0.00	15370.00	\N	Samuel Carter 16371	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2062	TxId: 84510391939	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-08-31 18:47:27	0.00	13370.00	\N	Linda Green 30923	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2063	TxId: 22766907160	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-01 17:26:59	0.00	11870.00	\N	Robert Brown 25919	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2064	TxId: 28158968182	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-01 20:46:24	0.00	11870.00	\N	Robert Brown 21358	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2065	TxId: 46906409049	\N	7000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-01 23:34:49	0.00	4870.00	\N	Alex Doe 71929	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2066	TxId: 54566717014	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-02 00:27:06	0.00	3870.00	\N	Alex Doe 17485	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2067	TxId: 18226776468	\N	21000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-02 13:54:24	0.00	29870.00	\N	Linda Green 97614	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2068	TxId: 54349163900	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-02 14:18:16	0.00	28370.00	\N	Alex Doe 86356	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2069	TxId: 78378077317	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-02 17:40:39	0.00	26870.00	\N	Jane Smith 86197	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2070	TxId: 71235033735	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-02 22:36:21	0.00	21690.00	\N	Linda Green 46799	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2071	TxId: 71779593744	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-03 13:13:16	0.00	18190.00	\N	Linda Green 72373	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2072	TxId: 17120559943	\N	5000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-03 17:49:43	0.00	13190.00	\N	Linda Green 99420	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2073	TxId: 60424907269	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-03 18:53:28	0.00	1590.00	\N	Linda Green 27195	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2074	TxId: 49794854165	\N	4500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-03 21:03:14	0.00	47090.00	\N	Linda Green 74481	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2075	TxId: 83422016891	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-04 09:47:47	0.00	45590.00	\N	Jane Smith 25500	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2076	TxId: 63961191384	\N	5000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-04 13:37:03	0.00	40590.00	\N	Jane Smith 25674	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2077	TxId: 15812096064	\N	4500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-04 17:43:51	0.00	36090.00	\N	Jane Smith 10890	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2078	TxId: 67353135596	\N	2500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-04 20:34:44	0.00	33590.00	\N	Linda Green 60962	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2079	TxId: 57527013791	\N	2500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-04 21:01:47	0.00	31090.00	\N	Samuel Carter 76240	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2080	TxId: 61863630305	\N	5000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-04 23:02:42	0.00	26090.00	\N	Alex Doe 62262	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2081	TxId: 80939174580	\N	6000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-05 13:33:00	0.00	18490.00	\N	Alex Doe 67793	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2082	TxId: 29253592859	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-05 16:18:28	0.00	16990.00	\N	Linda Green 11347	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2083	TxId: 95155933276	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-05 20:00:30	0.00	15490.00	\N	Samuel Carter 47641	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2084	TxId: 52713686775	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-05 20:15:43	0.00	10490.00	\N	Samuel Carter 70583	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2085	TxId: 18813391203	\N	3000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-06 15:49:27	0.00	5890.00	\N	Robert Brown 35273	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2086	TxId: 14741959916	\N	4800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-06 18:54:55	0.00	16090.00	\N	Robert Brown 32723	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2087	TxId: 37507241088	\N	24000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-08 00:35:28	0.00	126360.00	\N	Linda Green 14558	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2088	TxId: 88126214143	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-08 01:06:23	0.00	124860.00	\N	Alex Doe 80465	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2089	TxId: 95649567862	\N	4500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-08 01:19:44	0.00	98760.00	\N	Samuel Carter 78619	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2090	TxId: 10083689781	\N	17000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-08 02:40:12	0.00	79720.00	\N	Jane Smith 85339	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2091	TxId: 68925556497	\N	14500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-08 13:34:58	0.00	63180.00	\N	Robert Brown 39629	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2092	TxId: 90275359445	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-08 14:52:31	0.00	61680.00	\N	Robert Brown 12774	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2093	TxId: 87571566840	\N	700.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-08 17:25:33	0.00	51840.00	\N	Jane Smith 60790	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2094	TxId: 13774628019	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-09 13:12:50	0.00	19470.00	\N	Linda Green 30786	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2095	TxId: 65478956735	\N	900.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-09 13:36:20	0.00	16970.00	\N	Robert Brown 77191	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2096	TxId: 96684440213	\N	6500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-09 21:25:55	0.00	10470.00	\N	Alex Doe 30414	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2097	TxId: 10893465854	\N	5000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-09 23:25:36	0.00	3870.00	\N	Linda Green 84616	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2098	TxId: 18269992033	\N	4000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-10 00:14:51	0.00	49870.00	\N	Jane Smith 88876	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2099	TxId: 79540204158	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-10 10:34:21	0.00	11380.00	\N	Linda Green 77048	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2100	TxId: 21123163485	\N	10000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-10 18:17:34	0.00	48280.00	\N	Linda Green 41295	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2101	TxId: 67195404064	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-10 20:35:31	0.00	21430.00	\N	Linda Green 65405	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2102	TxId: 52003402612	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-11 09:47:40	0.00	19930.00	\N	Robert Brown 11621	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2103	TxId: 70460358419	\N	2500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-11 14:08:49	0.00	14330.00	\N	Samuel Carter 79967	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2104	TxId: 14667936406	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-11 16:11:33	0.00	9830.00	\N	Linda Green 57182	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2105	TxId: 20823828008	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-11 20:08:43	0.00	8830.00	\N	Alex Doe 11421	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2106	TxId: 40728069150	\N	700.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-12 15:59:52	0.00	4210.00	\N	Samuel Carter 87737	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2107	TxId: 60033930579	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-12 20:27:49	0.00	33260.00	\N	Robert Brown 65442	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2108	TxId: 90380679208	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-12 20:36:08	0.00	31260.00	\N	Linda Green 51673	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2109	TxId: 12313178673	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-13 13:52:26	0.00	28260.00	\N	Samuel Carter 98382	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2110	TxId: 57207221830	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-13 18:36:29	0.00	20560.00	\N	Alex Doe 22803	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2111	TxId: 72944989836	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-13 19:11:13	0.00	13960.00	\N	Alex Doe 31890	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2112	TxId: 97178498053	\N	5300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-13 22:55:00	0.00	5040.00	\N	Jane Smith 63271	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2113	TxId: 80693378371	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-14 07:55:25	0.00	800.00	\N	Robert Brown 72729	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2114	TxId: 77217198389	\N	1200.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-14 11:58:45	0.00	49600.00	\N	Linda Green 28799	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2115	TxId: 91279986205	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-14 16:16:51	0.00	2250.00	\N	Jane Smith 75402	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2116	TxId: 28826953210	\N	50000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-14 18:05:24	0.00	52250.00	\N	Samuel Carter 28438	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2117	TxId: 17948439353	\N	3000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-14 18:06:02	0.00	49250.00	\N	Alex Doe 97683	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2118	TxId: 36356336397	\N	13500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-14 19:51:22	0.00	35750.00	\N	Robert Brown 38807	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2119	TxId: 69586541013	\N	500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-14 19:51:56	0.00	35250.00	\N	Alex Doe 72148	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2120	TxId: 94012583928	\N	4500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-16 13:42:51	0.00	0.00	\N	Linda Green 64137	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2121	TxId: 37418547572	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-17 13:41:43	0.00	46500.00	\N	Samuel Carter 71202	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2122	TxId: 31576458916	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-17 20:28:12	0.00	23050.00	\N	Alex Doe 32980	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2123	TxId: 36553832778	\N	5200.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-17 20:52:49	0.00	17850.00	\N	Jane Smith 25602	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2124	TxId: 67555624275	\N	3000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-18 14:33:38	0.00	7750.00	\N	Jane Smith 31472	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2125	TxId: 89855734028	\N	2500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-18 20:16:43	0.00	5250.00	\N	Linda Green 15747	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2126	TxId: 82996055356	\N	2100.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-18 21:03:19	0.00	3150.00	\N	Samuel Carter 27184	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2127	TxId: 97916279369	\N	4000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-18 22:41:24	0.00	19150.00	\N	Samuel Carter 33416	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2128	TxId: 48524994396	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-19 13:52:25	0.00	2930.00	\N	Samuel Carter 96667	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2129	TxId: 78688834340	\N	14100.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-19 15:26:39	0.00	38830.00	\N	Jane Smith 20307	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2130	TxId: 60193532268	\N	1300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-19 20:48:35	0.00	37530.00	\N	Jane Smith 94080	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2131	TxId: 60158780091	\N	40000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-20 09:04:32	0.00	2530.00	\N	Robert Brown 90615	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2132	TxId: 35202815280	\N	2500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-20 13:57:08	0.00	30.00	\N	Jane Smith 35376	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2133	TxId: 32371477638	\N	3300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-20 20:45:31	0.00	41630.00	\N	Jane Smith 67795	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2134	TxId: 15188663338	\N	3000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-21 13:55:42	0.00	38630.00	\N	Samuel Carter 14192	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2135	TxId: 46064965737	\N	700.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-21 14:02:42	0.00	37930.00	\N	Robert Brown 76517	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2136	TxId: 13372675354	\N	28700.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-22 13:40:12	0.00	36900.00	\N	Jane Smith 65293	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2137	TxId: 17063216498	\N	700.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-22 13:52:52	0.00	36200.00	\N	Robert Brown 81980	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2138	TxId: 62962558714	\N	5000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-22 19:28:32	0.00	12600.00	\N	Samuel Carter 42535	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2139	TxId: 37376382898	\N	5800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-23 13:32:53	0.00	4650.00	\N	Robert Brown 40003	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2140	TxId: 68217644339	\N	35300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-23 23:30:42	0.00	15000.00	\N	Linda Green 92413	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2141	TxId: 24296251142	\N	800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-24 13:13:08	0.00	10580.00	\N	Samuel Carter 61804	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2142	TxId: 90644334751	\N	2500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-24 13:13:47	0.00	8080.00	\N	Alex Doe 73621	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2143	TxId: 79921659205	\N	4000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-24 20:55:31	0.00	17180.00	\N	Alex Doe 42875	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2144	TxId: 94510396651	\N	900.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-25 02:00:50	0.00	10930.00	\N	Linda Green 65441	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2145	TxId: 55341611618	\N	4700.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-25 14:44:53	0.00	6230.00	\N	Alex Doe 13898	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2146	TxId: 78265898230	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-25 20:33:32	0.00	130.00	\N	Robert Brown 53148	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2147	TxId: 51862934722	\N	2500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-26 17:19:03	0.00	29360.00	\N	Samuel Carter 33261	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2148	TxId: 91477230630	\N	40000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-26 19:45:19	0.00	9360.00	\N	Samuel Carter 26001	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2149	TxId: 98785716472	\N	2500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-26 20:54:04	0.00	6860.00	\N	Samuel Carter 27736	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2150	TxId: 60169531477	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-26 21:14:46	0.00	4860.00	\N	Robert Brown 74029	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2151	TxId: 18182747024	\N	300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-26 21:16:51	0.00	4560.00	\N	Samuel Carter 94344	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2152	TxId: 33085803334	\N	3000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-27 13:47:15	0.00	1560.00	\N	Robert Brown 77907	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2153	TxId: 39214139430	\N	10000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-29 11:42:28	0.00	33210.00	\N	Alex Doe 38961	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2154	TxId: 90902383993	\N	2500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-29 22:39:39	0.00	5260.00	\N	Jane Smith 53237	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2155	TxId: 10659235728	\N	12100.00	Completed	MoMo code payments	Payment to MoMo codes	2024-09-30 07:31:38	0.00	23160.00	\N	Linda Green 76028	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2156	TxId: 39663280584	\N	3300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-01 13:31:44	0.00	19610.00	\N	Jane Smith 32608	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2157	TxId: 81871013229	\N	50000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-01 17:25:52	0.00	19610.00	\N	Jane Smith 17271	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2158	TxId: 44506228015	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-01 19:22:41	0.00	18610.00	\N	Alex Doe 16975	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2159	TxId: 83067244660	\N	2500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-02 14:31:09	0.00	16110.00	\N	Linda Green 84722	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2160	TxId: 20546538645	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-02 18:46:35	0.00	107862.00	\N	Alex Doe 23231	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2161	TxId: 35245414129	\N	11000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-02 21:26:59	0.00	58612.00	\N	Samuel Carter 36197	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2162	TxId: 32286024625	\N	5000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-03 16:50:15	0.00	4012.00	\N	Linda Green 96457	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2163	TxId: 90308181228	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-04 13:03:26	0.00	12.00	\N	Jane Smith 60129	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2164	TxId: 18477975094	\N	700.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-04 19:45:23	0.00	19312.00	\N	Samuel Carter 49614	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2165	TxId: 85146339192	\N	11000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-04 22:13:47	0.00	8312.00	\N	Jane Smith 29099	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2166	TxId: 82638981577	\N	3000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-05 17:00:14	0.00	1962.00	\N	Linda Green 41515	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2167	TxId: 24060951845	\N	20000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-05 17:11:28	0.00	31962.00	\N	Alex Doe 71300	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2168	TxId: 48231394901	\N	300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-05 17:19:04	0.00	31662.00	\N	Samuel Carter 58485	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2169	TxId: 77445681586	\N	23500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-06 22:41:26	0.00	9912.00	\N	Linda Green 95616	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2170	TxId: 22996639471	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-06 23:15:21	0.00	8912.00	\N	Samuel Carter 53959	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2171	TxId: 89752753163	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-07 13:25:28	0.00	7312.00	\N	Samuel Carter 51917	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2172	TxId: 43532820450	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-07 19:33:59	0.00	8812.00	\N	Robert Brown 43078	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2173	TxId: 58196919753	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-07 19:34:44	0.00	7812.00	\N	Jane Smith 58193	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2174	TxId: 37468876171	\N	9000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-07 22:07:14	0.00	1812.00	\N	Alex Doe 39002	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2175	TxId: 88108852426	\N	4500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-08 18:08:50	0.00	45212.00	\N	Linda Green 81102	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2176	TxId: 31762210000	\N	40000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-08 18:17:29	0.00	5212.00	\N	Jane Smith 80896	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2177	TxId: 13398096034	\N	9000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-08 20:48:31	0.00	3962.00	\N	Alex Doe 41138	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2178	TxId: 67853860784	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-09 20:15:17	0.00	2962.00	\N	Linda Green 21555	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2179	TxId: 59663284115	\N	10000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-09 22:27:22	0.00	22962.00	\N	Jane Smith 78295	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2180	TxId: 11340322119	\N	2500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-10 19:29:44	0.00	145705.00	\N	Robert Brown 55356	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2181	TxId: 53889847709	\N	4000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-11 13:51:14	0.00	81255.00	\N	Robert Brown 12519	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2182	TxId: 77321308899	\N	40000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-11 16:23:45	0.00	29655.00	\N	Robert Brown 97461	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2183	TxId: 79562421324	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-11 18:02:30	0.00	22655.00	\N	Robert Brown 71523	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2184	TxId: 13398775256	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-11 18:52:10	0.00	20655.00	\N	Alex Doe 97941	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2185	TxId: 83779362556	\N	20500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-12 17:59:13	0.00	32105.00	\N	Robert Brown 98029	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2186	TxId: 15010571728	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-12 18:20:17	0.00	31105.00	\N	Jane Smith 61914	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2187	TxId: 69826234262	\N	2500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-13 09:30:09	0.00	28605.00	\N	Samuel Carter 89824	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2188	TxId: 64182407557	\N	3900.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-13 09:56:56	0.00	21705.00	\N	Samuel Carter 73206	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2189	TxId: 22165640182	\N	15000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-13 13:16:16	0.00	6705.00	\N	Jane Smith 29963	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2190	TxId: 83014570594	\N	10000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-14 11:35:35	0.00	52605.00	\N	Linda Green 36659	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2191	TxId: 88832399279	\N	10000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-14 19:50:40	0.00	12355.00	\N	Linda Green 70896	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2192	TxId: 52293280519	\N	20000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-16 16:44:03	0.00	108151.00	\N	Linda Green 93041	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2193	TxId: 38148168525	\N	10000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-16 19:55:39	0.00	98151.00	\N	Alex Doe 90011	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2194	TxId: 81760735419	\N	7000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-16 19:57:21	0.00	91151.00	\N	Samuel Carter 55521	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2195	TxId: 53606315017	\N	13800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-16 22:35:41	0.00	33150.00	\N	Samuel Carter 21475	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2196	TxId: 59905850736	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-17 13:55:04	0.00	24550.00	\N	Linda Green 85852	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2197	TxId: 54242334327	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-17 20:16:44	0.00	13450.00	\N	Alex Doe 95294	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2198	TxId: 88072671762	\N	37500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-18 19:50:21	0.00	16250.00	\N	Samuel Carter 73641	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2199	TxId: 45748335313	\N	10000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-18 21:07:02	0.00	6250.00	\N	Samuel Carter 99589	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2200	TxId: 59362114751	\N	10500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-19 11:41:42	0.00	15750.00	\N	Jane Smith 54994	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2201	TxId: 31169956538	\N	10750.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-20 01:07:20	0.00	0.00	\N	Linda Green 95179	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2202	TxId: 18750556052	\N	600.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-20 19:54:09	0.00	132472.00	\N	Samuel Carter 57978	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2203	TxId: 89091466523	\N	2200.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-20 21:08:22	0.00	120272.00	\N	Robert Brown 95098	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2204	TxId: 15223201812	\N	15500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-21 11:39:33	0.00	82522.00	\N	Linda Green 79333	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2205	TxId: 68316839601	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-21 19:56:38	0.00	81522.00	\N	Alex Doe 84251	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2206	TxId: 76509859651	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-21 20:23:54	0.00	80522.00	\N	Samuel Carter 38134	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2207	TxId: 93902902643	\N	2500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-21 20:54:24	0.00	78022.00	\N	Samuel Carter 49012	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2208	TxId: 75970255069	\N	7000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-21 22:08:05	0.00	71022.00	\N	Linda Green 69696	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2209	TxId: 43332595746	\N	15000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-21 23:27:47	0.00	56022.00	\N	Samuel Carter 53208	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2210	TxId: 83978461332	\N	500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-22 20:39:14	0.00	55522.00	\N	Linda Green 95541	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2211	TxId: 66774240369	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-22 21:07:01	0.00	54522.00	\N	Jane Smith 58118	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2212	TxId: 18510016190	\N	3000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-22 21:10:41	0.00	51522.00	\N	Alex Doe 13830	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2213	TxId: 11365396250	\N	4000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-22 21:22:20	0.00	47522.00	\N	Linda Green 63600	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2214	TxId: 14589884783	\N	16500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-22 23:12:21	0.00	31022.00	\N	Linda Green 94096	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2215	TxId: 95337556627	\N	4500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-23 18:42:05	0.00	49072.00	\N	Linda Green 44588	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2216	TxId: 44650869478	\N	11800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-23 23:43:13	0.00	21922.00	\N	Jane Smith 44671	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2217	TxId: 30398814444	\N	1200.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-23 23:44:08	0.00	20722.00	\N	Jane Smith 74010	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2218	TxId: 31630879946	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-24 13:32:41	0.00	17222.00	\N	Alex Doe 98340	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2219	TxId: 87927056212	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-24 16:34:12	0.00	10122.00	\N	Alex Doe 58576	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2220	TxId: 24961498802	\N	500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-24 18:45:55	0.00	9102.00	\N	Robert Brown 92471	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2221	TxId: 96078845608	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-24 19:46:38	0.00	8102.00	\N	Jane Smith 21336	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2222	TxId: 27937789255	\N	1200.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-24 20:05:22	0.00	6902.00	\N	Samuel Carter 74056	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2223	TxId: 35915635698	\N	5000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-24 20:06:36	0.00	1902.00	\N	Samuel Carter 33376	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2224	TxId: 87101311151	\N	3000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-25 00:33:37	0.00	18382.00	\N	Samuel Carter 41674	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2225	TxId: 63847414444	\N	22000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-25 23:11:45	0.00	932.00	\N	Samuel Carter 43558	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2226	TxId: 53085798464	\N	8000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-26 21:52:55	0.00	42932.00	\N	Jane Smith 99510	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2227	TxId: 12026466377	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-26 21:57:32	0.00	41432.00	\N	Jane Smith 96105	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2228	TxId: 84906022239	\N	10000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-27 14:58:25	0.00	29832.00	\N	Linda Green 92330	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2229	TxId: 63406615894	\N	1200.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-28 19:51:49	0.00	8282.00	\N	Linda Green 42626	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2230	TxId: 79191608492	\N	500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-28 21:04:32	0.00	7782.00	\N	Jane Smith 41853	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2231	TxId: 97616156692	\N	13500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-28 22:57:12	0.00	44282.00	\N	Jane Smith 89857	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2232	TxId: 76120536586	\N	8000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-29 13:18:12	0.00	36282.00	\N	Alex Doe 68678	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2233	TxId: 87234068654	\N	8400.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-29 23:54:48	0.00	16612.00	\N	Alex Doe 81429	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2234	TxId: 81838722855	\N	4000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-30 17:33:30	0.00	12612.00	\N	Linda Green 64373	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2235	TxId: 63710134665	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-30 20:51:25	0.00	11612.00	\N	Jane Smith 73638	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2236	TxId: 22834010377	\N	11000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-30 22:18:18	0.00	612.00	\N	Alex Doe 28569	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2237	TxId: 28043130256	\N	9000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-30 23:47:49	0.00	36612.00	\N	Samuel Carter 40783	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2238	TxId: 19221386945	\N	5700.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-31 18:22:00	0.00	7142.00	\N	Samuel Carter 88993	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2239	TxId: 95154102352	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-31 20:57:34	0.00	6142.00	\N	Samuel Carter 91279	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2240	TxId: 85450886922	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-31 21:35:02	0.00	24892.00	\N	Jane Smith 71611	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2241	TxId: 91900163647	\N	20250.00	Completed	MoMo code payments	Payment to MoMo codes	2024-10-31 23:52:26	0.00	4122.00	\N	Linda Green 87167	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2242	TxId: 27925177838	\N	3000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-02 01:24:51	0.00	11372.00	\N	Linda Green 58812	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2243	TxId: 32029523207	\N	4800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-02 11:18:45	0.00	3472.00	\N	Linda Green 92839	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2244	TxId: 31684502107	\N	6500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-02 14:06:42	0.00	16972.00	\N	Linda Green 73815	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2245	TxId: 98072616886	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-02 15:47:43	0.00	14452.00	\N	Jane Smith 10418	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2246	TxId: 74940646559	\N	15000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-03 14:53:23	0.00	13332.00	\N	Alex Doe 13113	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2247	TxId: 76489114849	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-04 10:08:52	0.00	9712.00	\N	Robert Brown 83268	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2248	TxId: 90771619158	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-04 17:15:57	0.00	8212.00	\N	Samuel Carter 28573	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2249	TxId: 96847302038	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-05 13:30:37	0.00	14212.00	\N	Alex Doe 27166	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2250	TxId: 52306931698	\N	9300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-05 18:19:33	0.00	4912.00	\N	Linda Green 20136	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2251	TxId: 84422936261	\N	500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-05 20:01:14	0.00	4412.00	\N	Alex Doe 30015	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2252	TxId: 80762432902	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-05 21:06:48	0.00	3412.00	\N	Robert Brown 38967	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2253	TxId: 12941586465	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-05 21:48:31	0.00	2412.00	\N	Robert Brown 53484	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2254	TxId: 32932185216	\N	2200.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-05 21:51:02	0.00	212.00	\N	Jane Smith 78202	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2255	TxId: 22620644869	\N	1400.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-05 21:55:42	0.00	8812.00	\N	Alex Doe 98278	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2256	TxId: 12285281137	\N	3300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-06 13:12:20	0.00	64117.00	\N	Linda Green 25501	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2257	TxId: 72077076399	\N	500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-06 19:14:13	0.00	51367.00	\N	Samuel Carter 87234	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2258	TxId: 17695655335	\N	500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-06 20:39:10	0.00	50867.00	\N	Samuel Carter 34028	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2259	TxId: 47323864863	\N	4700.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-06 20:47:04	0.00	46167.00	\N	Robert Brown 44418	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2260	TxId: 51185805957	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-07 14:14:42	0.00	36567.00	\N	Alex Doe 37459	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2261	TxId: 64693883303	\N	500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-07 21:31:29	0.00	35547.00	\N	Jane Smith 28704	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2262	TxId: 32239374076	\N	4600.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-07 23:18:35	0.00	30947.00	\N	Samuel Carter 26095	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2263	TxId: 41292933584	\N	40000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-08 10:01:18	0.00	20947.00	\N	Samuel Carter 71943	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2264	TxId: 57030093247	\N	600.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-08 13:31:56	0.00	20347.00	\N	Linda Green 98470	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2265	TxId: 68677426758	\N	1600.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-08 18:52:06	0.00	3497.00	\N	Robert Brown 20066	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2266	TxId: 29539835456	\N	10000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-08 21:34:05	0.00	33397.00	\N	Linda Green 71899	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2267	TxId: 53740527535	\N	26000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-09 00:27:35	0.00	6377.00	\N	Samuel Carter 89478	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2268	TxId: 55287216793	\N	1200.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-09 07:14:39	0.00	4157.00	\N	Samuel Carter 62378	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2269	TxId: 61476126603	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-09 07:15:06	0.00	2157.00	\N	Linda Green 92801	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2270	TxId: 23756291424	\N	17000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-09 20:14:11	0.00	51842.00	\N	Jane Smith 93184	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2271	TxId: 79800269407	\N	78000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-10 01:04:11	0.00	622.00	\N	Alex Doe 35226	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2272	TxId: 62769441387	\N	25900.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-11 18:51:12	0.00	4722.00	\N	Jane Smith 78110	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2273	TxId: 57206973697	\N	500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-11 19:18:22	0.00	4222.00	\N	Linda Green 18596	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2274	TxId: 67320713042	\N	7900.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-11 19:50:57	0.00	1322.00	\N	Jane Smith 23165	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2275	TxId: 56966147157	\N	200.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-11 19:54:46	0.00	1122.00	\N	Samuel Carter 64964	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2276	TxId: 96703530751	\N	3000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-12 13:32:02	0.00	2022.00	\N	Jane Smith 84743	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2277	TxId: 50100917269	\N	500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-12 19:34:27	0.00	1522.00	\N	Alex Doe 82575	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2278	TxId: 62656383062	\N	500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-12 20:27:04	0.00	1022.00	\N	Robert Brown 64685	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2279	TxId: 94631078749	\N	3000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-12 21:43:55	0.00	8022.00	\N	Alex Doe 81659	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2280	TxId: 76861068912	\N	16000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-13 00:00:27	0.00	12022.00	\N	Robert Brown 36138	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2281	TxId: 68167518530	\N	2500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-13 14:58:24	0.00	2522.00	\N	Robert Brown 66760	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2282	TxId: 53670708085	\N	4000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-13 23:44:45	0.00	7432.00	\N	Robert Brown 50887	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2283	TxId: 16283271112	\N	30000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-14 20:39:04	0.00	24022.00	\N	Robert Brown 34704	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2284	TxId: 77064133585	\N	10000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-14 22:01:44	0.00	14022.00	\N	Jane Smith 97256	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2285	TxId: 54178902109	\N	800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-15 15:16:11	0.00	8122.00	\N	Alex Doe 24330	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2286	TxId: 54792622020	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-15 18:14:10	0.00	7122.00	\N	Alex Doe 81580	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2287	TxId: 49452512289	\N	600.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-15 18:22:31	0.00	6522.00	\N	Robert Brown 58171	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2288	TxId: 82479923721	\N	5700.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-15 22:12:52	0.00	822.00	\N	Jane Smith 79703	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2289	TxId: 63834300936	\N	6300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-16 17:28:21	0.00	3902.00	\N	Alex Doe 59540	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2290	TxId: 75381717541	\N	2500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-16 18:51:13	0.00	1402.00	\N	Linda Green 53212	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2291	TxId: 19451958132	\N	40000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-17 13:12:56	0.00	95748.00	\N	Alex Doe 45298	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2292	TxId: 70271999796	\N	4500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-17 14:05:53	0.00	91248.00	\N	Alex Doe 64524	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2293	TxId: 50182287789	\N	25000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-17 23:25:14	0.00	64648.00	\N	Alex Doe 70566	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2294	TxId: 52735784344	\N	4500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-18 14:18:41	0.00	60148.00	\N	Alex Doe 92263	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2295	TxId: 69693617235	\N	600.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-18 16:19:48	0.00	19298.00	\N	Samuel Carter 81032	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2296	TxId: 15146134181	\N	9300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-18 18:52:18	0.00	114186.00	\N	Jane Smith 63456	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2297	TxId: 91836203944	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-18 20:16:09	0.00	112186.00	\N	Alex Doe 41036	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2298	TxId: 35247235522	\N	6000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-19 22:41:05	0.00	75236.00	\N	Jane Smith 28861	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2299	TxId: 51960195659	\N	40000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-20 12:16:44	0.00	32636.00	\N	Jane Smith 64793	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2300	TxId: 51637767958	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-20 18:16:34	0.00	21536.00	\N	Robert Brown 59828	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2301	TxId: 63832588568	\N	18000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-20 23:06:57	0.00	3536.00	\N	Robert Brown 19929	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2302	TxId: 17739493764	\N	10000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-21 11:52:03	0.00	12167.00	\N	Jane Smith 74242	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2303	TxId: 58201924130	\N	4000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-21 20:49:38	0.00	967.00	\N	Robert Brown 23131	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2304	TxId: 36782365869	\N	10000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-21 21:14:11	0.00	125435.00	\N	Samuel Carter 91156	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2305	TxId: 43160125858	\N	23000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-21 22:28:43	0.00	102435.00	\N	Robert Brown 34217	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2306	TxId: 70636809967	\N	78000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-22 00:20:42	0.00	24435.00	\N	Alex Doe 74053	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2307	TxId: 44041838566	\N	107184.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-22 15:01:46	0.00	93001.00	\N	Alex Doe 91765	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2308	TxId: 22997289029	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-22 16:15:56	0.00	91001.00	\N	Samuel Carter 54183	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2309	TxId: 82106121513	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-22 16:18:12	0.00	89501.00	\N	Alex Doe 17945	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2310	TxId: 10620670791	\N	36000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-22 23:38:21	0.00	53501.00	\N	Jane Smith 67559	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2311	TxId: 35896509195	\N	41000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-24 12:21:33	0.00	25922.00	\N	Robert Brown 65386	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2312	TxId: 84035130850	\N	1600.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-24 13:33:09	0.00	24322.00	\N	Alex Doe 41364	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2313	TxId: 96504237860	\N	15500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-24 15:31:51	0.00	8822.00	\N	Samuel Carter 62070	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2314	TxId: 78289351585	\N	500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-24 15:39:44	0.00	8322.00	\N	Jane Smith 45265	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2315	TxId: 72378502864	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-24 16:49:28	0.00	6822.00	\N	Robert Brown 83466	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2316	TxId: 48478800335	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-25 09:34:52	0.00	5822.00	\N	Linda Green 88347	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2317	TxId: 55816563993	\N	7000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-25 15:48:24	0.00	8822.00	\N	Alex Doe 74025	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2318	TxId: 71214421293	\N	5300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-25 19:51:44	0.00	3522.00	\N	Linda Green 76916	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2319	TxId: 48536966202	\N	8000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-26 13:42:36	0.00	23172.00	\N	Linda Green 58734	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2320	TxId: 38897384275	\N	2500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-26 20:46:45	0.00	20152.00	\N	Linda Green 64580	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2321	TxId: 42838068588	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-26 21:19:24	0.00	19152.00	\N	Jane Smith 18325	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2322	TxId: 39305056580	\N	3600.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-26 21:23:35	0.00	15552.00	\N	Alex Doe 44482	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2323	TxId: 23077076861	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-27 13:36:37	0.00	26052.00	\N	Samuel Carter 16167	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2324	TxId: 66106452523	\N	4500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-27 18:47:21	0.00	19452.00	\N	Alex Doe 66311	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2325	TxId: 20585797761	\N	14000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-27 21:26:58	0.00	5452.00	\N	Alex Doe 91714	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2326	TxId: 48062023691	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-28 20:53:10	0.00	47352.00	\N	Robert Brown 97308	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2327	TxId: 56257770091	\N	11500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-28 23:13:52	0.00	35852.00	\N	Alex Doe 35724	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2328	TxId: 21855529824	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-29 13:42:39	0.00	1712.00	\N	Alex Doe 86590	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2329	TxId: 35022569513	\N	43700.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-29 23:15:12	0.00	8012.00	\N	Samuel Carter 90805	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2330	TxId: 89671501317	\N	25100.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-30 14:22:39	0.00	85892.00	\N	Jane Smith 75635	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2331	TxId: 11135974601	\N	6200.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-30 14:25:04	0.00	79692.00	\N	Alex Doe 97609	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2332	TxId: 21899972101	\N	208750.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-30 16:35:05	0.00	70742.00	\N	Linda Green 54562	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2333	TxId: 41127800959	\N	16000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-11-30 18:47:41	0.00	49042.00	\N	Alex Doe 35478	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2334	TxId: 46181498529	\N	20000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-02 18:58:22	0.00	83944.00	\N	Linda Green 37994	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2335	TxId: 39367315432	\N	2500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-02 19:03:24	0.00	80424.00	\N	Linda Green 57210	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2336	TxId: 54832853783	\N	800.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-02 19:28:05	0.00	79624.00	\N	Robert Brown 67564	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2337	TxId: 49470186297	\N	20000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-02 21:27:30	0.00	59624.00	\N	Jane Smith 15356	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2338	TxId: 58399013847	\N	40000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-03 11:41:01	0.00	16524.00	\N	Samuel Carter 87280	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2339	TxId: 32104617984	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-03 13:13:35	0.00	2924.00	\N	Robert Brown 54734	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2340	TxId: 70799475893	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-03 19:16:35	0.00	1424.00	\N	Robert Brown 52041	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2341	TxId: 47209547707	\N	11000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-04 22:58:00	0.00	4124.00	\N	Alex Doe 43240	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2342	TxId: 93029036539	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-05 13:07:25	0.00	624.00	\N	Alex Doe 48412	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2343	TxId: 99213721569	\N	2500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-05 19:47:08	0.00	21024.00	\N	Jane Smith 54123	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2344	TxId: 15669847093	\N	11000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-05 22:01:47	0.00	10024.00	\N	Samuel Carter 58202	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2345	TxId: 89862603085	\N	27600.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-07 12:57:25	0.00	31524.00	\N	Alex Doe 88215	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2346	TxId: 33953051219	\N	6532.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-07 17:40:10	0.00	14892.00	\N	Alex Doe 16921	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2347	TxId: 41885909187	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-07 17:57:32	0.00	13892.00	\N	Jane Smith 70736	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2348	TxId: 95870127706	\N	3000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-08 17:19:56	0.00	792.00	\N	Linda Green 92842	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2349	TxId: 37194978837	\N	3300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-08 19:26:55	0.00	47492.00	\N	Linda Green 28118	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2350	TxId: 71359588682	\N	4000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-08 19:34:06	0.00	43492.00	\N	Samuel Carter 26869	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2351	TxId: 37711041058	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-09 21:31:53	0.00	12242.00	\N	Alex Doe 47347	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2352	TxId: 94221988885	\N	17500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-09 23:44:16	0.00	4742.00	\N	Samuel Carter 67760	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2353	TxId: 72231619373	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-10 16:45:12	0.00	6142.00	\N	Robert Brown 11851	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2354	TxId: 66539582201	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-10 20:04:51	0.00	2142.00	\N	Alex Doe 88184	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2355	TxId: 46343939313	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-10 20:07:27	0.00	142.00	\N	Alex Doe 57668	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2356	TxId: 86771299813	\N	2200.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-11 21:06:13	0.00	40642.00	\N	Samuel Carter 52782	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2357	TxId: 45962008824	\N	5000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-12 20:44:44	0.00	35142.00	\N	Robert Brown 82501	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2358	TxId: 16767909062	\N	9500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-14 19:05:15	0.00	151.00	\N	Robert Brown 39839	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2359	TxId: 84054827778	\N	35000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-14 23:19:59	0.00	100291.00	\N	Jane Smith 15196	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2360	TxId: 88725319180	\N	20500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-15 00:32:02	0.00	79791.00	\N	Jane Smith 38526	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2361	TxId: 77222748548	\N	31000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-15 16:03:31	0.00	32991.00	\N	Samuel Carter 14652	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2362	TxId: 17878271668	\N	30500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-15 18:29:55	0.00	24291.00	\N	Linda Green 38097	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2363	TxId: 35727276550	\N	25300.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-16 10:54:20	0.00	4891.00	\N	Robert Brown 55886	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2364	TxId: 34560987595	\N	40000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-17 08:54:26	0.00	89592.00	\N	Alex Doe 35852	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2365	TxId: 64898321363	\N	11750.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-17 14:51:36	0.00	77842.00	\N	Robert Brown 37855	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2366	TxId: 76380162722	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-17 14:58:21	0.00	76342.00	\N	Alex Doe 48372	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2367	TxId: 82617046769	\N	400.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-18 21:50:27	0.00	31792.00	\N	Samuel Carter 92374	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2368	TxId: 57516315891	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-18 22:15:54	0.00	28292.00	\N	Jane Smith 47279	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2369	TxId: 60930083503	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-19 12:21:29	0.00	25192.00	\N	Robert Brown 43272	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2370	TxId: 15885497602	\N	8000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-19 23:30:55	0.00	1992.00	\N	Robert Brown 88769	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2371	TxId: 19391512835	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-20 11:59:44	0.00	19992.00	\N	Jane Smith 33257	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2372	TxId: 17798210186	\N	2200.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-21 13:05:31	0.00	4342.00	\N	Alex Doe 72364	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2373	TxId: 94602885416	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-22 14:33:11	0.00	35822.00	\N	Linda Green 92343	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2374	TxId: 40325712376	\N	11600.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-22 14:46:25	0.00	24222.00	\N	Alex Doe 80143	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2375	TxId: 88953152367	\N	8250.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-22 19:45:51	0.00	15972.00	\N	Alex Doe 30069	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2376	TxId: 70853207718	\N	2040.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-22 19:49:23	0.00	13932.00	\N	Jane Smith 68739	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2377	TxId: 86091303323	\N	4000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-23 00:19:00	0.00	1132.00	\N	Samuel Carter 61524	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2378	TxId: 76924527055	\N	15000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-23 00:42:46	0.00	36132.00	\N	Samuel Carter 72475	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2379	TxId: 86101897464	\N	4000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-23 00:53:05	0.00	32132.00	\N	Robert Brown 70207	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2380	TxId: 26959913460	\N	4000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-23 01:57:15	0.00	28132.00	\N	Jane Smith 18434	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2381	TxId: 47314034059	\N	40000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-23 18:10:03	0.00	18032.00	\N	Samuel Carter 43362	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2382	TxId: 18331674229	\N	2500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-23 19:56:47	0.00	15532.00	\N	Alex Doe 98062	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2383	TxId: 24101990460	\N	30000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-24 22:59:50	0.00	124134.00	\N	Linda Green 73777	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2384	TxId: 36173508232	\N	27500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-26 00:02:20	0.00	105334.00	\N	Robert Brown 65225	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2385	TxId: 83297515675	\N	20900.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-26 19:21:12	0.00	84434.00	\N	Robert Brown 27754	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2386	TxId: 91646737384	\N	19200.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-27 02:01:56	0.00	58134.00	\N	Alex Doe 41445	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2387	TxId: 32322247458	\N	4500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-27 16:51:25	0.00	43634.00	\N	Robert Brown 65260	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2388	TxId: 25739550229	\N	6000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-27 19:39:17	0.00	41184.00	\N	Alex Doe 10834	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2389	TxId: 99751172452	\N	12000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-27 21:44:41	0.00	19084.00	\N	Linda Green 77386	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2390	TxId: 50448841591	\N	2200.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-27 21:49:32	0.00	16884.00	\N	Samuel Carter 35285	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2391	TxId: 46963818865	\N	17000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-28 21:23:45	0.00	18864.00	\N	Jane Smith 35486	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2392	TxId: 78301179486	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-28 22:44:28	0.00	16864.00	\N	Linda Green 36261	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2393	TxId: 34561368106	\N	33000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-29 14:02:58	0.00	33864.00	\N	Robert Brown 94662	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2394	TxId: 87189301259	\N	1950.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-29 16:12:26	0.00	26814.00	\N	Robert Brown 17324	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2395	TxId: 32473306579	\N	2500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-29 18:44:05	0.00	24314.00	\N	Jane Smith 25428	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2396	TxId: 11332825043	\N	8000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-30 16:39:40	0.00	43779.00	\N	Linda Green 11500	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2397	TxId: 58861772799	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-30 19:16:17	0.00	38479.00	\N	Linda Green 99703	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2398	TxId: 79491078117	\N	9500.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-30 22:08:23	0.00	28979.00	\N	Alex Doe 14352	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2399	TxId: 26480204749	\N	8100.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-31 17:17:13	0.00	96612.00	\N	Robert Brown 76867	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2400	TxId: 11689124968	\N	14000.00	Completed	MoMo code payments	Payment to MoMo codes	2024-12-31 23:57:02	0.00	66262.00	\N	Alex Doe 20492	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2401	TxId: 35592207581	\N	11800.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-01 20:45:08	0.00	33212.00	\N	Jane Smith 85059	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2402	TxId: 48873092706	\N	2000.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-02 14:43:22	0.00	48222.00	\N	Alex Doe 29339	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2403	TxId: 56839942126	\N	300.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-02 14:53:29	0.00	47922.00	\N	Linda Green 43036	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2404	TxId: 82394883480	\N	12000.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-02 18:55:40	0.00	35922.00	\N	Linda Green 15355	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2405	TxId: 93254937757	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-02 20:28:56	0.00	1922.00	\N	Linda Green 72867	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2406	TxId: 31144936614	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-03 21:59:40	0.00	29472.00	\N	Alex Doe 18193	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2407	TxId: 47955567230	\N	5400.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-03 22:04:13	0.00	24072.00	\N	Linda Green 80598	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2408	TxId: 51461434870	\N	11000.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-04 20:08:48	0.00	13072.00	\N	Jane Smith 58502	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2409	TxId: 26095846303	\N	20000.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-05 16:48:20	0.00	123087.00	\N	Robert Brown 84840	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2410	TxId: 29138578472	\N	10000.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-05 19:15:00	0.00	111487.00	\N	Linda Green 49806	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2411	TxId: 42047000517	\N	4000.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-05 19:29:41	0.00	107487.00	\N	Alex Doe 72191	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2412	TxId: 93141088379	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-06 13:33:27	0.00	103987.00	\N	Jane Smith 99835	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2413	TxId: 50185533867	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-06 18:50:01	0.00	29237.00	\N	Samuel Carter 11320	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2414	TxId: 12490495576	\N	10000.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-07 00:00:48	0.00	36449.00	\N	Linda Green 27044	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2415	TxId: 64907673038	\N	2500.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-07 18:45:08	0.00	21699.00	\N	Samuel Carter 11135	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2416	TxId: 32539170420	\N	200.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-07 19:10:44	0.00	21499.00	\N	Jane Smith 71988	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2417	TxId: 78103204977	\N	3500.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-08 09:15:00	0.00	13899.00	\N	Samuel Carter 91424	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2418	TxId: 31387192219	\N	4000.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-08 13:01:26	0.00	9899.00	\N	Robert Brown 27045	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2419	TxId: 57476994247	\N	7000.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-08 13:37:21	0.00	2899.00	\N	Linda Green 29089	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2420	TxId: 98632277447	\N	32400.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-08 23:39:42	0.00	15999.00	\N	Samuel Carter 39639	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2421	TxId: 40588162053	\N	3800.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-09 13:13:46	0.00	12199.00	\N	Robert Brown 18304	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2422	TxId: 45609632088	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-09 20:47:09	0.00	66493.00	\N	Alex Doe 73508	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2423	TxId: 85530195772	\N	8500.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-09 23:09:12	0.00	57993.00	\N	Alex Doe 65461	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2424	TxId: 44937760731	\N	3000.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-10 14:22:56	0.00	49893.00	\N	Alex Doe 19217	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2425	TxId: 65965699498	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-10 19:44:01	0.00	48393.00	\N	Linda Green 22825	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2426	TxId: 22829152838	\N	32500.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-10 21:41:30	0.00	23893.00	\N	Jane Smith 12770	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2427	TxId: 52225700417	\N	31000.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-12 18:29:58	0.00	36873.00	\N	Linda Green 29282	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2428	TxId: 31581671113	\N	10000.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-13 14:22:45	0.00	22773.00	\N	Jane Smith 97571	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2429	TxId: 33961366964	\N	35300.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-13 20:22:46	0.00	122050.00	\N	Jane Smith 23980	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2430	TxId: 36439238929	\N	3800.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-14 13:03:00	0.00	98000.00	\N	Jane Smith 46055	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2431	TxId: 30801532894	\N	1000.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-14 20:08:51	0.00	87000.00	\N	Jane Smith 61758	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2432	TxId: 55109401801	\N	14500.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-14 21:25:59	0.00	72500.00	\N	Samuel Carter 39233	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2433	TxId: 26811810649	\N	27000.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-15 20:26:19	0.00	31300.00	\N	Robert Brown 60033	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2434	TxId: 51350491173	\N	1500.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-15 20:35:06	0.00	29800.00	\N	Samuel Carter 58769	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2435	TxId: 37832903831	\N	24900.00	Completed	MoMo code payments	Payment to MoMo codes	2025-01-16 00:13:29	0.00	4900.00	\N	Robert Brown 23478	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:26.764314
2436	TxId: 14977177408	\N	673000.00	Successful	Bank transfer	Mobile money transfer to bank account	2024-07-26 15:16:12	8000.00	4950.00	\N	N/A	\N	ONAFRIQ MAURITIUS	\N	\N	\N	\N	2025-06-15 09:13:36.508074
2437	TxId: 14977293553	\N	45000.00	Successful	Bank transfer	Mobile money transfer to bank account	2024-07-26 15:24:12	1200.00	8750.00	\N	N/A	\N	ONAFRIQ MAURITIUS	\N	\N	\N	\N	2025-06-15 09:13:36.508074
2438	TxId: 14977386817	\N	50000.00	Successful	Bank transfer	Mobile money transfer to bank account	2024-07-26 15:30:11	1200.00	7550.00	\N	N/A	\N	ONAFRIQ MAURITIUS	\N	\N	\N	\N	2025-06-15 09:13:36.508074
2439	TxId: 15183763430	\N	2000.00	Successful	Bank transfer	Mobile money transfer to bank account	2024-08-09 11:44:16	120.00	1050.00	\N	N/A	\N	ONAFRIQ MAURITIUS	\N	\N	\N	\N	2025-06-15 09:13:36.508074
2440	TxId: 15204526240	\N	90000.00	Successful	Bank transfer	Mobile money transfer to bank account	2024-08-10 18:10:19	2000.00	9050.00	\N	N/A	\N	ONAFRIQ MAURITIUS	\N	\N	\N	\N	2025-06-15 09:13:36.508074
2441	TxId: 16400028923	\N	50000.00	Successful	Bank transfer	Mobile money transfer to bank account	2024-10-23 09:59:07	0.00	\N	\N	Linda Green	\N	imbank.bank	\N	\N	\N	\N	2025-06-15 09:13:36.508074
2442	TxId: 16406794518	\N	50000.00	Successful	Bank transfer	Mobile money transfer to bank account	2024-10-23 16:43:11	0.00	\N	\N	Robert Brown	\N	imbank.bank	\N	\N	\N	\N	2025-06-15 09:13:36.508074
2443	TxId: 16433471329	\N	20000.00	Successful	Bank transfer	Mobile money transfer to bank account	2024-10-25 00:33:09	0.00	\N	\N	Jane Smith	\N	imbank.bank	\N	\N	\N	\N	2025-06-15 09:13:36.508074
2444	TxId: 16434717507	\N	20000.00	Successful	Bank transfer	Mobile money transfer to bank account	2024-10-25 05:48:07	0.00	\N	\N	Samuel Carter	\N	imbank.bank	\N	\N	\N	\N	2025-06-15 09:13:36.508074
2445	TxId: 16471170286	\N	50000.00	Successful	Bank transfer	Mobile money transfer to bank account	2024-10-26 21:52:12	0.00	\N	\N	Robert Brown	\N	imbank.bank	\N	\N	\N	\N	2025-06-15 09:13:36.508074
2446	TxId: 16664315282	\N	10000.00	Successful	Bank transfer	Mobile money transfer to bank account	2024-11-05 21:55:09	0.00	\N	\N	Jane Smith	\N	imbank.bank	\N	\N	\N	\N	2025-06-15 09:13:36.508074
2447	\N	\N	40000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-05-11 18:45:36	0.00	40400.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2448	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-05-14 09:10:36	0.00	5980.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2449	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-05-14 19:06:35	0.00	5960.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2450	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-05-15 09:13:41	0.00	5460.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2451	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-05-15 23:18:17	0.00	5340.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2452	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-05-15 23:21:09	0.00	10340.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2453	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-05-18 08:12:07	0.00	5690.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2454	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-05-18 08:48:34	0.00	9190.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2455	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-05-20 17:45:32	0.00	5970.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2456	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-05-21 18:15:39	0.00	6550.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2457	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-05-22 13:44:18	0.00	6450.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2458	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-05-24 11:43:23	0.00	6150.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2459	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-05-24 23:04:14	0.00	5050.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2460	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-05-25 11:18:47	0.00	6050.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2461	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-05-25 17:18:14	0.00	9050.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2462	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-05-25 17:19:55	0.00	14050.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2463	\N	\N	25000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-05-26 02:06:52	0.00	26750.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2464	\N	\N	25000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-05-26 14:49:15	0.00	25800.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2465	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-05-26 15:44:59	0.00	10550.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2466	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-05-26 17:18:58	0.00	10450.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2467	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-05-27 07:57:15	0.00	5450.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2468	\N	\N	30000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-05-28 07:21:46	0.00	30150.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2469	\N	\N	15000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-05-29 17:18:25	0.00	16600.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2470	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-05-30 12:14:05	0.00	5400.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2471	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-05-31 09:39:16	0.00	5700.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2472	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-01 01:29:05	0.00	6480.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2473	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-01 11:29:03	0.00	9880.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2474	\N	\N	15000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-01 19:46:17	0.00	15730.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2475	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-02 20:56:57	0.00	5130.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2476	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-03 13:08:55	0.00	6530.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2477	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-03 15:32:43	0.00	6430.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2478	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-03 18:56:24	0.00	8230.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2479	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-04 13:51:59	0.00	5630.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2480	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-05 09:49:32	0.00	10030.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2481	\N	\N	21000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-05 17:19:25	0.00	25330.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2482	\N	\N	200000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-05 18:03:49	0.00	200830.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2483	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-05 18:07:14	0.00	205830.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2484	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-06 08:18:29	0.00	6630.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2485	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-06 17:56:13	0.00	5230.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2486	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-07 07:52:23	0.00	5830.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2487	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-11 07:51:15	0.00	5350.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2488	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-11 16:58:20	0.00	5110.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2489	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-12 13:04:33	0.00	6210.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2490	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-12 17:03:11	0.00	6110.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2491	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-12 17:42:16	0.00	13110.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2492	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-13 13:35:46	0.00	5150.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2493	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-13 18:24:14	0.00	11850.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2494	\N	\N	25000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-14 07:49:39	0.00	29750.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2495	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-14 13:07:05	0.00	5950.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2496	\N	\N	15000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-14 13:56:59	0.00	16950.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2497	\N	\N	8000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-14 21:54:43	0.00	8330.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2498	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-15 14:00:09	0.00	51030.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2499	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-16 13:20:37	0.00	21570.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2500	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-17 15:01:39	0.00	20130.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2501	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-17 16:26:36	0.00	52880.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2502	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-17 19:50:25	0.00	29410.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2503	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-19 22:16:07	0.00	17510.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2504	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-21 17:39:38	0.00	10640.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2505	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-22 10:11:02	0.00	6240.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2506	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-22 10:49:39	0.00	14940.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2507	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-22 18:15:17	0.00	26220.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2508	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-23 16:45:51	0.00	20020.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2509	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-24 14:51:53	0.00	5420.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2510	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-24 18:15:23	0.00	5800.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2511	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-24 21:04:32	0.00	5580.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2512	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-25 13:32:29	0.00	20760.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2513	\N	\N	30000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-25 22:10:17	0.00	34960.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2514	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-26 12:56:30	0.00	10360.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2515	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-26 13:48:31	0.00	5260.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2516	\N	\N	30000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-26 18:38:51	0.00	30160.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2517	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-26 21:08:08	0.00	5290.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2518	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-27 12:42:14	0.00	6990.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2519	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-27 19:36:20	0.00	11170.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2520	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-27 19:38:14	0.00	16170.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2521	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-28 13:54:02	0.00	7920.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2522	\N	\N	40000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-28 17:19:32	0.00	44420.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2523	\N	\N	40000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-28 17:21:01	0.00	84420.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2524	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-28 23:16:57	0.00	40170.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2525	\N	\N	40000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-29 00:29:48	0.00	41670.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2526	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-29 01:13:30	0.00	55170.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2527	\N	\N	100000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-29 13:16:43	0.00	103920.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2528	\N	\N	100000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-29 20:14:00	0.00	113350.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2529	\N	\N	30000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-30 20:36:31	0.00	30490.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2530	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-06-30 22:09:10	0.00	46390.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2531	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-01 18:15:33	0.00	61070.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2532	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-02 11:14:12	0.00	57120.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2533	\N	\N	40000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-03 09:55:09	0.00	49870.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2534	\N	\N	30000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-03 17:53:57	0.00	30070.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2535	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-04 14:04:38	0.00	50220.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2536	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-05 09:40:52	0.00	20470.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2537	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-05 19:21:54	0.00	50320.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2538	\N	\N	40000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-06 15:48:43	0.00	54950.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2539	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-07 15:21:00	0.00	17060.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2540	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-07 18:05:41	0.00	19060.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2541	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-08 16:56:49	0.00	52540.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2542	\N	\N	45000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-09 18:34:57	0.00	49270.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2543	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-11 09:31:04	0.00	20340.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2544	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-14 14:36:23	0.00	50040.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2545	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-14 22:56:27	0.00	55110.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2546	\N	\N	9000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-15 01:02:22	0.00	9110.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2547	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-15 14:35:31	0.00	24010.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2548	\N	\N	60000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-16 19:50:55	0.00	70390.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2549	\N	\N	40000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-17 18:12:07	0.00	42190.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2550	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-19 12:48:37	0.00	13420.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2551	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-19 20:58:56	0.00	28420.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2552	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-20 21:06:52	0.00	21260.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2553	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-20 21:49:18	0.00	20110.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2554	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-22 11:01:21	0.00	20060.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2555	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-23 13:53:28	0.00	12660.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2556	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-23 21:29:08	0.00	10040.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2557	\N	\N	7800.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-24 13:07:28	0.00	9240.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2558	\N	\N	9000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-24 19:23:02	0.00	9240.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2559	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-24 19:50:53	0.00	52640.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2560	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-26 00:13:53	0.00	22000.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2561	\N	\N	30000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-26 12:37:50	0.00	35000.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2562	\N	\N	675000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-26 13:54:41	0.00	675950.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2563	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-26 15:14:21	0.00	685950.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2564	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-26 15:20:53	0.00	54950.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2565	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-26 15:28:59	0.00	58750.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2566	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-26 16:12:48	0.00	17550.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2567	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-26 19:34:59	0.00	56730.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2568	\N	\N	100000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-07-28 18:14:49	0.00	109560.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2569	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-08-01 19:06:54	0.00	50210.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2570	\N	\N	66000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-08-02 12:46:47	0.00	112790.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2571	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-08-03 23:28:20	0.00	53340.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2572	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-08-04 21:45:16	0.00	23240.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2573	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-08-05 17:18:44	0.00	10090.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2574	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-08-06 20:24:14	0.00	20290.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2575	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-08-07 12:49:59	0.00	53090.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2576	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-08-07 18:02:40	0.00	54390.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2577	\N	\N	100000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-08-10 18:04:20	0.00	101050.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2578	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-08-25 15:27:49	0.00	55600.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2579	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-08-26 18:25:26	0.00	73630.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2580	\N	\N	30000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-08-28 11:51:52	0.00	43210.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2581	\N	\N	100000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-08-30 12:12:44	0.00	100960.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2582	\N	\N	40000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-09-01 17:49:23	0.00	51870.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2583	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-09-02 13:53:40	0.00	50870.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2584	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-09-03 21:02:51	0.00	51590.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2585	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-09-06 18:54:20	0.00	20890.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2586	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-09-10 00:14:25	0.00	53870.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2587	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-09-10 18:17:08	0.00	58280.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2588	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-09-12 17:16:04	0.00	54210.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2589	\N	\N	345000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-09-13 13:23:49	0.00	376260.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2590	\N	\N	600000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-09-13 16:29:46	0.00	625160.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2591	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-09-14 11:57:56	0.00	50800.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2592	\N	\N	100000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-09-14 18:04:55	0.00	102250.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2593	\N	\N	12000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-09-16 17:59:00	0.00	12000.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2594	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-09-17 13:41:19	0.00	50000.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2595	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-09-18 22:39:17	0.00	23150.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2596	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-09-19 15:26:18	0.00	52930.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2597	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-09-20 18:27:36	0.00	50030.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2598	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-09-22 13:38:14	0.00	65600.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2599	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-09-23 13:32:16	0.00	10450.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2600	\N	\N	15000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-09-23 20:15:46	0.00	15550.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2601	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-09-23 23:29:30	0.00	50300.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2602	\N	\N	1050000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-09-24 10:41:13	0.00	1064480.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2603	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-09-24 20:54:10	0.00	21180.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2604	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-09-26 14:56:16	0.00	50130.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2605	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-09-26 19:44:13	0.00	49360.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2606	\N	\N	60000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-09-27 22:34:18	0.00	61560.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2607	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-09-28 22:54:10	0.00	56210.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2608	\N	\N	210000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-09-29 17:59:43	0.00	238110.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2609	\N	\N	30000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-09-30 07:29:12	0.00	35260.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2610	\N	\N	150000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-09-30 09:43:58	0.00	173160.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2611	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-10-01 17:25:20	0.00	69610.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2612	\N	\N	9000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-10-03 16:49:29	0.00	9012.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2613	\N	\N	25000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-10-03 17:48:48	0.00	29012.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2614	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-10-03 19:57:19	0.00	24012.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2615	\N	\N	80000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-10-03 20:53:34	0.00	88762.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2616	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-10-04 19:45:02	0.00	20012.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2617	\N	\N	25000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-10-04 23:19:35	0.00	33312.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2618	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-10-05 17:07:29	0.00	51962.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2619	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-10-06 22:41:03	0.00	33412.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2620	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-10-07 13:24:53	0.00	10812.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2621	\N	\N	3000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-10-07 22:06:41	0.00	10812.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2622	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-10-08 18:07:24	0.00	51812.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2623	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-10-08 18:25:38	0.00	15212.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2624	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-10-08 20:47:58	0.00	12962.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2625	\N	\N	30000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-10-09 22:23:17	0.00	32962.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2626	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-10-12 14:35:42	0.00	10405.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2627	\N	\N	6000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-10-12 15:35:54	0.00	6705.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2628	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-10-12 17:50:00	0.00	52605.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2629	\N	\N	60000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-10-14 11:32:47	0.00	62605.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2630	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-10-18 19:49:38	0.00	53750.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2631	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-10-28 22:43:49	0.00	57782.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2632	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-10-29 23:54:03	0.00	25012.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2633	\N	\N	45000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-10-30 23:43:12	0.00	45612.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2634	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-10-31 18:20:54	0.00	12842.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2635	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-10-31 21:22:11	0.00	56142.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2636	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-11-01 14:04:26	0.00	22022.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2637	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-11-01 22:58:59	0.00	56822.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2638	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-11-02 14:06:21	0.00	23472.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2639	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-11-03 14:52:31	0.00	28332.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2640	\N	\N	340000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-11-03 21:31:12	0.00	352312.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2641	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-11-04 10:04:13	0.00	21312.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2642	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-11-04 17:21:01	0.00	58212.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2643	\N	\N	30000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-11-04 19:10:40	0.00	37962.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2644	\N	\N	30000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-11-08 10:00:28	0.00	60947.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2645	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-11-08 21:20:52	0.00	53497.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2646	\N	\N	4000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-11-09 13:39:17	0.00	5137.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2647	\N	\N	30000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-11-11 18:50:17	0.00	30622.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2648	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-11-11 19:50:19	0.00	9222.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2649	\N	\N	5000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-11-11 20:41:00	0.00	6122.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2650	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-11-11 23:19:11	0.00	50022.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2651	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-11-12 21:43:32	0.00	11022.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2652	\N	\N	25000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-11-12 23:45:24	0.00	33022.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2653	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-11-16 13:13:55	0.00	20202.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2654	\N	\N	200000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-11-22 15:00:20	0.00	200185.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2655	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-11-24 12:20:33	0.00	66922.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2656	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-11-25 15:32:48	0.00	15822.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2657	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-11-26 11:32:56	0.00	51422.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2658	\N	\N	250000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-11-26 22:45:50	0.00	265552.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2659	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-11-28 14:41:13	0.00	55452.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2660	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-11-29 01:09:27	0.00	39582.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2661	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-11-29 23:13:42	0.00	51712.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2662	\N	\N	100000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-11-30 14:22:08	0.00	110992.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2663	\N	\N	200000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-11-30 16:34:11	0.00	279492.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2664	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-12-03 21:03:24	0.00	51424.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2665	\N	\N	30000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-12-05 17:59:59	0.00	30624.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2666	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-12-07 12:56:56	0.00	59124.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2667	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-12-08 19:25:54	0.00	50792.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2668	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-12-09 23:44:15	0.00	22242.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2669	\N	\N	8000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-12-10 13:35:06	0.00	8742.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2670	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-12-11 13:33:44	0.00	10142.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2671	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-12-11 14:58:13	0.00	13042.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2672	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-12-11 17:29:41	0.00	52942.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2673	\N	\N	200000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-12-12 11:11:02	0.00	240642.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2674	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-12-13 13:00:44	0.00	85142.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2675	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-12-16 10:53:32	0.00	30191.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2676	\N	\N	20000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-12-20 11:50:35	0.00	21992.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2677	\N	\N	15000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-12-21 12:01:32	0.00	16642.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2678	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-12-22 11:46:21	0.00	52742.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2679	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-12-22 20:26:03	0.00	13832.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2680	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-12-22 21:49:17	0.00	13732.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2681	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-12-23 00:41:53	0.00	51132.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2682	\N	\N	40000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-12-23 03:16:10	0.00	48282.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2683	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-12-23 18:09:23	0.00	58032.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2684	\N	\N	30000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-12-23 21:49:31	0.00	72532.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2685	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-12-27 19:24:33	0.00	78434.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2686	\N	\N	30000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-12-28 21:22:58	0.00	35864.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2687	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-12-29 14:01:56	0.00	66864.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2688	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2024-12-30 00:52:16	0.00	58364.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2689	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2025-01-02 19:39:56	0.00	15672.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2690	\N	\N	10000.00	Successful	Bank deposit	Bank deposit to mobile money account	2025-01-02 23:14:22	0.00	11922.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2691	\N	\N	40000.00	Successful	Bank deposit	Bank deposit to mobile money account	2025-01-03 20:40:15	0.00	46222.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2692	\N	\N	30000.00	Successful	Bank deposit	Bank deposit to mobile money account	2025-01-06 18:49:21	0.00	30737.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2693	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2025-01-08 22:10:34	0.00	52899.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2694	\N	\N	50000.00	Successful	Bank deposit	Bank deposit to mobile money account	2025-01-12 18:29:31	0.00	67873.00	\N	\N	\N	\N	Cash Deposit	\N	\N	\N	2025-06-15 09:13:39.835102
2695	TxId: 13913173274	\N	2000.00	Completed	Airtime	Payment for airtime	2024-05-12 11:41:35	0.00	25280.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:43.16075
2696	TxId: 14121530824	\N	2000.00	Completed	Airtime	Payment for airtime	2024-05-27 18:40:53	0.00	150.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:43.16075
2697	TxId: 14303889432	\N	2000.00	Completed	Airtime	Payment for airtime	2024-06-09 14:58:57	0.00	3350.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:43.16075
2698	TxId: 14304661948	\N	1000.00	Completed	Airtime	Payment for airtime	2024-06-09 15:59:01	0.00	2350.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:43.16075
2699	TxId: 14412904724	\N	200.00	Completed	Airtime	Payment for airtime	2024-06-17 14:58:40	0.00	130.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:43.16075
2700	TxId: 14413610551	\N	5000.00	Completed	Airtime	Payment for airtime	2024-06-17 15:55:03	0.00	15130.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:43.16075
2701	TxId: 14551117248	\N	2000.00	Completed	Airtime	Payment for airtime	2024-06-27 15:06:54	0.00	1990.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:43.16075
2702	TxId: 14568668252	\N	2000.00	Completed	Airtime	Payment for airtime	2024-06-28 17:38:24	0.00	32170.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:43.16075
2703	TxId: 14628107159	\N	3000.00	Completed	Airtime	Payment for airtime	2024-07-02 17:42:49	0.00	11370.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:43.16075
2704	TxId: 15180796103	\N	2000.00	Completed	Airtime	Payment for airtime	2024-08-09 08:04:56	0.00	3170.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:43.16075
2705	TxId: 15512525928	\N	2000.00	Completed	Airtime	Payment for airtime	2024-08-31 17:15:28	0.00	28670.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:43.16075
2706	TxId: 15538355693	\N	3000.00	Completed	Airtime	Payment for airtime	2024-09-02 11:07:30	0.00	870.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:43.16075
2707	TxId: 15594922933	\N	3000.00	Completed	Airtime	Payment for airtime	2024-09-05 20:02:54	0.00	12490.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:43.16075
2708	TxId: 16803083833	\N	5000.00	Completed	Airtime	Payment for airtime	2024-11-12 23:51:11	0.00	28022.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:43.16075
2709	TxId: 17868470140	\N	2000.00	Completed	Airtime	Payment for airtime	2025-01-03 18:56:38	0.00	6222.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:43.16075
2710	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-05-11 20:34:55	100.00	28300.00	\N	Samuel Carter (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2711	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-05-12 03:47:40	20.00	27280.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2712	\N	\N	1700.00	Completed	mobile number transactions	\N	2024-05-12 19:23:57	100.00	3080.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2713	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-05-12 20:49:37	100.00	980.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2714	\N	\N	1800.00	Completed	mobile number transactions	\N	2024-05-14 09:12:08	100.00	4080.00	\N	Robert Brown (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2715	\N	\N	2500.00	Completed	mobile number transactions	\N	2024-05-14 09:27:46	100.00	1480.00	\N	Jane Smith (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2716	\N	\N	500.00	Completed	mobile number transactions	\N	2024-05-14 14:02:06	20.00	960.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2717	\N	\N	1800.00	Completed	mobile number transactions	\N	2024-05-14 19:21:24	100.00	4060.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2718	\N	\N	700.00	Completed	mobile number transactions	\N	2024-05-15 15:23:35	20.00	2940.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2719	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-05-15 18:04:10	100.00	1340.00	\N	Robert Brown (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2720	\N	\N	2800.00	Completed	mobile number transactions	\N	2024-05-15 23:59:18	100.00	7440.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2721	\N	\N	1300.00	Completed	mobile number transactions	\N	2024-05-16 02:03:27	100.00	6040.00	\N	Linda Green (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2722	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-05-17 10:35:52	100.00	2290.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2723	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-05-17 18:49:39	100.00	690.00	\N	Jane Smith (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2724	\N	\N	500.00	Completed	mobile number transactions	\N	2024-05-20 09:32:56	20.00	4070.00	\N	Robert Brown (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2725	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-05-20 17:05:52	100.00	970.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2726	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-05-20 17:46:06	20.00	4950.00	\N	Jane Smith (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2727	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-05-21 14:38:21	100.00	3350.00	\N	Samuel Carter (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2728	\N	\N	1700.00	Completed	mobile number transactions	\N	2024-05-21 17:42:56	100.00	1550.00	\N	Jane Smith (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2729	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-05-21 18:15:49	100.00	1450.00	\N	Jane Smith (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2730	\N	\N	1800.00	Completed	mobile number transactions	\N	2024-05-24 11:44:06	100.00	4250.00	\N	Jane Smith (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2731	\N	\N	1600.00	Completed	mobile number transactions	\N	2024-05-24 18:18:43	100.00	50.00	\N	Samuel Carter (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2732	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-05-26 02:24:51	100.00	4800.00	\N	Jane Smith (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2733	\N	\N	25000.00	Completed	mobile number transactions	\N	2024-05-26 14:51:21	250.00	550.00	\N	Samuel Carter (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2734	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-05-26 16:01:18	100.00	450.00	\N	Samuel Carter (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2735	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-05-27 14:46:06	100.00	2150.00	\N	Jane Smith (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2736	\N	\N	27000.00	Completed	mobile number transactions	\N	2024-05-28 07:22:52	250.00	2900.00	\N	Samuel Carter (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2737	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-05-29 17:19:17	100.00	6500.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2738	\N	\N	6000.00	Completed	mobile number transactions	\N	2024-05-29 19:11:57	100.00	400.00	\N	Alex Doe (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2739	\N	\N	1200.00	Completed	mobile number transactions	\N	2024-05-30 17:03:17	100.00	2300.00	\N	Jane Smith (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2740	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-05-30 19:06:08	100.00	700.00	\N	Robert Brown (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2741	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-05-31 15:40:04	20.00	1480.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2742	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-06-01 01:43:41	100.00	4880.00	\N	Samuel Carter (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2743	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-06-01 11:30:13	100.00	4780.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2744	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-06-01 19:50:57	100.00	3730.00	\N	Alex Doe (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2745	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-06-02 17:28:51	100.00	130.00	\N	Alex Doe (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2746	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-06-03 09:24:31	100.00	1530.00	\N	Robert Brown (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2747	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-06-03 13:32:17	100.00	1430.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2748	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-06-03 15:33:21	100.00	4830.00	\N	Linda Green (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2749	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-06-03 17:55:34	100.00	3230.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2750	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-06-05 09:50:06	100.00	7930.00	\N	Robert Brown (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2751	\N	\N	3500.00	Completed	mobile number transactions	\N	2024-06-05 14:05:14	100.00	4330.00	\N	Jane Smith (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2752	\N	\N	200000.00	Completed	mobile number transactions	\N	2024-06-05 18:07:41	1500.00	4330.00	\N	Jane Smith (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2753	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-06-05 18:29:26	100.00	2230.00	\N	Robert Brown (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2754	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-06-06 08:19:39	100.00	4530.00	\N	Jane Smith (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2755	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-06-06 09:57:34	100.00	2430.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2756	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-06-06 13:55:19	100.00	830.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2757	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-06-06 18:06:39	100.00	3630.00	\N	Alex Doe (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2758	\N	\N	500.00	Completed	mobile number transactions	\N	2024-06-07 07:53:05	20.00	5310.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2759	\N	\N	400.00	Completed	mobile number transactions	\N	2024-06-07 16:51:34	20.00	16890.00	\N	Robert Brown (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2760	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-06-07 17:29:06	20.00	15870.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2761	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-06-07 20:09:30	100.00	14270.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2762	\N	\N	8000.00	Completed	mobile number transactions	\N	2024-06-07 20:36:50	100.00	6170.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2763	\N	\N	800.00	Completed	mobile number transactions	\N	2024-06-07 20:42:30	20.00	5350.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2764	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-06-11 07:53:00	20.00	4330.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2765	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-06-11 08:36:51	100.00	2730.00	\N	Samuel Carter (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2766	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-06-11 09:47:36	100.00	630.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2767	\N	\N	500.00	Completed	mobile number transactions	\N	2024-06-11 14:05:10	20.00	110.00	\N	Samuel Carter (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2768	\N	\N	1700.00	Completed	mobile number transactions	\N	2024-06-11 17:03:52	100.00	3310.00	\N	Alex Doe (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2769	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-06-12 09:24:25	100.00	1210.00	\N	Robert Brown (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2770	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-06-12 13:21:53	100.00	1110.00	\N	Alex Doe (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2771	\N	\N	500.00	Completed	mobile number transactions	\N	2024-06-12 17:47:59	20.00	12590.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2772	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-06-12 17:51:37	100.00	7490.00	\N	Linda Green (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2773	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-06-12 17:52:37	20.00	6470.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2774	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-06-13 09:23:05	20.00	2050.00	\N	Jane Smith (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2775	\N	\N	1800.00	Completed	mobile number transactions	\N	2024-06-13 09:51:57	100.00	150.00	\N	Robert Brown (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2776	\N	\N	1700.00	Completed	mobile number transactions	\N	2024-06-13 18:13:47	100.00	1850.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2777	\N	\N	7000.00	Completed	mobile number transactions	\N	2024-06-13 18:26:13	100.00	4750.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2778	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-06-14 13:57:31	100.00	6850.00	\N	Robert Brown (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2779	\N	\N	200.00	Completed	mobile number transactions	\N	2024-06-14 17:24:05	20.00	4830.00	\N	Alex Doe (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2780	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-06-14 20:37:55	100.00	2230.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2781	\N	\N	1800.00	Completed	mobile number transactions	\N	2024-06-14 20:38:47	100.00	330.00	\N	Linda Green (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2782	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-06-14 23:17:51	100.00	6230.00	\N	Robert Brown (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2783	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-06-15 13:12:20	100.00	3130.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2784	\N	\N	700.00	Completed	mobile number transactions	\N	2024-06-15 14:02:28	20.00	50310.00	\N	Robert Brown (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2785	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-06-15 16:44:27	100.00	24710.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2786	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-06-15 16:45:05	100.00	23110.00	\N	Samuel Carter (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2787	\N	\N	800.00	Completed	mobile number transactions	\N	2024-06-16 13:06:39	20.00	2390.00	\N	Samuel Carter (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2788	\N	\N	800.00	Completed	mobile number transactions	\N	2024-06-16 13:07:15	20.00	1570.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2789	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-06-16 13:21:13	100.00	19470.00	\N	Samuel Carter (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2790	\N	\N	4600.00	Completed	mobile number transactions	\N	2024-06-16 13:26:31	100.00	14770.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2791	\N	\N	400.00	Completed	mobile number transactions	\N	2024-06-16 14:31:19	20.00	14350.00	\N	Alex Doe (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2792	\N	\N	500.00	Completed	mobile number transactions	\N	2024-06-16 21:54:06	20.00	330.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2793	\N	\N	4550.00	Completed	mobile number transactions	\N	2024-06-17 16:17:04	100.00	5980.00	\N	Linda Green (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2794	\N	\N	3000.00	Completed	mobile number transactions	\N	2024-06-17 16:20:31	100.00	2880.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2795	\N	\N	30000.00	Completed	mobile number transactions	\N	2024-06-17 17:06:02	250.00	9930.00	\N	Linda Green (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2796	\N	\N	500.00	Completed	mobile number transactions	\N	2024-06-17 18:51:10	20.00	9410.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2797	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-06-17 19:50:54	100.00	19310.00	\N	Linda Green (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2798	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-06-17 21:32:41	100.00	17210.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2799	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-06-18 09:08:55	100.00	13110.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2800	\N	\N	1700.00	Completed	mobile number transactions	\N	2024-06-18 18:39:31	100.00	12310.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2801	\N	\N	12000.00	Completed	mobile number transactions	\N	2024-06-19 22:17:14	250.00	5260.00	\N	Jane Smith (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2802	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-06-20 17:55:51	100.00	3660.00	\N	Robert Brown (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2803	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-06-20 19:22:34	20.00	2640.00	\N	Alex Doe (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2804	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-06-21 17:40:31	100.00	5540.00	\N	Alex Doe (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2805	\N	\N	1200.00	Completed	mobile number transactions	\N	2024-06-22 10:13:10	100.00	4940.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2806	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-06-22 11:34:15	20.00	7720.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2807	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-06-22 20:13:27	100.00	14120.00	\N	Alex Doe (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2808	\N	\N	8000.00	Completed	mobile number transactions	\N	2024-06-23 16:47:10	100.00	11920.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2809	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-06-23 20:06:55	100.00	6020.00	\N	Linda Green (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2810	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-06-24 10:37:21	100.00	3920.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2811	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-06-24 14:52:23	100.00	3820.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2812	\N	\N	500.00	Completed	mobile number transactions	\N	2024-06-24 14:56:46	20.00	3300.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2813	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-06-24 18:16:02	20.00	4780.00	\N	Jane Smith (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2814	\N	\N	800.00	Completed	mobile number transactions	\N	2024-06-24 21:39:33	20.00	2360.00	\N	Linda Green (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2815	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-06-25 09:45:11	100.00	760.00	\N	Samuel Carter (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2816	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-06-25 13:37:31	100.00	12160.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2817	\N	\N	1800.00	Completed	mobile number transactions	\N	2024-06-25 18:25:11	100.00	8760.00	\N	Jane Smith (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2818	\N	\N	2500.00	Completed	mobile number transactions	\N	2024-06-25 20:46:37	100.00	4960.00	\N	Linda Green (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2819	\N	\N	8000.00	Completed	mobile number transactions	\N	2024-06-25 22:19:26	100.00	9360.00	\N	Linda Green (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2820	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-06-26 12:55:59	100.00	260.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2821	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-06-26 16:42:22	100.00	160.00	\N	Alex Doe (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2822	\N	\N	25000.00	Completed	mobile number transactions	\N	2024-06-26 18:40:58	250.00	4910.00	\N	Jane Smith (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2823	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-06-26 19:31:02	20.00	2890.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2824	\N	\N	800.00	Completed	mobile number transactions	\N	2024-06-27 16:46:49	20.00	1170.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2825	\N	\N	11000.00	Completed	mobile number transactions	\N	2024-06-27 19:38:38	250.00	4920.00	\N	Jane Smith (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2826	\N	\N	50000.00	Completed	mobile number transactions	\N	2024-06-28 17:21:44	250.00	34170.00	\N	Alex Doe (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2827	\N	\N	20000.00	Completed	mobile number transactions	\N	2024-06-29 03:44:46	250.00	3920.00	\N	Alex Doe (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2828	\N	\N	15000.00	Completed	mobile number transactions	\N	2024-06-29 14:41:28	250.00	82870.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2829	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-06-29 16:59:59	20.00	44850.00	\N	Robert Brown (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2830	\N	\N	15000.00	Completed	mobile number transactions	\N	2024-06-29 17:45:50	250.00	29600.00	\N	Alex Doe (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2831	\N	\N	12000.00	Completed	mobile number transactions	\N	2024-06-29 20:04:51	250.00	13350.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2832	\N	\N	11500.00	Completed	mobile number transactions	\N	2024-06-30 02:17:41	250.00	41600.00	\N	Linda Green (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2833	\N	\N	500.00	Completed	mobile number transactions	\N	2024-06-30 13:13:33	20.00	41080.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2834	\N	\N	500.00	Completed	mobile number transactions	\N	2024-06-30 15:32:45	20.00	27160.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2835	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-06-30 16:49:37	100.00	25060.00	\N	Jane Smith (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2836	\N	\N	14000.00	Completed	mobile number transactions	\N	2024-06-30 18:02:59	250.00	6310.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2837	\N	\N	1600.00	Completed	mobile number transactions	\N	2024-06-30 18:22:18	100.00	4610.00	\N	Jane Smith (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2838	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-06-30 18:48:18	20.00	3590.00	\N	Alex Doe (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2839	\N	\N	4000.00	Completed	mobile number transactions	\N	2024-06-30 19:16:02	100.00	490.00	\N	Samuel Carter (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2840	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-06-30 20:49:18	100.00	26390.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2841	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-06-30 22:40:51	20.00	12570.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2842	\N	\N	9000.00	Completed	mobile number transactions	\N	2024-07-01 18:23:32	100.00	27120.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2843	\N	\N	40000.00	Completed	mobile number transactions	\N	2024-07-02 11:14:58	250.00	16870.00	\N	Alex Doe (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2844	\N	\N	2500.00	Completed	mobile number transactions	\N	2024-07-03 13:37:22	100.00	5970.00	\N	Jane Smith (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2845	\N	\N	1200.00	Completed	mobile number transactions	\N	2024-07-03 15:24:13	100.00	1670.00	\N	Linda Green (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2846	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-07-03 17:44:53	100.00	70.00	\N	Linda Green (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2847	\N	\N	27000.00	Completed	mobile number transactions	\N	2024-07-03 17:54:40	250.00	2820.00	\N	Linda Green (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2848	\N	\N	27900.00	Completed	mobile number transactions	\N	2024-07-04 15:04:43	250.00	22070.00	\N	Alex Doe (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2849	\N	\N	5500.00	Completed	mobile number transactions	\N	2024-07-04 20:57:41	100.00	470.00	\N	Samuel Carter (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2850	\N	\N	1300.00	Completed	mobile number transactions	\N	2024-07-05 09:52:13	100.00	19070.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2851	\N	\N	14000.00	Completed	mobile number transactions	\N	2024-07-05 18:25:42	250.00	320.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2852	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-07-05 19:50:17	20.00	49300.00	\N	Samuel Carter (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2853	\N	\N	6000.00	Completed	mobile number transactions	\N	2024-07-05 22:06:15	100.00	43200.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2854	\N	\N	21000.00	Completed	mobile number transactions	\N	2024-07-06 00:01:39	250.00	21950.00	\N	Robert Brown (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2855	\N	\N	1200.00	Completed	mobile number transactions	\N	2024-07-06 19:53:18	100.00	30650.00	\N	Alex Doe (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2856	\N	\N	1200.00	Completed	mobile number transactions	\N	2024-07-06 19:53:51	100.00	29350.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2857	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-07-06 20:32:02	20.00	27330.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2858	\N	\N	700.00	Completed	mobile number transactions	\N	2024-07-06 22:28:18	20.00	26610.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2859	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-07-07 02:53:51	100.00	18310.00	\N	Robert Brown (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2860	\N	\N	11000.00	Completed	mobile number transactions	\N	2024-07-07 13:07:37	250.00	7060.00	\N	Alex Doe (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2861	\N	\N	8000.00	Completed	mobile number transactions	\N	2024-07-07 18:05:44	100.00	10960.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2862	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-07-07 18:17:42	20.00	9940.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2863	\N	\N	1200.00	Completed	mobile number transactions	\N	2024-07-08 16:32:10	100.00	2540.00	\N	Linda Green (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2864	\N	\N	25000.00	Completed	mobile number transactions	\N	2024-07-08 17:17:19	250.00	27290.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2865	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-07-08 18:41:38	100.00	22190.00	\N	Linda Green (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2866	\N	\N	1200.00	Completed	mobile number transactions	\N	2024-07-09 10:09:25	100.00	16890.00	\N	Alex Doe (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2867	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-07-09 14:43:03	100.00	5290.00	\N	Samuel Carter (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2868	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-07-09 16:24:14	20.00	4270.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2869	\N	\N	1300.00	Completed	mobile number transactions	\N	2024-07-11 14:58:03	100.00	10640.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2870	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-07-12 09:21:53	100.00	4140.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2871	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-07-12 19:02:31	100.00	40.00	\N	Jane Smith (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2872	\N	\N	700.00	Completed	mobile number transactions	\N	2024-07-14 14:54:28	20.00	49320.00	\N	Alex Doe (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2873	\N	\N	19500.00	Completed	mobile number transactions	\N	2024-07-14 14:58:33	250.00	29570.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2874	\N	\N	800.00	Completed	mobile number transactions	\N	2024-07-14 17:31:16	20.00	7950.00	\N	Alex Doe (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2875	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-07-14 22:47:28	20.00	6130.00	\N	Samuel Carter (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2876	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-07-14 22:50:19	20.00	5110.00	\N	Jane Smith (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2877	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-07-15 01:29:43	100.00	4010.00	\N	Jane Smith (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2878	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-07-15 14:35:55	100.00	13910.00	\N	Linda Green (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2879	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-07-15 16:46:33	20.00	12890.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2880	\N	\N	25000.00	Completed	mobile number transactions	\N	2024-07-16 19:53:23	250.00	45140.00	\N	Alex Doe (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2881	\N	\N	40000.00	Completed	mobile number transactions	\N	2024-07-16 21:23:15	250.00	4890.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2882	\N	\N	1300.00	Completed	mobile number transactions	\N	2024-07-17 10:20:51	100.00	3490.00	\N	Jane Smith (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2883	\N	\N	1200.00	Completed	mobile number transactions	\N	2024-07-17 17:20:35	100.00	2190.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2884	\N	\N	30000.00	Completed	mobile number transactions	\N	2024-07-17 18:12:26	250.00	11940.00	\N	Jane Smith (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2885	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-07-18 15:53:36	20.00	7120.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2886	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-07-19 21:21:55	100.00	19020.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2887	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-07-20 15:02:03	100.00	15920.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2888	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-07-20 17:15:27	100.00	6410.00	\N	Alex Doe (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2889	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-07-20 17:16:03	100.00	4810.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2890	\N	\N	15000.00	Completed	mobile number transactions	\N	2024-07-20 21:07:58	250.00	6010.00	\N	Alex Doe (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2891	\N	\N	3000.00	Completed	mobile number transactions	\N	2024-07-20 21:09:44	100.00	2910.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2892	\N	\N	3000.00	Completed	mobile number transactions	\N	2024-07-20 21:22:04	100.00	110.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2893	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-07-20 21:49:28	100.00	18510.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2894	\N	\N	18000.00	Completed	mobile number transactions	\N	2024-07-21 17:14:05	250.00	260.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2895	\N	\N	1300.00	Completed	mobile number transactions	\N	2024-07-22 15:21:19	100.00	17360.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2896	\N	\N	7000.00	Completed	mobile number transactions	\N	2024-07-23 09:07:43	100.00	4260.00	\N	Alex Doe (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2897	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-07-23 09:17:34	100.00	2660.00	\N	Jane Smith (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2898	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-07-23 13:54:30	100.00	2560.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2899	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-07-23 15:17:08	20.00	1540.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2900	\N	\N	8500.00	Completed	mobile number transactions	\N	2024-07-23 22:23:34	100.00	1440.00	\N	Jane Smith (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2901	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-07-24 21:17:56	100.00	38540.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2902	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-07-25 13:33:43	20.00	31220.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2903	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-07-25 13:38:17	100.00	21120.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2904	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-07-25 13:46:56	100.00	11020.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2905	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-07-25 15:25:16	20.00	7500.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2906	\N	\N	1300.00	Completed	mobile number transactions	\N	2024-07-26 11:14:40	100.00	5000.00	\N	Robert Brown (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2907	\N	\N	30000.00	Completed	mobile number transactions	\N	2024-07-26 12:37:51	250.00	4750.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2908	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-07-26 16:13:36	100.00	7450.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2909	\N	\N	700.00	Completed	mobile number transactions	\N	2024-07-26 18:36:03	20.00	6730.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2910	\N	\N	30000.00	Completed	mobile number transactions	\N	2024-07-26 19:35:32	250.00	26480.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2911	\N	\N	1300.00	Completed	mobile number transactions	\N	2024-07-27 14:11:56	100.00	25080.00	\N	Jane Smith (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2912	\N	\N	1300.00	Completed	mobile number transactions	\N	2024-07-27 14:12:35	100.00	23680.00	\N	Alex Doe (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2913	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-07-27 15:07:21	20.00	22660.00	\N	Alex Doe (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2914	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-07-27 17:18:45	100.00	12560.00	\N	Alex Doe (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2915	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-07-28 19:35:51	100.00	87460.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2916	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-07-30 17:48:18	100.00	67160.00	\N	Robert Brown (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2917	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-08-01 09:46:46	100.00	27960.00	\N	Linda Green (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2918	\N	\N	20000.00	Completed	mobile number transactions	\N	2024-08-01 14:30:10	250.00	1410.00	\N	Alex Doe (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2919	\N	\N	600.00	Completed	mobile number transactions	\N	2024-08-02 01:17:07	20.00	46790.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2920	\N	\N	66000.00	Completed	mobile number transactions	\N	2024-08-02 12:53:03	250.00	46540.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2921	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-08-02 18:38:03	100.00	36440.00	\N	Linda Green (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2922	\N	\N	12000.00	Completed	mobile number transactions	\N	2024-08-03 12:10:58	250.00	18190.00	\N	Linda Green (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2923	\N	\N	12000.00	Completed	mobile number transactions	\N	2024-08-03 14:51:51	250.00	5940.00	\N	Samuel Carter (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2924	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-08-03 16:57:10	100.00	3340.00	\N	Jane Smith (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2925	\N	\N	11050.00	Completed	mobile number transactions	\N	2024-08-03 23:42:10	250.00	35040.00	\N	Linda Green (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2926	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-08-04 18:17:30	100.00	33440.00	\N	Alex Doe (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2927	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-08-04 20:09:47	100.00	4840.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2928	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-08-04 20:10:20	100.00	3240.00	\N	Linda Green (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2929	\N	\N	11000.00	Completed	mobile number transactions	\N	2024-08-04 21:44:45	250.00	11990.00	\N	Jane Smith (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2930	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-08-05 10:37:48	100.00	10390.00	\N	Linda Green (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2931	\N	\N	7000.00	Completed	mobile number transactions	\N	2024-08-05 13:36:57	100.00	290.00	\N	Alex Doe (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2932	\N	\N	1200.00	Completed	mobile number transactions	\N	2024-08-05 17:18:48	100.00	8790.00	\N	Samuel Carter (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2933	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-08-06 12:56:17	100.00	4290.00	\N	Linda Green (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2934	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-08-06 21:19:55	100.00	6690.00	\N	Robert Brown (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2935	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-08-07 11:08:01	100.00	3090.00	\N	Robert Brown (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2936	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-08-07 14:37:11	100.00	47990.00	\N	Robert Brown (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2937	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-08-07 17:15:51	100.00	4390.00	\N	Samuel Carter (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2938	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-08-07 18:02:10	100.00	52290.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2939	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-08-07 18:41:15	20.00	24870.00	\N	Jane Smith (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2940	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-08-08 20:21:34	100.00	7770.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2941	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-08-08 20:22:10	100.00	6170.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2942	\N	\N	25000.00	Completed	mobile number transactions	\N	2024-08-24 10:25:58	250.00	8800.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2943	\N	\N	12000.00	Completed	mobile number transactions	\N	2024-08-25 15:28:48	250.00	43350.00	\N	Alex Doe (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2944	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-08-26 08:42:50	100.00	28350.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2945	\N	\N	300.00	Completed	mobile number transactions	\N	2024-08-26 08:51:02	20.00	28030.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2946	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-08-26 12:56:27	100.00	26430.00	\N	Robert Brown (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2947	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-08-27 13:22:10	100.00	22730.00	\N	Robert Brown (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2948	\N	\N	700.00	Completed	mobile number transactions	\N	2024-08-27 17:26:24	20.00	22010.00	\N	Samuel Carter (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2949	\N	\N	2500.00	Completed	mobile number transactions	\N	2024-08-27 18:16:45	100.00	19410.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2950	\N	\N	3000.00	Completed	mobile number transactions	\N	2024-08-27 18:52:53	100.00	16310.00	\N	Linda Green (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2951	\N	\N	20000.00	Completed	mobile number transactions	\N	2024-08-28 11:52:41	250.00	22960.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2952	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-08-28 15:24:14	100.00	16560.00	\N	Linda Green (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2953	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-08-29 12:43:09	100.00	4660.00	\N	Robert Brown (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2954	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-08-29 13:56:50	100.00	2560.00	\N	Alex Doe (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2955	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-08-29 17:22:25	100.00	960.00	\N	Samuel Carter (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2956	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-08-30 13:40:48	100.00	97860.00	\N	Alex Doe (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2957	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-08-30 17:10:53	20.00	89740.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2958	\N	\N	700.00	Completed	mobile number transactions	\N	2024-08-30 17:25:11	20.00	89020.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2959	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-08-30 18:00:55	100.00	87420.00	\N	Alex Doe (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2960	\N	\N	40000.00	Completed	mobile number transactions	\N	2024-08-31 02:52:13	250.00	35670.00	\N	Alex Doe (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2961	\N	\N	25000.00	Completed	mobile number transactions	\N	2024-09-01 17:51:02	250.00	26620.00	\N	Linda Green (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2962	\N	\N	17000.00	Completed	mobile number transactions	\N	2024-09-01 19:28:42	250.00	9370.00	\N	Robert Brown (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2963	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-09-02 19:32:32	20.00	25850.00	\N	Alex Doe (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2964	\N	\N	700.00	Completed	mobile number transactions	\N	2024-09-02 19:40:16	20.00	25130.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2965	\N	\N	700.00	Completed	mobile number transactions	\N	2024-09-02 20:17:27	20.00	24410.00	\N	Jane Smith (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2966	\N	\N	700.00	Completed	mobile number transactions	\N	2024-09-02 20:17:57	20.00	23690.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2967	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-09-03 18:36:38	100.00	3090.00	\N	Linda Green (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2968	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-09-05 09:48:05	100.00	24490.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2969	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-09-06 11:57:39	100.00	8890.00	\N	Alex Doe (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2970	\N	\N	3000.00	Completed	mobile number transactions	\N	2024-09-06 19:12:13	100.00	212990.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2971	\N	\N	12500.00	Completed	mobile number transactions	\N	2024-09-06 22:17:11	250.00	180290.00	\N	Linda Green (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2972	\N	\N	1200.00	Completed	mobile number transactions	\N	2024-09-06 23:57:26	100.00	178990.00	\N	Jane Smith (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2973	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-09-07 11:37:27	100.00	168890.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2974	\N	\N	14500.00	Completed	mobile number transactions	\N	2024-09-07 18:31:01	250.00	154140.00	\N	Linda Green (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2975	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-09-07 19:51:16	20.00	153120.00	\N	Linda Green (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2976	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-09-07 20:06:33	20.00	152100.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2977	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-09-07 22:31:13	20.00	151080.00	\N	Linda Green (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2978	\N	\N	700.00	Completed	mobile number transactions	\N	2024-09-07 22:31:46	20.00	150360.00	\N	Jane Smith (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2979	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-09-08 01:07:05	100.00	123260.00	\N	Jane Smith (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2980	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-09-08 02:27:07	20.00	97740.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2981	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-09-08 02:27:48	20.00	96720.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2982	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-09-08 02:50:16	20.00	78700.00	\N	Alex Doe (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2983	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-09-08 02:50:56	20.00	77680.00	\N	Linda Green (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2984	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-09-08 15:10:39	20.00	60660.00	\N	Robert Brown (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2985	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-09-08 15:46:04	100.00	59060.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2986	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-09-08 15:46:40	100.00	57460.00	\N	Samuel Carter (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2987	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-09-08 16:26:45	100.00	55360.00	\N	Samuel Carter (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2988	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-09-08 16:27:16	100.00	53260.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2989	\N	\N	700.00	Completed	mobile number transactions	\N	2024-09-08 16:28:17	20.00	52540.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2990	\N	\N	700.00	Completed	mobile number transactions	\N	2024-09-08 17:26:26	20.00	51120.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2991	\N	\N	6200.00	Completed	mobile number transactions	\N	2024-09-08 18:38:49	100.00	44820.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2992	\N	\N	20000.00	Completed	mobile number transactions	\N	2024-09-09 09:44:19	250.00	24570.00	\N	Alex Doe (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2993	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-09-09 09:57:09	100.00	22970.00	\N	Linda Green (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2994	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-09-09 13:30:45	100.00	17870.00	\N	Linda Green (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2995	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-09-09 22:13:22	100.00	8870.00	\N	Linda Green (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2996	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-09-10 00:46:56	100.00	44770.00	\N	Alex Doe (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2997	\N	\N	20000.00	Completed	mobile number transactions	\N	2024-09-10 00:51:26	250.00	24520.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2998	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-09-10 01:11:28	100.00	14420.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
2999	\N	\N	500.00	Completed	mobile number transactions	\N	2024-09-10 01:25:53	20.00	13900.00	\N	Jane Smith (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3000	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-09-10 01:38:43	20.00	12880.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3001	\N	\N	3000.00	Completed	mobile number transactions	\N	2024-09-10 13:32:46	100.00	8280.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3002	\N	\N	20000.00	Completed	mobile number transactions	\N	2024-09-10 19:24:46	250.00	28030.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3003	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-09-10 19:28:44	100.00	22930.00	\N	Samuel Carter (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3004	\N	\N	3000.00	Completed	mobile number transactions	\N	2024-09-11 14:00:40	100.00	16830.00	\N	Samuel Carter (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3005	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-09-12 10:42:13	100.00	7230.00	\N	Jane Smith (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3006	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-09-12 15:24:07	100.00	5630.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3007	\N	\N	700.00	Completed	mobile number transactions	\N	2024-09-12 15:59:22	20.00	4910.00	\N	Alex Doe (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3008	\N	\N	12000.00	Completed	mobile number transactions	\N	2024-09-12 17:16:30	250.00	41960.00	\N	Robert Brown (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3009	\N	\N	6000.00	Completed	mobile number transactions	\N	2024-09-12 18:17:04	100.00	35860.00	\N	Jane Smith (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3010	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-09-12 19:09:50	100.00	34260.00	\N	Samuel Carter (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3011	\N	\N	345000.00	Completed	mobile number transactions	\N	2024-09-13 13:24:46	1500.00	29760.00	\N	Linda Green (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3012	\N	\N	3000.00	Completed	mobile number transactions	\N	2024-09-13 16:17:24	100.00	25160.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3013	\N	\N	600000.00	Completed	mobile number transactions	\N	2024-09-13 16:31:30	1500.00	23660.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3014	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-09-13 17:29:59	100.00	22060.00	\N	Robert Brown (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3015	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-09-13 18:45:56	100.00	15460.00	\N	Jane Smith (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3016	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-09-13 20:06:34	20.00	12940.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3017	\N	\N	2500.00	Completed	mobile number transactions	\N	2024-09-13 22:18:42	100.00	10340.00	\N	Jane Smith (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3018	\N	\N	700.00	Completed	mobile number transactions	\N	2024-09-13 23:16:16	20.00	5620.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3019	\N	\N	700.00	Completed	mobile number transactions	\N	2024-09-13 23:16:52	20.00	4900.00	\N	Linda Green (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3020	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-09-14 07:07:17	100.00	2800.00	\N	Jane Smith (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3021	\N	\N	42000.00	Completed	mobile number transactions	\N	2024-09-14 12:41:32	250.00	7350.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3022	\N	\N	3000.00	Completed	mobile number transactions	\N	2024-09-14 15:14:58	100.00	4250.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3023	\N	\N	20000.00	Completed	mobile number transactions	\N	2024-09-16 11:12:27	250.00	4500.00	\N	Jane Smith (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3024	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-09-16 17:59:43	100.00	1900.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3025	\N	\N	1800.00	Completed	mobile number transactions	\N	2024-09-17 12:28:05	100.00	0.00	\N	Alex Doe (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3026	\N	\N	12000.00	Completed	mobile number transactions	\N	2024-09-17 18:59:37	250.00	34250.00	\N	Samuel Carter (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3027	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-09-17 19:00:04	100.00	32150.00	\N	Jane Smith (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3028	\N	\N	8000.00	Completed	mobile number transactions	\N	2024-09-17 19:01:20	100.00	24050.00	\N	Alex Doe (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3029	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-09-18 14:23:44	100.00	10750.00	\N	Jane Smith (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3030	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-09-18 23:07:57	20.00	18130.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3031	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-09-19 01:15:57	100.00	8030.00	\N	Samuel Carter (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3032	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-09-19 09:09:39	100.00	6430.00	\N	Alex Doe (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3033	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-09-20 19:26:22	100.00	44930.00	\N	Linda Green (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3034	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-09-21 14:45:52	20.00	36910.00	\N	Alex Doe (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3035	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-09-21 14:46:37	20.00	35890.00	\N	Linda Green (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3036	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-09-21 15:22:23	20.00	34870.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3037	\N	\N	18500.00	Completed	mobile number transactions	\N	2024-09-21 16:48:32	250.00	16120.00	\N	Jane Smith (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3038	\N	\N	500.00	Completed	mobile number transactions	\N	2024-09-22 13:20:12	20.00	15600.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3039	\N	\N	3000.00	Completed	mobile number transactions	\N	2024-09-22 13:55:31	100.00	33100.00	\N	Jane Smith (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3040	\N	\N	15000.00	Completed	mobile number transactions	\N	2024-09-22 15:40:25	250.00	17850.00	\N	Linda Green (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3041	\N	\N	15000.00	Completed	mobile number transactions	\N	2024-09-22 15:50:58	250.00	17600.00	\N	Robert Brown (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3042	\N	\N	1300.00	Completed	mobile number transactions	\N	2024-09-22 20:11:35	100.00	11200.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3043	\N	\N	10500.00	Completed	mobile number transactions	\N	2024-09-23 12:13:39	250.00	450.00	\N	Samuel Carter (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3044	\N	\N	4000.00	Completed	mobile number transactions	\N	2024-09-23 15:07:20	100.00	550.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3045	\N	\N	15000.00	Completed	mobile number transactions	\N	2024-09-23 20:16:39	250.00	300.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3046	\N	\N	500.00	Completed	mobile number transactions	\N	2024-09-24 10:19:04	20.00	14480.00	\N	Linda Green (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3047	\N	\N	1050000.00	Completed	mobile number transactions	\N	2024-09-24 10:45:51	1500.00	12980.00	\N	Alex Doe (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3048	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-09-24 11:01:38	100.00	11380.00	\N	Jane Smith (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3049	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-09-24 17:40:48	100.00	6480.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3050	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-09-24 17:43:07	100.00	1380.00	\N	Robert Brown (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3051	\N	\N	3000.00	Completed	mobile number transactions	\N	2024-09-24 20:57:55	100.00	14080.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3052	\N	\N	12000.00	Completed	mobile number transactions	\N	2024-09-25 01:33:01	250.00	11830.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3053	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-09-25 18:56:18	100.00	1130.00	\N	Linda Green (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3054	\N	\N	17500.00	Completed	mobile number transactions	\N	2024-09-26 14:57:33	250.00	32380.00	\N	Jane Smith (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3055	\N	\N	500.00	Completed	mobile number transactions	\N	2024-09-26 15:12:17	20.00	31860.00	\N	Samuel Carter (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3056	\N	\N	45000.00	Completed	mobile number transactions	\N	2024-09-27 22:34:56	250.00	16310.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3057	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-09-28 15:03:02	100.00	6210.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3058	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-09-29 14:54:50	100.00	28110.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3059	\N	\N	150000.00	Completed	mobile number transactions	\N	2024-09-29 18:09:35	250.00	87860.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3060	\N	\N	60000.00	Completed	mobile number transactions	\N	2024-09-29 18:10:11	250.00	27610.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3061	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-09-29 18:38:20	100.00	25510.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3062	\N	\N	17500.00	Completed	mobile number transactions	\N	2024-09-29 20:52:39	250.00	7760.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3063	\N	\N	150000.00	Completed	mobile number transactions	\N	2024-09-30 09:44:33	250.00	22910.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3064	\N	\N	28000.00	Completed	mobile number transactions	\N	2024-10-02 19:22:09	250.00	79612.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3065	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-10-03 14:02:54	100.00	130512.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3066	\N	\N	100000.00	Completed	mobile number transactions	\N	2024-10-03 14:22:22	250.00	30262.00	\N	Alex Doe (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3067	\N	\N	30000.00	Completed	mobile number transactions	\N	2024-10-03 16:45:40	250.00	12.00	\N	Jane Smith (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3068	\N	\N	15000.00	Completed	mobile number transactions	\N	2024-10-03 19:57:59	250.00	8762.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3069	\N	\N	80000.00	Completed	mobile number transactions	\N	2024-10-03 20:54:41	250.00	8512.00	\N	Samuel Carter (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3070	\N	\N	25000.00	Completed	mobile number transactions	\N	2024-10-04 23:21:43	250.00	8062.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3071	\N	\N	3000.00	Completed	mobile number transactions	\N	2024-10-05 10:21:42	100.00	4962.00	\N	Robert Brown (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3072	\N	\N	18000.00	Completed	mobile number transactions	\N	2024-10-05 18:07:36	250.00	13412.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3073	\N	\N	8000.00	Completed	mobile number transactions	\N	2024-10-07 11:10:29	100.00	812.00	\N	Jane Smith (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3074	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-10-08 18:07:53	100.00	49712.00	\N	Jane Smith (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3075	\N	\N	12000.00	Completed	mobile number transactions	\N	2024-10-08 18:26:34	250.00	2962.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3076	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-10-09 22:28:45	100.00	20862.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3077	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-10-10 09:59:57	100.00	15762.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3078	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-10-10 20:55:43	100.00	135605.00	\N	Alex Doe (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3079	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-10-10 21:51:09	100.00	125505.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3080	\N	\N	40000.00	Completed	mobile number transactions	\N	2024-10-10 23:39:01	250.00	85255.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3081	\N	\N	20000.00	Completed	mobile number transactions	\N	2024-10-11 22:50:16	250.00	405.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3082	\N	\N	3000.00	Completed	mobile number transactions	\N	2024-10-12 14:36:25	100.00	7305.00	\N	Robert Brown (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3083	\N	\N	6500.00	Completed	mobile number transactions	\N	2024-10-12 15:33:07	100.00	705.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3084	\N	\N	4000.00	Completed	mobile number transactions	\N	2024-10-12 15:36:29	100.00	2605.00	\N	Linda Green (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3085	\N	\N	4000.00	Completed	mobile number transactions	\N	2024-10-13 17:12:51	100.00	2605.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3086	\N	\N	30000.00	Completed	mobile number transactions	\N	2024-10-14 11:42:13	250.00	22355.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3087	\N	\N	3000.00	Completed	mobile number transactions	\N	2024-10-14 20:11:41	100.00	9255.00	\N	Jane Smith (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3088	\N	\N	9000.00	Completed	mobile number transactions	\N	2024-10-15 17:37:56	100.00	155.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3089	\N	\N	43951.00	Completed	mobile number transactions	\N	2024-10-16 21:39:17	250.00	46950.00	\N	Samuel Carter (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3090	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-10-17 09:51:23	100.00	28050.00	\N	Linda Green (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3091	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-10-17 17:42:36	100.00	14450.00	\N	Jane Smith (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3092	\N	\N	9600.00	Completed	mobile number transactions	\N	2024-10-17 22:33:14	100.00	3750.00	\N	Robert Brown (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3093	\N	\N	22000.00	Completed	mobile number transactions	\N	2024-10-21 09:31:30	250.00	98022.00	\N	Robert Brown (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3094	\N	\N	65000.00	Completed	mobile number transactions	\N	2024-10-23 10:00:20	250.00	15772.00	\N	Jane Smith (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3095	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-10-23 10:45:56	100.00	5672.00	\N	Jane Smith (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3096	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-10-23 18:40:37	100.00	53572.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3097	\N	\N	12000.00	Completed	mobile number transactions	\N	2024-10-23 19:01:29	250.00	36822.00	\N	Robert Brown (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3098	\N	\N	3000.00	Completed	mobile number transactions	\N	2024-10-23 21:42:50	100.00	33722.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3099	\N	\N	6000.00	Completed	mobile number transactions	\N	2024-10-24 14:57:55	100.00	11122.00	\N	Jane Smith (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3100	\N	\N	500.00	Completed	mobile number transactions	\N	2024-10-24 17:06:11	20.00	9602.00	\N	Robert Brown (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3101	\N	\N	500.00	Completed	mobile number transactions	\N	2024-10-24 20:59:21	20.00	1382.00	\N	Alex Doe (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3102	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-10-25 01:56:33	100.00	16282.00	\N	Alex Doe (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3103	\N	\N	15000.00	Completed	mobile number transactions	\N	2024-10-25 05:43:18	250.00	1032.00	\N	Robert Brown (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3104	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-10-25 05:48:36	100.00	18932.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3105	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-10-26 22:54:55	100.00	39832.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3106	\N	\N	8000.00	Completed	mobile number transactions	\N	2024-10-28 08:42:39	100.00	21732.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3107	\N	\N	12000.00	Completed	mobile number transactions	\N	2024-10-28 09:56:06	250.00	9482.00	\N	Alex Doe (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3108	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-10-29 14:00:42	20.00	35262.00	\N	Alex Doe (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3109	\N	\N	30000.00	Completed	mobile number transactions	\N	2024-10-29 16:18:59	250.00	5012.00	\N	Samuel Carter (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3110	\N	\N	30000.00	Completed	mobile number transactions	\N	2024-10-31 02:49:45	250.00	6362.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3111	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-10-31 03:43:41	20.00	5342.00	\N	Linda Green (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3112	\N	\N	2400.00	Completed	mobile number transactions	\N	2024-10-31 13:31:45	100.00	2842.00	\N	Linda Green (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3113	\N	\N	30000.00	Completed	mobile number transactions	\N	2024-10-31 21:22:41	250.00	25892.00	\N	Robert Brown (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3114	\N	\N	500.00	Completed	mobile number transactions	\N	2024-10-31 21:44:15	20.00	24372.00	\N	Jane Smith (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3115	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-11-01 13:17:48	100.00	2022.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3116	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-11-01 14:05:06	100.00	11922.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3117	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-11-01 20:34:31	100.00	6822.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3118	\N	\N	18000.00	Completed	mobile number transactions	\N	2024-11-01 23:03:40	250.00	38572.00	\N	Jane Smith (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3119	\N	\N	8000.00	Completed	mobile number transactions	\N	2024-11-02 00:21:16	100.00	30472.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3120	\N	\N	6000.00	Completed	mobile number transactions	\N	2024-11-02 00:45:17	100.00	24372.00	\N	Linda Green (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3121	\N	\N	3000.00	Completed	mobile number transactions	\N	2024-11-02 02:34:59	100.00	8272.00	\N	Linda Green (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3122	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-11-02 15:14:42	20.00	15952.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3123	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-11-02 19:38:38	100.00	9352.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3124	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-11-03 02:05:56	20.00	8332.00	\N	Jane Smith (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3125	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-11-03 16:34:10	20.00	12312.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3126	\N	\N	150000.00	Completed	mobile number transactions	\N	2024-11-03 21:33:16	250.00	202062.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3127	\N	\N	15000.00	Completed	mobile number transactions	\N	2024-11-03 21:33:48	250.00	186812.00	\N	Linda Green (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3128	\N	\N	150000.00	Completed	mobile number transactions	\N	2024-11-03 21:35:26	250.00	36562.00	\N	Linda Green (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3129	\N	\N	35000.00	Completed	mobile number transactions	\N	2024-11-03 21:35:54	250.00	1312.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3130	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-11-04 10:05:32	100.00	11212.00	\N	Robert Brown (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3131	\N	\N	50000.00	Completed	mobile number transactions	\N	2024-11-04 17:21:52	250.00	7962.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3132	\N	\N	75000.00	Completed	mobile number transactions	\N	2024-11-06 12:55:54	250.00	67417.00	\N	Robert Brown (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3133	\N	\N	12000.00	Completed	mobile number transactions	\N	2024-11-06 16:09:04	250.00	51867.00	\N	Alex Doe (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3134	\N	\N	3500.00	Completed	mobile number transactions	\N	2024-11-07 14:01:14	100.00	37567.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3135	\N	\N	500.00	Completed	mobile number transactions	\N	2024-11-07 19:43:52	20.00	36047.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3136	\N	\N	15000.00	Completed	mobile number transactions	\N	2024-11-08 13:53:10	250.00	5097.00	\N	Samuel Carter (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3137	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-11-08 21:23:08	100.00	43397.00	\N	Robert Brown (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3138	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-11-08 21:45:21	20.00	32377.00	\N	Jane Smith (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3139	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-11-09 06:01:13	20.00	5357.00	\N	Samuel Carter (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3140	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-11-09 12:55:45	20.00	1137.00	\N	Linda Green (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3141	\N	\N	2500.00	Completed	mobile number transactions	\N	2024-11-09 13:40:58	100.00	2537.00	\N	Alex Doe (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3142	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-11-09 22:46:03	20.00	50822.00	\N	Samuel Carter (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3143	\N	\N	6000.00	Completed	mobile number transactions	\N	2024-11-11 20:41:38	100.00	22.00	\N	Alex Doe (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3144	\N	\N	29500.00	Completed	mobile number transactions	\N	2024-11-11 23:38:41	250.00	20272.00	\N	Alex Doe (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3145	\N	\N	15000.00	Completed	mobile number transactions	\N	2024-11-12 09:44:17	250.00	5022.00	\N	Linda Green (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3146	\N	\N	125000.00	Completed	mobile number transactions	\N	2024-11-13 23:05:35	250.00	11432.00	\N	Samuel Carter (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3147	\N	\N	150000.00	Completed	mobile number transactions	\N	2024-11-14 19:57:40	250.00	59122.00	\N	Jane Smith (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3148	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-11-14 20:01:32	100.00	54022.00	\N	Samuel Carter (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3149	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-11-14 22:30:01	100.00	8922.00	\N	Linda Green (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3150	\N	\N	600.00	Completed	mobile number transactions	\N	2024-11-15 22:16:35	20.00	202.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3151	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-11-17 21:39:51	100.00	89648.00	\N	Linda Green (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3152	\N	\N	40000.00	Completed	mobile number transactions	\N	2024-11-18 15:59:24	250.00	19898.00	\N	Robert Brown (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3153	\N	\N	30000.00	Completed	mobile number transactions	\N	2024-11-18 17:40:35	250.00	123486.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3154	\N	\N	6500.00	Completed	mobile number transactions	\N	2024-11-18 20:49:44	100.00	105586.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3155	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-11-19 10:58:08	100.00	95486.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3156	\N	\N	14000.00	Completed	mobile number transactions	\N	2024-11-19 19:51:35	250.00	81236.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3157	\N	\N	2500.00	Completed	mobile number transactions	\N	2024-11-20 11:33:46	100.00	72636.00	\N	Linda Green (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3158	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-11-20 14:02:41	100.00	22536.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3159	\N	\N	115000.00	Completed	mobile number transactions	\N	2024-11-21 11:38:00	250.00	23187.00	\N	Alex Doe (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3160	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-11-21 11:42:34	20.00	22167.00	\N	Jane Smith (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3161	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-11-21 12:47:50	100.00	7067.00	\N	Jane Smith (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3162	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-11-21 15:29:50	100.00	4967.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3163	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-11-22 00:28:28	100.00	22335.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3164	\N	\N	13000.00	Completed	mobile number transactions	\N	2024-11-22 13:31:26	250.00	9085.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3165	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-11-22 13:59:19	100.00	185.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3166	\N	\N	25000.00	Completed	mobile number transactions	\N	2024-11-23 13:42:46	250.00	111742.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3167	\N	\N	25000.00	Completed	mobile number transactions	\N	2024-11-23 13:59:46	250.00	86492.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3168	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-11-23 14:17:59	100.00	56792.00	\N	Robert Brown (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3169	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-11-23 19:58:26	100.00	51692.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3170	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-11-23 22:21:57	20.00	50672.00	\N	Jane Smith (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3171	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-11-23 22:40:29	100.00	45572.00	\N	Alex Doe (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3172	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-11-23 23:47:51	100.00	43472.00	\N	Jane Smith (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3173	\N	\N	23000.00	Completed	mobile number transactions	\N	2024-11-24 00:48:29	250.00	20222.00	\N	Linda Green (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3174	\N	\N	1100.00	Completed	mobile number transactions	\N	2024-11-24 01:02:32	100.00	19022.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3175	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-11-24 11:29:57	100.00	16922.00	\N	Robert Brown (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3176	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-11-25 21:06:38	100.00	1422.00	\N	Robert Brown (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3177	\N	\N	20000.00	Completed	mobile number transactions	\N	2024-11-26 11:33:44	250.00	31172.00	\N	Alex Doe (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3178	\N	\N	500.00	Completed	mobile number transactions	\N	2024-11-26 19:43:13	20.00	22652.00	\N	Linda Green (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3179	\N	\N	150000.00	Completed	mobile number transactions	\N	2024-11-26 22:46:34	250.00	115302.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3180	\N	\N	55000.00	Completed	mobile number transactions	\N	2024-11-26 22:48:29	250.00	60052.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3181	\N	\N	25000.00	Completed	mobile number transactions	\N	2024-11-27 13:11:00	250.00	44802.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3182	\N	\N	15000.00	Completed	mobile number transactions	\N	2024-11-27 13:11:50	250.00	29552.00	\N	Linda Green (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3183	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-11-27 18:46:20	100.00	23952.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3184	\N	\N	7000.00	Completed	mobile number transactions	\N	2024-11-28 14:42:29	100.00	48352.00	\N	Jane Smith (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3185	\N	\N	15000.00	Completed	mobile number transactions	\N	2024-11-29 00:07:23	250.00	20602.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3186	\N	\N	30000.00	Completed	mobile number transactions	\N	2024-11-29 01:10:45	250.00	9332.00	\N	Alex Doe (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3187	\N	\N	3000.00	Completed	mobile number transactions	\N	2024-11-29 02:02:43	100.00	6232.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3188	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-11-29 11:28:04	20.00	5212.00	\N	Jane Smith (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3189	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-11-30 13:19:38	20.00	10992.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3190	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-11-30 16:54:47	100.00	69142.00	\N	Samuel Carter (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3191	\N	\N	4000.00	Completed	mobile number transactions	\N	2024-11-30 18:04:22	100.00	65042.00	\N	Alex Doe (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3192	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-11-30 19:49:51	100.00	310144.00	\N	Alex Doe (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3193	\N	\N	90000.00	Completed	mobile number transactions	\N	2024-11-30 19:53:07	250.00	219894.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3194	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-12-01 11:21:56	100.00	209794.00	\N	Alex Doe (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3195	\N	\N	4000.00	Completed	mobile number transactions	\N	2024-12-01 20:55:36	100.00	205694.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3196	\N	\N	8000.00	Completed	mobile number transactions	\N	2024-12-02 13:14:34	100.00	197594.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3197	\N	\N	75000.00	Completed	mobile number transactions	\N	2024-12-02 16:13:57	250.00	122344.00	\N	Robert Brown (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3198	\N	\N	8000.00	Completed	mobile number transactions	\N	2024-12-02 17:56:03	100.00	113944.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3199	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-12-02 19:02:35	20.00	82924.00	\N	Jane Smith (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3200	\N	\N	3000.00	Completed	mobile number transactions	\N	2024-12-03 11:08:39	100.00	56524.00	\N	Samuel Carter (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3201	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-12-03 12:05:00	100.00	6424.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3202	\N	\N	15000.00	Completed	mobile number transactions	\N	2024-12-03 21:04:37	250.00	36174.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3203	\N	\N	15000.00	Completed	mobile number transactions	\N	2024-12-03 21:10:02	250.00	20924.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3204	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-12-04 18:09:13	100.00	15424.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3205	\N	\N	7000.00	Completed	mobile number transactions	\N	2024-12-05 18:00:28	100.00	23524.00	\N	Alex Doe (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3206	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-12-07 13:47:56	100.00	21424.00	\N	Jane Smith (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3207	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-12-08 16:15:08	100.00	3792.00	\N	Linda Green (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3208	\N	\N	30000.00	Completed	mobile number transactions	\N	2024-12-09 14:14:14	250.00	13242.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3209	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-12-10 13:40:14	100.00	7142.00	\N	Linda Green (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3210	\N	\N	7000.00	Completed	mobile number transactions	\N	2024-12-11 13:34:49	100.00	3042.00	\N	Alex Doe (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3211	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-12-11 14:58:47	100.00	2942.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3212	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-12-11 17:30:11	100.00	42842.00	\N	Alex Doe (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3213	\N	\N	150000.00	Completed	mobile number transactions	\N	2024-12-12 11:12:41	250.00	90392.00	\N	Linda Green (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3214	\N	\N	50000.00	Completed	mobile number transactions	\N	2024-12-12 11:13:53	250.00	40142.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3215	\N	\N	30000.00	Completed	mobile number transactions	\N	2024-12-13 13:01:29	250.00	54892.00	\N	Alex Doe (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3216	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-12-13 18:26:49	100.00	49792.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3217	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-12-13 18:55:27	100.00	39692.00	\N	Robert Brown (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3218	\N	\N	100000.00	Completed	mobile number transactions	\N	2024-12-13 19:02:31	250.00	74621.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3219	\N	\N	20000.00	Completed	mobile number transactions	\N	2024-12-13 22:32:26	250.00	54371.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3220	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-12-14 00:45:56	100.00	49271.00	\N	Linda Green (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3221	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-12-14 00:49:51	20.00	48251.00	\N	Alex Doe (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3222	\N	\N	11000.00	Completed	mobile number transactions	\N	2024-12-14 01:26:15	250.00	37001.00	\N	Alex Doe (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3223	\N	\N	2000.00	Completed	mobile number transactions	\N	2024-12-14 17:33:03	100.00	34901.00	\N	Linda Green (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3224	\N	\N	25000.00	Completed	mobile number transactions	\N	2024-12-14 17:34:36	250.00	9651.00	\N	Jane Smith (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3225	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-12-15 15:01:57	100.00	69691.00	\N	Jane Smith (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3226	\N	\N	4500.00	Completed	mobile number transactions	\N	2024-12-15 15:08:47	100.00	65091.00	\N	Jane Smith (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3227	\N	\N	9000.00	Completed	mobile number transactions	\N	2024-12-15 15:58:02	100.00	55991.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3228	\N	\N	4000.00	Completed	mobile number transactions	\N	2024-12-15 20:49:47	100.00	20191.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3229	\N	\N	200.00	Completed	mobile number transactions	\N	2024-12-16 10:56:38	20.00	4671.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3230	\N	\N	4000.00	Completed	mobile number transactions	\N	2024-12-16 12:06:53	100.00	571.00	\N	Samuel Carter (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3231	\N	\N	6000.00	Completed	mobile number transactions	\N	2024-12-17 08:28:17	100.00	129592.00	\N	Jane Smith (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3232	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-12-17 16:33:29	100.00	74742.00	\N	Samuel Carter (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3233	\N	\N	7000.00	Completed	mobile number transactions	\N	2024-12-17 18:55:46	100.00	67642.00	\N	Alex Doe (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3234	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-12-18 16:03:35	100.00	57542.00	\N	Alex Doe (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3235	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-12-19 11:46:32	100.00	26692.00	\N	Linda Green (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3236	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-12-19 13:10:34	100.00	15092.00	\N	Linda Green (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3237	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-12-19 23:04:05	100.00	9992.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3238	\N	\N	12000.00	Completed	mobile number transactions	\N	2024-12-21 00:31:54	250.00	7742.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3239	\N	\N	6000.00	Completed	mobile number transactions	\N	2024-12-21 10:22:14	100.00	1642.00	\N	Alex Doe (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3240	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-12-21 12:02:18	100.00	6542.00	\N	Alex Doe (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3241	\N	\N	1500.00	Completed	mobile number transactions	\N	2024-12-22 11:10:48	100.00	2742.00	\N	Samuel Carter (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3242	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-12-22 11:46:43	100.00	47642.00	\N	Linda Green (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3243	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-12-22 12:00:36	100.00	37542.00	\N	Robert Brown (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3244	\N	\N	700.00	Completed	mobile number transactions	\N	2024-12-22 12:43:39	20.00	36822.00	\N	Robert Brown (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3245	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-12-22 20:20:57	100.00	3832.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3246	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-12-22 20:28:31	100.00	3732.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3247	\N	\N	8500.00	Completed	mobile number transactions	\N	2024-12-22 21:50:49	100.00	5132.00	\N	Alex Doe (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3248	\N	\N	14500.00	Completed	mobile number transactions	\N	2024-12-23 02:43:29	250.00	13382.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3249	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-12-23 02:43:58	100.00	8282.00	\N	Robert Brown (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3250	\N	\N	40000.00	Completed	mobile number transactions	\N	2024-12-23 03:16:55	250.00	8032.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3251	\N	\N	54000.00	Completed	mobile number transactions	\N	2024-12-23 21:50:11	250.00	18282.00	\N	Alex Doe (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3252	\N	\N	1200.00	Completed	mobile number transactions	\N	2024-12-25 16:13:43	100.00	122834.00	\N	Alex Doe (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3253	\N	\N	7000.00	Completed	mobile number transactions	\N	2024-12-26 19:22:10	100.00	77334.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3254	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-12-27 17:24:19	100.00	38534.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3255	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-12-27 18:04:52	100.00	28434.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3256	\N	\N	31000.00	Completed	mobile number transactions	\N	2024-12-27 19:25:13	250.00	47184.00	\N	Linda Green (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3257	\N	\N	10000.00	Completed	mobile number transactions	\N	2024-12-27 21:42:52	100.00	31084.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3258	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-12-27 21:52:55	20.00	15864.00	\N	Linda Green (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3259	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-12-29 15:54:02	100.00	28764.00	\N	Linda Green (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3260	\N	\N	15700.00	Completed	mobile number transactions	\N	2024-12-30 00:51:15	250.00	8364.00	\N	Jane Smith (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3261	\N	\N	40000.00	Completed	mobile number transactions	\N	2024-12-30 00:53:18	250.00	18114.00	\N	Linda Green (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3262	\N	\N	1000.00	Completed	mobile number transactions	\N	2024-12-30 12:10:25	20.00	17094.00	\N	Alex Doe (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3263	\N	\N	150000.00	Completed	mobile number transactions	\N	2024-12-30 13:22:49	250.00	210129.00	\N	Jane Smith (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3264	\N	\N	150000.00	Completed	mobile number transactions	\N	2024-12-30 13:23:10	250.00	59879.00	\N	Linda Green (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3265	\N	\N	8000.00	Completed	mobile number transactions	\N	2024-12-30 14:10:13	100.00	51779.00	\N	Linda Green (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3266	\N	\N	3200.00	Completed	mobile number transactions	\N	2024-12-30 16:42:53	100.00	40479.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3267	\N	\N	60000.00	Completed	mobile number transactions	\N	2024-12-31 13:42:39	250.00	104712.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3268	\N	\N	11500.00	Completed	mobile number transactions	\N	2024-12-31 20:11:29	250.00	85362.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3269	\N	\N	5000.00	Completed	mobile number transactions	\N	2024-12-31 20:13:38	100.00	80262.00	\N	Linda Green (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3270	\N	\N	21000.00	Completed	mobile number transactions	\N	2025-01-01 13:38:12	250.00	45012.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3271	\N	\N	3000.00	Completed	mobile number transactions	\N	2025-01-02 14:11:06	100.00	50222.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3272	\N	\N	30000.00	Completed	mobile number transactions	\N	2025-01-02 19:32:06	250.00	5672.00	\N	Robert Brown (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3273	\N	\N	12000.00	Completed	mobile number transactions	\N	2025-01-02 19:40:23	250.00	3422.00	\N	Alex Doe (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3274	\N	\N	3600.00	Completed	mobile number transactions	\N	2025-01-02 23:15:13	100.00	8222.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3275	\N	\N	15500.00	Completed	mobile number transactions	\N	2025-01-03 20:40:45	250.00	30472.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3276	\N	\N	1000.00	Completed	mobile number transactions	\N	2025-01-04 21:32:07	20.00	12052.00	\N	Alex Doe (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3277	\N	\N	5000.00	Completed	mobile number transactions	\N	2025-01-05 13:33:24	100.00	6952.00	\N	Robert Brown (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3278	\N	\N	1500.00	Completed	mobile number transactions	\N	2025-01-05 17:15:49	100.00	121487.00	\N	Linda Green (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3279	\N	\N	103000.00	Completed	mobile number transactions	\N	2025-01-06 13:36:23	250.00	737.00	\N	Samuel Carter (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3280	\N	\N	40000.00	Completed	mobile number transactions	\N	2025-01-06 21:20:42	250.00	63299.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3281	\N	\N	15000.00	Completed	mobile number transactions	\N	2025-01-06 21:25:52	250.00	48049.00	\N	Samuel Carter (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3282	\N	\N	1500.00	Completed	mobile number transactions	\N	2025-01-06 21:29:10	100.00	46449.00	\N	Jane Smith (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3283	\N	\N	12000.00	Completed	mobile number transactions	\N	2025-01-07 15:13:59	250.00	24199.00	\N	Samuel Carter (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3284	\N	\N	4000.00	Completed	mobile number transactions	\N	2025-01-07 20:08:27	100.00	17399.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3285	\N	\N	4400.00	Completed	mobile number transactions	\N	2025-01-08 22:11:21	100.00	48399.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3286	\N	\N	80000.00	Completed	mobile number transactions	\N	2025-01-09 20:00:29	250.00	67993.00	\N	Samuel Carter (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3287	\N	\N	5000.00	Completed	mobile number transactions	\N	2025-01-10 12:56:03	100.00	52893.00	\N	Jane Smith (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3288	\N	\N	1000.00	Completed	mobile number transactions	\N	2025-01-10 21:44:11	20.00	22873.00	\N	Robert Brown (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3289	\N	\N	4000.00	Completed	mobile number transactions	\N	2025-01-13 13:32:19	100.00	32773.00	\N	Samuel Carter (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3290	\N	\N	5000.00	Completed	mobile number transactions	\N	2025-01-13 14:47:02	100.00	978850.00	\N	Linda Green (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3291	\N	\N	820000.00	Completed	mobile number transactions	\N	2025-01-13 14:47:39	1500.00	157350.00	\N	Jane Smith (250790777777)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3292	\N	\N	20000.00	Completed	mobile number transactions	\N	2025-01-14 12:16:52	250.00	101800.00	\N	Jane Smith (250789888888)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3293	\N	\N	8000.00	Completed	mobile number transactions	\N	2025-01-15 13:51:52	100.00	64400.00	\N	Samuel Carter (250791666666)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3294	\N	\N	6000.00	Completed	mobile number transactions	\N	2025-01-15 17:21:46	100.00	58300.00	\N	Jane Smith (250788999999)	Unique MoMo Id: 36521838	\N	\N	\N	\N	\N	2025-06-15 09:13:46.071475
3295	TxId: 14103506143	\N	4000.00	Completed	Power bill payments	Cash payment to MTN Cash Power	2024-05-26 13:31:07	0.00	800.00	\N	MTN Cash Power	\N	\N	\N	\N	\N	72962-79980-44699-06073	2025-06-15 09:13:50.357418
3296	TxId: 14264876273	\N	2000.00	Completed	Power bill payments	Cash payment to MTN Cash Power	2024-06-06 18:34:20	0.00	830.00	\N	MTN Cash Power	\N	\N	\N	\N	\N	06476-53398-98517-06704	2025-06-15 09:13:50.357418
3297	TxId: 14405681742	\N	1000.00	Completed	Power bill payments	Cash payment to MTN Cash Power	2024-06-16 21:06:02	0.00	1350.00	\N	MTN Cash Power	\N	\N	\N	\N	\N	40296-92192-79801-46115	2025-06-15 09:13:50.357418
3298	TxId: 14469963984	\N	2000.00	Completed	Power bill payments	Cash payment to MTN Cash Power	2024-06-21 16:48:23	0.00	640.00	\N	MTN Cash Power	\N	\N	\N	\N	\N	09779-88882-62297-78749	2025-06-15 09:13:50.357418
3299	TxId: 14540224719	\N	1000.00	Completed	Power bill payments	Cash payment to MTN Cash Power	2024-06-26 18:43:40	0.00	3910.00	\N	MTN Cash Power	\N	\N	\N	\N	\N	70836-02982-06384-28148	2025-06-15 09:13:50.357418
3300	TxId: 15507397966	\N	5000.00	Completed	Power bill payments	Cash payment to MTN Cash Power	2024-08-31 11:31:24	0.00	30670.00	\N	MTN Cash Power	\N	\N	\N	\N	\N	40189-29433-02084-41228	2025-06-15 09:13:50.357418
3301	TxId: 15611958408	\N	20000.00	Completed	Power bill payments	Cash payment to MTN Cash Power	2024-09-06 21:07:47	0.00	192990.00	\N	MTN Cash Power	\N	\N	\N	\N	\N	45758-92310-31845-02327	2025-06-15 09:13:50.357418
3302	TxId: 16016087305	\N	10000.00	Completed	Power bill payments	Cash payment to MTN Cash Power	2024-10-02 20:41:38	0.00	69612.00	\N	MTN Cash Power	\N	\N	\N	\N	\N	65361-75345-33963-16846	2025-06-15 09:13:50.357418
3303	TxId: 17140081149	\N	2000.00	Completed	Power bill payments	Cash payment to MTN Cash Power	2024-11-30 00:11:59	0.00	17012.00	\N	MTN Cash Power	\N	\N	\N	\N	\N	50919-80431-28076-85133	2025-06-15 09:13:50.357418
3304	TxId: 17344287393	\N	4000.00	Completed	Power bill payments	Cash payment to MTN Cash Power	2024-12-10 00:40:48	0.00	742.00	\N	MTN Cash Power	\N	\N	\N	\N	\N	13020-24529-63630-27675	2025-06-15 09:13:50.357418
3305	TxId: 17708814651	\N	10000.00	Completed	Power bill payments	Cash payment to MTN Cash Power	2024-12-27 11:59:42	0.00	48134.00	\N	MTN Cash Power	\N	\N	\N	\N	\N	55566-87602-29972-88164	2025-06-15 09:13:50.357418
3306	TxId: 76662021700	\N	2000.00	Successful	Received funds	Payments recieved into MoMo account	2024-05-10 16:30:58	0.00	2000.00	Jane Smith (*********013)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3307	TxId: 43668074924	\N	25000.00	Successful	Received funds	Payments recieved into MoMo account	2024-05-14 20:58:35	0.00	29060.00	Samuel Carter (*********013)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3308	TxId: 45738348638	\N	1400.00	Successful	Received funds	Payments recieved into MoMo account	2024-05-19 01:49:16	0.00	4590.00	Linda Green (*********704)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3309	TxId: 90281203550	\N	200.00	Successful	Received funds	Payments recieved into MoMo account	2024-05-29 14:00:58	0.00	1600.00	Linda Green (*********691)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3310	TxId: 41002852845	\N	12000.00	Successful	Received funds	Payments recieved into MoMo account	2024-06-07 16:10:36	0.00	17310.00	Alex Doe (*********612)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3311	TxId: 43960900475	\N	5000.00	Successful	Received funds	Payments recieved into MoMo account	2024-06-18 14:08:13	0.00	14110.00	Linda Green (*********806)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3312	TxId: 63115508240	\N	3700.00	Successful	Received funds	Payments recieved into MoMo account	2024-06-19 20:26:06	0.00	7510.00	Samuel Carter (*********090)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3313	TxId: 90311838363	\N	1500.00	Successful	Received funds	Payments recieved into MoMo account	2024-06-21 13:44:53	0.00	4140.00	Samuel Carter (*********612)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3314	TxId: 72288050689	\N	1500.00	Successful	Received funds	Payments recieved into MoMo account	2024-06-23 12:15:54	0.00	15620.00	Samuel Carter (*********711)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3315	TxId: 65226318623	\N	1000.00	Successful	Received funds	Payments recieved into MoMo account	2024-06-30 19:15:35	0.00	4590.00	Samuel Carter (*********711)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3316	TxId: 12528494674	\N	170.00	Successful	Received funds	Payments recieved into MoMo account	2024-07-10 23:47:18	0.00	840.00	Jane Smith (*********711)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3317	TxId: 21296060708	\N	300.00	Successful	Received funds	Payments recieved into MoMo account	2024-07-20 21:20:48	0.00	3210.00	Linda Green (*********711)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3318	TxId: 65203206628	\N	4000.00	Successful	Received funds	Payments recieved into MoMo account	2024-09-01 19:32:27	0.00	13370.00	Samuel Carter (*********055)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3319	TxId: 67974931091	\N	200000.00	Successful	Received funds	Payments recieved into MoMo account	2024-09-06 19:06:25	0.00	216090.00	Samuel Carter (*********726)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3320	TxId: 14513684578	\N	50.00	Successful	Received funds	Payments recieved into MoMo account	2024-09-06 21:11:16	0.00	193040.00	Robert Brown (*********711)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3321	TxId: 11967814854	\N	1300.00	Successful	Received funds	Payments recieved into MoMo account	2024-09-13 22:55:42	0.00	6340.00	Robert Brown (*********711)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3322	TxId: 93881514225	\N	5000.00	Successful	Received funds	Payments recieved into MoMo account	2024-09-19 21:17:55	0.00	42530.00	Linda Green (*********711)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3323	TxId: 35450739966	\N	15000.00	Successful	Received funds	Payments recieved into MoMo account	2024-09-22 15:45:41	0.00	32850.00	Jane Smith (*********711)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3324	TxId: 75401767322	\N	10000.00	Successful	Received funds	Payments recieved into MoMo account	2024-09-25 01:23:12	0.00	24080.00	Jane Smith (*********696)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3325	TxId: 10730013424	\N	93252.00	Successful	Received funds	Payments recieved into MoMo account	2024-10-02 15:35:51	0.00	109362.00	Linda Green (*********683)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3326	TxId: 22096990635	\N	82000.00	Successful	Received funds	Payments recieved into MoMo account	2024-10-02 23:10:58	0.00	140612.00	Robert Brown (*********202)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3327	TxId: 60978680783	\N	132443.00	Successful	Received funds	Payments recieved into MoMo account	2024-10-10 16:50:10	0.00	148205.00	Linda Green (*********973)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3328	TxId: 66464178798	\N	132996.00	Successful	Received funds	Payments recieved into MoMo account	2024-10-16 10:00:12	0.00	133151.00	Jane Smith (*********973)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3329	TxId: 29637659542	\N	20000.00	Successful	Received funds	Payments recieved into MoMo account	2024-10-18 23:00:25	0.00	26250.00	Alex Doe (*********721)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3330	TxId: 50533019574	\N	133072.00	Successful	Received funds	Payments recieved into MoMo account	2024-10-20 18:56:29	0.00	133072.00	Linda Green (*********973)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3331	TxId: 80264064542	\N	50000.00	Successful	Received funds	Payments recieved into MoMo account	2024-10-23 09:59:09	0.00	81022.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3332	TxId: 27880925520	\N	50000.00	Successful	Received funds	Payments recieved into MoMo account	2024-10-23 16:43:10	0.00	55672.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3333	TxId: 10412500030	\N	20000.00	Successful	Received funds	Payments recieved into MoMo account	2024-10-25 00:33:08	0.00	21382.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3334	TxId: 81660358206	\N	20000.00	Successful	Received funds	Payments recieved into MoMo account	2024-10-25 05:48:06	0.00	21032.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3335	TxId: 11060379377	\N	4000.00	Successful	Received funds	Payments recieved into MoMo account	2024-10-25 23:10:58	0.00	22932.00	Robert Brown (*********711)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3336	TxId: 93824792341	\N	50000.00	Successful	Received funds	Payments recieved into MoMo account	2024-10-26 21:52:08	0.00	50932.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3337	TxId: 74467206314	\N	10000.00	Successful	Received funds	Payments recieved into MoMo account	2024-11-05 21:55:10	0.00	10212.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3338	TxId: 26843508772	\N	133855.00	Successful	Received funds	Payments recieved into MoMo account	2024-11-06 12:54:40	0.00	142667.00	Samuel Carter (*********683)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3339	TxId: 97375149913	\N	66305.00	Successful	Received funds	Payments recieved into MoMo account	2024-11-09 20:11:59	0.00	68842.00	Robert Brown (*********683)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3340	TxId: 67973089801	\N	27800.00	Successful	Received funds	Payments recieved into MoMo account	2024-11-10 01:03:41	0.00	78622.00	Linda Green (*********711)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3341	TxId: 91027288469	\N	134160.00	Successful	Received funds	Payments recieved into MoMo account	2024-11-13 23:03:53	0.00	136682.00	Robert Brown (*********683)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3342	TxId: 60464892197	\N	201940.00	Successful	Received funds	Payments recieved into MoMo account	2024-11-14 19:56:53	0.00	209372.00	Samuel Carter (*********683)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3343	TxId: 35179537922	\N	134346.00	Successful	Received funds	Payments recieved into MoMo account	2024-11-17 13:12:13	0.00	135748.00	Jane Smith (*********683)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3344	TxId: 81939407545	\N	134438.00	Successful	Received funds	Payments recieved into MoMo account	2024-11-18 17:39:15	0.00	153736.00	Samuel Carter (*********683)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3345	TxId: 55787996640	\N	134901.00	Successful	Received funds	Payments recieved into MoMo account	2024-11-21 11:37:04	0.00	138437.00	Robert Brown (*********683)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3346	TxId: 71572076549	\N	134468.00	Successful	Received funds	Payments recieved into MoMo account	2024-11-21 20:56:02	0.00	135435.00	Alex Doe (*********683)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3347	TxId: 34697085121	\N	1200.00	Successful	Received funds	Payments recieved into MoMo account	2024-11-22 13:58:31	0.00	10285.00	Alex Doe (*********711)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3348	TxId: 52261254503	\N	134591.00	Successful	Received funds	Payments recieved into MoMo account	2024-11-23 13:41:08	0.00	136992.00	Robert Brown (*********683)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3349	TxId: 38740551775	\N	10000.00	Successful	Received funds	Payments recieved into MoMo account	2024-11-27 08:18:08	0.00	70052.00	Jane Smith (*********223)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3350	TxId: 55628760506	\N	11000.00	Successful	Received funds	Payments recieved into MoMo account	2024-11-29 23:15:25	0.00	19012.00	Robert Brown (*********013)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3351	TxId: 36071803053	\N	271202.00	Successful	Received funds	Payments recieved into MoMo account	2024-11-30 19:46:21	0.00	320244.00	Linda Green (*********683)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3352	TxId: 64379934012	\N	135179.00	Successful	Received funds	Payments recieved into MoMo account	2024-12-13 19:00:34	0.00	174871.00	Jane Smith (*********683)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3353	TxId: 96265284937	\N	135140.00	Successful	Received funds	Payments recieved into MoMo account	2024-12-14 23:18:31	0.00	135291.00	Linda Green (*********683)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3354	TxId: 56170688559	\N	8000.00	Successful	Received funds	Payments recieved into MoMo account	2024-12-15 16:02:38	0.00	63991.00	Samuel Carter (*********613)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3355	TxId: 25634019489	\N	21800.00	Successful	Received funds	Payments recieved into MoMo account	2024-12-15 16:04:14	0.00	54791.00	Samuel Carter (*********711)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3356	TxId: 31316222684	\N	135121.00	Successful	Received funds	Payments recieved into MoMo account	2024-12-17 08:19:50	0.00	135692.00	Linda Green (*********683)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3357	TxId: 97521447595	\N	27000.00	Successful	Received funds	Payments recieved into MoMo account	2024-12-23 21:48:43	0.00	42532.00	Alex Doe (*********090)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3358	TxId: 38286062599	\N	135852.00	Successful	Received funds	Payments recieved into MoMo account	2024-12-24 22:58:44	0.00	154134.00	Samuel Carter (*********683)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3359	TxId: 19512741503	\N	10000.00	Successful	Received funds	Payments recieved into MoMo account	2024-12-26 00:01:10	0.00	132834.00	Robert Brown (*********711)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3360	TxId: 60612987867	\N	343285.00	Successful	Received funds	Payments recieved into MoMo account	2024-12-30 13:21:58	0.00	360379.00	Linda Green (*********683)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3361	TxId: 42280278088	\N	135983.00	Successful	Received funds	Payments recieved into MoMo account	2024-12-31 13:42:14	0.00	164962.00	Jane Smith (*********683)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3362	TxId: 11336164483	\N	500.00	Successful	Received funds	Payments recieved into MoMo account	2024-12-31 20:09:02	0.00	97112.00	Robert Brown (*********711)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3363	TxId: 66251081197	\N	343136.00	Successful	Received funds	Payments recieved into MoMo account	2025-01-02 14:00:10	0.00	376348.00	Robert Brown (*********683)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3364	TxId: 31288108568	\N	136135.00	Successful	Received funds	Payments recieved into MoMo account	2025-01-05 16:47:35	0.00	143087.00	Linda Green (*********683)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3365	TxId: 30614825696	\N	74312.00	Successful	Received funds	Payments recieved into MoMo account	2025-01-06 20:13:05	0.00	103549.00	Linda Green (*********683)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3366	TxId: 29067172393	\N	136044.00	Successful	Received funds	Payments recieved into MoMo account	2025-01-09 19:59:54	0.00	148243.00	Robert Brown (*********683)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3367	TxId: 81626212197	\N	8000.00	Successful	Received funds	Payments recieved into MoMo account	2025-01-10 21:40:30	0.00	56393.00	Robert Brown (*********711)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3368	TxId: 88289015616	\N	964177.00	Successful	Received funds	Payments recieved into MoMo account	2025-01-13 14:40:49	0.00	986950.00	Jane Smith (*********683)	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:52.279307
3369	TxId: 14098463509	\N	20000.00	Completed	withdrawal from agents	Withdrawal done through momo agent	2024-05-26 02:10:34	350.00	6400.00	\N	\N	\N	\N	\N	Agent Sophia (250790777777)	Abebe Chala CHEBUDIE *********036	\N	2025-06-15 09:13:57.104884
3370	TxId: 17006777609	\N	50000.00	Completed	withdrawal from agents	Withdrawal done through momo agent	2024-11-23 13:23:52	1100.00	2401.00	\N	\N	\N	\N	\N	Agent Sophia (250788999999)	Abebe Chala CHEBUDIE *********036	\N	2025-06-15 09:13:57.104884
3371	TxId: 17007580507	\N	24000.00	Completed	withdrawal from agents	Withdrawal done through momo agent	2024-11-23 14:09:44	600.00	61892.00	\N	\N	\N	\N	\N	Agent John (250788999999)	Abebe Chala CHEBUDIE *********036	\N	2025-06-15 09:13:57.104884
3372	TxId: 14324965479	N/A	2000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-06-11 06:26:21	0.00	350.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3373	TxId: 14443130677	N/A	2000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-06-19 18:16:29	0.00	3810.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3374	TxId: 14569120894	N/A	2000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-06-28 18:00:50	0.00	30170.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3375	TxId: 14655104674	N/A	500.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-07-04 14:03:03	0.00	220.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3376	TxId: 14756781450	N/A	500.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-07-11 09:25:58	0.00	340.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3377	TxId: 14807754878	17209629782498301	2000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-07-14 15:19:25	0.00	27570.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3378	TxId: 14909215103	N/A	200.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-07-21 18:19:32	0.00	60.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3379	TxId: 14940294542	N/A	500.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-07-23 21:22:23	0.00	40.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3380	TxId: 14969968017	N/A	2000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-07-26 00:11:15	0.00	2000.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3381	TxId: 15064161618	N/A	3000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-08-01 13:23:53	0.00	24960.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3382	TxId: 15070248766	N/A	500.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-08-01 19:03:51	0.00	210.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3383	TxId: 15097735991	N/A	1000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-08-03 16:42:18	0.00	4940.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3384	TxId: 15126906031	N/A	200.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-08-05 17:15:31	0.00	90.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3385	TxId: 15146128209	N/A	1000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-08-06 20:22:17	0.00	290.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3386	TxId: 15178525743	N/A	1000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-08-08 21:19:23	0.00	5170.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3387	TxId: 15475262766	N/A	5000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-08-29 09:30:41	0.00	6260.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3388	TxId: 15606505500	17256333763041376	5000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-09-06 16:38:06	0.00	890.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3389	TxId: 15681666953	N/A	3000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-09-11 15:44:02	0.00	11330.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3390	TxId: 15783543056	N/A	5000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-09-18 14:17:18	0.00	12850.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3391	TxId: 15930732191	17275220792115073	5000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-09-28 13:16:19	0.00	11310.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3392	TxId: 16040688508	17280230723010910	5000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-10-04 08:28:23	0.00	3512.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3393	TxId: 16181431637	17286575112418450	5000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-10-11 16:39:23	0.00	24655.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3394	TxId: 16211799078	N/A	3000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-10-13 09:37:58	0.00	25605.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3395	TxId: 16269196928	17290684883032395	5000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-10-16 10:48:39	0.00	128151.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3396	TxId: 16356106165	17294511812484189	10000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-10-20 21:08:53	0.00	122472.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3397	TxId: 16684572153	17309248153046681	5000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-11-06 22:27:43	0.00	41167.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3398	TxId: 16811450681	17314963852425107	5000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-11-13 13:13:56	0.00	7022.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3399	TxId: 16813007600	N/A	2000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-11-13 14:45:32	0.00	5022.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3400	TxId: 16870426837	17317556402493740	10000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-11-16 13:15:06	0.00	10202.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3401	TxId: 17146971568	17329636532769188	5000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-11-30 12:49:49	0.00	12012.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3402	TxId: 17194680435	17331559272498010	10000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-12-02 18:12:35	0.00	103944.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3403	TxId: 17417124626	N/A	3000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-12-13 16:30:17	0.00	51892.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3404	TxId: 17469774285	17343322613083864	10000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-12-16 09:01:30	0.00	10191.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3405	TxId: 17725876735	17353657322483063	10000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2024-12-28 08:03:06	0.00	5864.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3406	TxId: 18044804543	17366843252778824	5000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2025-01-12 14:20:54	0.00	17873.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3407	TxId: 18064613724	N/A	3000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2025-01-13 14:43:05	0.00	983950.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
3408	TxId: 18087757600	17368685383021954	10000.00	Completed	Bundle purchase	Payment for bundles and pack (Data, etc)	2025-01-14 17:29:43	0.00	88000.00	\N	\N	\N	\N	\N	\N	\N	\N	2025-06-15 09:13:59.731263
\.


--
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: eke
--

SELECT pg_catalog.setval('public.transactions_id_seq', 3408, true);


--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: eke
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: transactions transactions_transaction_id_key; Type: CONSTRAINT; Schema: public; Owner: eke
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_transaction_id_key UNIQUE (transaction_id);


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES TO eke;


--
-- Name: DEFAULT PRIVILEGES FOR TYPES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES TO eke;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS TO eke;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES TO eke;


--
-- PostgreSQL database dump complete
--

